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

  dimension: video {

    type: string

    sql: 'https://www.w3schools.com/html/mov_bbb.mp4' ;;

    html: <video width="1290" height="130" controls preload="none"> <controls> <source src="{{ value }}" type="video/mp4"> </video> ;;

  }

measure: running_total_sales_price {
  type: running_total
  sql: ${sale_price} ;;
  value_format: "$#.00;($#.00)"
}

measure: largest_order {
  type: max
  sql: ${sale_price} ;;
  value_format: "$0.00"
}


measure: minimum_order {
  type: min
  sql: ${sale_price} ;;
  value_format: "$#.00;($#.00)"
}


  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
  }

  measure: average_distinct_sale_price {
    type: number
    sql: ${sale_price};;

  }

measure: median_order {
  type: median
  sql: ${sale_price} ;;
  value_format: "$#,##0.00"
}


measure: cumulative_total_revenue {
  type: running_total
  sql: ${total_revenue} ;;
  value_format: "$#,##0.00"
}


measure: total_revenue {
  type: sum
  sql: ${sale_price} ;;
  value_format: "#,##0.00"
}

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
