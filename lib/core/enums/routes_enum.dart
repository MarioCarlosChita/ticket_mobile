import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  lobby('/lobby_screen'),
  login('/'),
  profile('/profile_screen');

  const Routes(this.path);
  final String path;

  /// Shortcut for `context.go()`
  void go(BuildContext context, {Object? extra}) => context.go(
        path,
        extra: extra,
      );

  /// Shortcut for `context.push()`
  void push(BuildContext context, {Object? extra}) => context.push(
        path,
        extra: extra,
      );

  /// Shortcut for `context.pushReplacement()`
  void pushReplacement(BuildContext context, {Object? extra}) =>
      context.pushReplacement(
        path,
        extra: extra,
      );
}
