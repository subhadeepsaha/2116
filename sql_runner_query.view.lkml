view: sql_runner_query {
  derived_table: {
    sql: SELECT
          `inventory_items`.`product_id` AS `inventory_items.product_id`,
          GROUP_CONCAT(`orders`.`status`) AS `orders.status`
      FROM
          `demo_db`.`order_items` AS `order_items`
          LEFT JOIN `demo_db`.`orders` AS `orders` ON `order_items`.`order_id` = `orders`.`id`
          LEFT JOIN `demo_db`.`inventory_items` AS `inventory_items` ON `order_items`.`inventory_item_id` = `inventory_items`.`id`
      GROUP BY
          1
      ORDER BY
          `inventory_items`.`product_id`
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: inventory_items_product_id {
    type: number
    sql: ${TABLE}.`inventory_items.product_id` ;;
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  set: detail {
    fields: [inventory_items_product_id, orders_status]
  }
}
