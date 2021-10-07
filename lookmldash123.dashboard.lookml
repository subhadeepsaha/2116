- dashboard: ConvertlookML
  title: DD3
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: map
    name: map
    model: ecommerce_subhadeep
    explore: order_items
    type: looker_map
    fields: [users.state_html_link, users.count, users.zip]
    sorts: [users.state_html_link]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: Running total(Orders Count),
        value_format: !!null '', value_format_name: Default formatting, calculation_type: running_total,
        table_calculation: running_totalorders_count, args: [orders.count], _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: 'running_total(${orders.count})',
        label: Orders count run tot, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: orders_count_run_tot, _type_hint: number,
        is_disabled: true}, {args: [orders.count], calculation_type: running_total,
        category: table_calculation, based_on: orders.count, label: Running total
          of Orders Count, source_field: orders.count, table_calculation: running_total_of_orders_count,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: 'sum(${users.count})',
        label: sum row in data tab, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: sum_row_in_data_tab, _type_hint: number,
        is_disabled: true}]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 0
    col: 0
    width: 9
    height: 10
  - title: map
    name: map (2)
    model: ecommerce_subhadeep
    explore: users
    type: looker_map
    fields: [users.link, users.zip, users.state]
    sorts: [users.link desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map_latitude: 34.74161249883172
    map_longitude: -110.46752929687501
    map_zoom: 6
    row: 0
    col: 9
    width: 15
    height: 10
  - title: New Tile
    name: New Tile
    model: ecommerce_subhadeep
    explore: order_items
    type: looker_line
    fields: [users.count, users.state, products.count, orders.count, order_items.count]
    filters:
      users.state: Alabama,Alaska,Arizona,Arkansas,California,Colorado,Connecticut,Delaware,District
        of Columbia,Florida,Georgia,Idaho,Illinois,Indiana,Iowa,Kansas
      orders.status: ''
      users.count: "<3000"
      products.count: "<3000"
      orders.count: "<3000"
      order_items.count: "<3000"
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: Running total(Orders Count),
        value_format: !!null '', value_format_name: Default formatting, calculation_type: running_total,
        table_calculation: running_totalorders_count, args: [orders.count], _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: 'running_total(${orders.count})',
        label: Orders count run tot, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: orders_count_run_tot, _type_hint: number,
        is_disabled: true}, {args: [orders.count], calculation_type: running_total,
        category: table_calculation, based_on: orders.count, label: Running total
          of Orders Count, source_field: orders.count, table_calculation: running_total_of_orders_count,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: users.count, id: users.count,
            name: Users}, {axisId: products.count, id: products.count, name: Products},
          {axisId: orders.count, id: orders.count, name: Orders}, {axisId: order_items.count,
            id: order_items.count, name: Order Items}], showLabels: true, showValues: true,
        maxValue: 7000, minValue: 0, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      users.count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_value_format:
      users.count:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 10
    col: 0
    width: 6
    height: 5
