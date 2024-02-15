import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget MobileViews;
  final Widget DesktopView;
  final Widget TabView;
  const ResponsiveLayout(
      {super.key,
      required this.MobileViews,
      required this.DesktopView,
      required this.TabView});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return widget.MobileViews;
        } else if (constraints.maxWidth < 900) {
          return widget.TabView;
        } else {
          return widget.DesktopView;
        }
      },
    );
  }
}
