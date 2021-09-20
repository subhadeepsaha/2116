view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  parameter: Product_ID {
    type: string{
      allowed_value: {
        label: "Less than 1000"
        value: "<1000"
      }
      allowed_value: {
        label: "Less than 5000"
        value: "<5000"
      }
      allowed_value: {
        label: "All result"
        value: ">0"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
