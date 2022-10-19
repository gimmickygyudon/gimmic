import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadePage extends CustomTransitionPage {
  FadePage({
    required LocalKey key,
    required Widget child
  }) : super(
         key: key,
         transitionDuration: const Duration(milliseconds: 600),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeThroughTransition(
            animation: animation, 
            secondaryAnimation: secondaryAnimation, 
            child: child
          );
         },
         child: child,
    );
}

class SharedAxisPage extends CustomTransitionPage {
  SharedAxisPage({
    required LocalKey key,
    required Widget child,
    required Duration duration,
    required SharedAxisTransitionType transitionType
  }) : super(
         key: key,
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            animation: animation, 
            secondaryAnimation: secondaryAnimation, 
            transitionType: transitionType,
            child: child
          );
         },
         child: child,
    );
}

class SlideInPage extends CustomTransitionPage {
  SlideInPage({
    required LocalKey key,
    required Widget child,
    required Duration duration,
  }) : super(
         key: key,
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0, 1, curve: Curves.fastOutSlowIn)
              )
            );
            return SlideTransition(
              position: tween,
              child: child,
            );
         },
         child: child,
    );
}

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
          transitionDuration: const Duration(seconds: 2),
        );
}
