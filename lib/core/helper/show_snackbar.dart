
import 'package:flutter/material.dart';

showSankBar(
  BuildContext context, {
  required String text,
  required Color color,
}) {
  return ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(text),backgroundColor: color,));
}
