import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget sidebarIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Icon(icon, color: Colors.blueGrey, size: 24),
  );
}