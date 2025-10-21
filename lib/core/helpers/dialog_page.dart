import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogPage<T> extends CustomTransitionPage<T> {
  DialogPage({required WidgetBuilder builder})
    : super(
        barrierColor: Colors.black54,
        barrierDismissible: true,
        opaque: false,
        transitionDuration: const Duration(milliseconds: 200),
        child: Builder(builder: builder),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: child,
          );
        },
      );
}
