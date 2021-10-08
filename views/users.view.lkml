view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }



  dimension: country1 {
    type: string
    drill_fields: [city,state]
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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
  dimension: yesno {
    type: yesno
    sql: ${age} = 'f'
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    hidden: yes
    sql: ${TABLE}.state ;;
  }


  dimension: state_html_link {

    type: string
    sql: ${TABLE}.state ;;
    html: <a href= "https://www.google.com/search?q={{value}}" >{{value}} </a>;;

  }


  dimension: state_link_parameter {

    type: string
    sql: ${TABLE}.state ;;
    link: {
      label: "Search in Google "
      url: "https://www.google.com/search?q={{value}}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: State_colour {

    type: string
    sql: ${TABLE}.state ;;
    html:
    {% if value == "Alabama" %}
          <p style="color: black; background-color: lightblue; font-size:100%; text-align:center"> {{rendered_value}} </p>
        {% elsif value == "California" %}
          <p style="color: black; background-color: #B9C1BD; font-size:100%; text-align:lef"> {{rendered_value}} </p>
        {% else %}
          <p style="color: black; background-color: #FFD6D6; font-size:100%; text-align:right"> {{rendered_value}} </p>
        {% endif %};;


  }



  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: link {
    type: number
    sql: ${count} ;;
    link: {
      label: "explore by {{ state }}"
      url: "https://lookerv2116.dev.looker.com/explore/ecommerce_subhadeep/order_items?qid=5R0rYvRJ7pSPoHixu8HyiP&origin_space=85&toggle=vis"
    }
    link: {
      label: "Drill Dashboard {{ state }}"
      url: "https://lookerv2116.dev.looker.com/dashboards-next/58?&f[users.state]={{ value }}"
  }
  }

  measure: count {
    hidden: yes
    type: count

  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
  }
