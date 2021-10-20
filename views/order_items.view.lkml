view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Break down by 0 year"
      value: "0"
    }
    allowed_value: {
      label: "Break down by 1 year"
      value: "1"
    }
    allowed_value: {
      label: "Break down by 2 year"
      value: "2"
    }
    allowed_value: {
      label: "Break down by 3 year"
      value: "3"
    }

  }

  dimension: date {
    sql:
    {% if date_granularity._parameter_value == '0' %}

      ${returned_date}

    {% elsif date_granularity._parameter_value == '1' %}

      DATE_SUB(CAST(${returned_date} AS DATE) ,INTERVAL 1 YEAR )

    {% elsif date_granularity._parameter_value == '2' %}

      DATE_SUB(CAST(${returned_date} AS DATE) ,INTERVAL 2 YEAR )

    {% else %}

       DATE_SUB(CAST(${returned_date} AS DATE) ,INTERVAL 3 YEAR )

    {% endif %};;
  }

  dimension: con_null {
    type: string
    sql: COALESCE(${returned_date}, "THIS IS NULL");;
    html:  {% if value == 'THIS IS NULL' %}
           <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
           {% endif %};;
    }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
