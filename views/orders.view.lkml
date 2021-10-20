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
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: sad {
    type:  string
    sql: ${status1} != 'complete' ;;
  }
  dimension: status1 {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: count_confirm_applicant_address2 {
#label: "2. Count Confirm Applicant Address"
    description: "The number of applications that have entered confirm address stage."
    type: count
#group_label: "VER - Funnel Counts"
    #filters: {
      #field: confirm_applicant_address
      #value: "Yes"
    }
  measure: 1hai1 {
    type: count
    #label: "1hai"
    #group_label: "funnelchart"
    filters: [status1: "cancelled"]
  }
  measure: 2hai {
    type: count
    filters: [status1: "cancelled"]
    #label: "2hai"
    #group_label: "funnelchart"
  }
  parameter: Status_granularity{
    type: string
    allowed_value: {
      label: "Cancelled count"
      value: "cancelled"
    }
    allowed_value: {
      label: "Complete count"
      value: "complete"
    }
    allowed_value: {
      label: "Pending count"
      value: "pending"
    }
  }
 #
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
