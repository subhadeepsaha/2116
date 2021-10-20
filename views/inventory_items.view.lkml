view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.id, products.item_name, order_items.count]
  }
  measure: Sumcost {
    type: sum
    sql: ${cost} - 500;;
  }
  measure: Sum_cost {
    type: sum
    sql: ${cost};;
  }
  measure: Cost_distinct {
    type: count_distinct
    sql: ${cost} - 500;;
  }
  parameter: Aggregating_sum_cost {
    type: string
    allowed_value: {
      value: "sum"
    }
    allowed_value: {
      value: "average"
    }
  }

  measure: aggregates {
    sql:
    {% if Aggregating_sum_cost._parameter_value == "'sum'" %}
      ${Sumcost}
    {% else %}
      ${Cost_distinct}
    {% endif %};;
  }
}
