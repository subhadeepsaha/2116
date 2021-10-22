view: pdt_orders {
  derived_table: {
    sql:
        SELECT *

        FROM demo_db.orders AS orders

        WHERE  {% condition date_filter %} orders.created_at {% endcondition %} ;;
  }

  filter: date_filter {
    type: date
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: timeframe_selector {
    type: string
    allowed_value: {label: "Month Name" value: "month_name"}
    allowed_value: {label: "Year"       value: "year"}
    allowed_value: {label: "Date"       value: "date"}
  }

  dimension: dynamic_timeframe {
    sql:
        {% if timeframe_selector._parameter_value == "'month_name'" %}
            ${created_at_month_name}
        {% elsif timeframe_selector._parameter_value == "'year'" %}
            ${created_at_year}
        {% else %}
            ${created_at_date}
        {% endif %};;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension_group: created_at {
    type: time
    timeframes: [date, day_of_month, month, month_name, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  set: detail {
    fields: [id, created_at_date, user_id, status]
  }
}
