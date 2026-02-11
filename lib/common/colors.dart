import 'package:flutter/material.dart';

WidgetStateProperty<Color?> trackColor = WidgetStateProperty<Color?>.fromMap(
  <WidgetStatesConstraint, Color>{WidgetState.selected: Color(0xFF00B7B5)},
);

final WidgetStateProperty<Color?> overlayColor =
    WidgetStateProperty<Color?>.fromMap(
  <WidgetState, Color>{
    WidgetState.selected: Color(0xFF00B7B5),
    WidgetState.disabled: Colors.grey.shade400,
  },
);

final Color primaryColor = Color(0xFF00B7B5);
