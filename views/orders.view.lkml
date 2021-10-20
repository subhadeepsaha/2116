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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    html: {% if value == 'cancelled' %}
    <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'complete' %}
    <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
    ;;
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
  dimension: Statuscount {
    sql:
    {% if Status_granularity._parameter_value == 'cancelled' %}
      ${status}
    {% elsif Status_granularity._parameter_value == 'complete' %}
      ${status}
    {% else %}
      ${status}
    {% endif %};;
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
