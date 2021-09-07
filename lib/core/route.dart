import 'package:flutter/material.dart';

class Routes {
  late GlobalKey<NavigatorState> navigationKey;
  static Routes instance = Routes();

  Routes() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<T?> pushNamed<T>(String name) {
    return navigationKey.currentState!.pushNamed(name);
  }

  Future<T?> push<T>(Widget widget) {
    return navigationKey.currentState!
        .push(MaterialPageRoute(builder: (_) => widget));
  }

  Future<T?> pushReplaceAll<T>(Widget widget) {
    return navigationKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => widget),
        (Route<dynamic> route) => false);
  }

  Future<T?> pushNamedReplaceAll<T>(String name) {
    return navigationKey.currentState!
        .pushNamedAndRemoveUntil(name, (Route<dynamic> route) => false);
  }

  Future<T?> pushReplacement<T>(Widget widget) {
    return navigationKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (_) => widget));
  }

  void pop<T extends Object>([T? result]) {
    return navigationKey.currentState!.pop(result);
  }

  Future<T?> pushMaterial<T>(Route<T> route) {
    return navigationKey.currentState!.push(route);
  }

  Future<T?> pushReplacementMaterial<T>(Route<T> route) {
    return navigationKey.currentState!.pushReplacement(route);
  }

  Future<T?> pushReplaceAllMaterial<T>(Route<T> route) {
    return navigationKey.currentState!
        .pushAndRemoveUntil(route, (Route<dynamic> r) => false);
  }
}
