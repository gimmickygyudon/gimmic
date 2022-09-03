import 'package:flutter/material.dart';

class SlideInRoute extends PageRouteBuilder {
  final Widget page;

  SlideInRoute({required this.page, required String routeName})
      : super(
          settings: RouteSettings(name: routeName), // set name here
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(0, 1);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end).animate(CurvedAnimation(
                parent: animation,
                curve: const Interval(
                  0,
                  1,
                  curve: Curves.fastOutSlowIn,
                )));
            return SlideTransition(
              position: tween,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
}
