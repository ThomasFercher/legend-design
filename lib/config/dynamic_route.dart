import 'package:flutter/material.dart';
import 'package:legend_design_core/router/scaffold_route_info.dart';

class DynamicRoute {
  static List<PageInfo> generateDynamicRoutes<T>({
    required ScaffoldRouteConfig config,
    required Widget Function(T config) base,
    required List<PageModel<T>> models,
  }) {
    return [
      for (PageModel<T> m in models)
        fromModel<T>(
          m,
          config,
          (argument) => base(argument),
        )
    ];
  }

  static PageInfo fromModel<T>(
    PageModel<T> m,
    ScaffoldRouteConfig config,
    Widget Function(T config) base,
  ) {
    return PageInfo(
      config: config,
      name: m.name,
      title: "",
      page: base(m.value),
      children: m.children?.map(
        (e) => fromModel(
          e,
          config,
          base,
        ),
      ),
    );
  }
}

class PageModel<T> {
  final String name;
  final T value;
  final List<PageModel<T>>? children;

  PageModel(
    this.name,
    this.value, {
    this.children,
  });
}
