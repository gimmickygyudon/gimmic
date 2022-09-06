import 'package:flutter/material.dart';
import 'package:gimmic/src/page/homepage.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({super.key, required this.title});
  final String title;

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  @override
  Widget build(BuildContext context) {
    return LayoutDesktop();
  }
}
