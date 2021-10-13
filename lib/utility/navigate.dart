
import 'package:flutter/material.dart';

void navigateToRoute(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void navigateAndReplaceRoute(BuildContext context, String route) {
  Navigator.of(context).pushReplacementNamed(route);
}

void navigateAndRemoveUntilRoute(BuildContext context, String route) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
}
