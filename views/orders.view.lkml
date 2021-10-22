view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;


  }

  # My customized timeframes, added under the group "Created"


  dimension: date_formatted {
    group_label: "Created" label: "Date_Formatted"
    sql:${created_date}  ;;
    html: {{rendered_value | date : "%b %d %y " }} ;;

  }

dimension: week_formatted {
  group_label: "Created" label: "Week_Formatted"
  sql: ${created_week} ;;
  html: {{rendered_value | date : "Week %U (%b %d)" }} ;;
}


  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }




dimension: test {
  type: string
  sql: "@#$udguhgdjx" ;;
}


measure: most_recent_order_date {
  type: date
  sql: max(${created_date}) ;;
  convert_tz: no
}


measure: count_growth {
  label: "Percentage of previous count Growth"
  type: percent_of_previous
  sql: ${count} ;;
}

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      ten_million_orders.count
    ]
  }
}
