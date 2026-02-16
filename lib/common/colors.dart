import 'package:flutter/material.dart';

WidgetStateProperty<Color?> trackColor = WidgetStateProperty<Color?>.fromMap(
  <WidgetStatesConstraint, Color>{WidgetState.selected: Colors.deepPurple},
);

final WidgetStateProperty<Color?> overlayColor =
    WidgetStateProperty<Color?>.fromMap(
  <WidgetState, Color>{
    WidgetState.selected: Colors.deepPurple,
    WidgetState.disabled: Colors.grey.shade400,
  },
);

final Color primaryColor = Colors.deepPurple;
