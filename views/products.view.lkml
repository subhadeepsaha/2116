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

dimension: brand_logo {
  type: string
  sql: ${brand} ;;
  html:
    {% if brand._value=="Calvin Klein" %}
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Calvin_klein_logo.svg/220px-Calvin_klein_logo.svg.png">
        {% elsif brand._value == "Hanes" %}
        <img src="https://upload.wikimedia.org/wikipedia/en/thumb/f/f0/Hanes-logo.svg/150px-Hanes-logo.svg.png">
        {% elsif brand._value == "Tommy Hilfiger"%}
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tommy_hilfig_vectorlogo.svg/250px-Tommy_hilfig_vectorlogo.svg.png">
        {% else %}
        <img src="https://icon-library.net/images/no-image-available-icon/no-image-available-icon-6.jpg" height="250" width="300">
        {% endif %} ;;

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


  measure: category_list {
    type: string
    sql: GROUP_CONCAT(${category}) ;;
  }

measure: count_sku {
  type: count_distinct
  sql: ${sku} ;;
}

  measure: product_count {
    type: count

      drill_fields: [id, item_name, inventory_items.count]

  }
}
