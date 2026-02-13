import 'dart:math' as math;

import 'package:game/configs/configs.dart' show Configs;
import 'package:raylib/raylib.dart';

class Player {
  Vector2 position;
  double radius;
  double speed;
  Color color;

  Player({
    Vector2? position, // Make it nullable
    this.radius = 20.0,
    this.speed = 5.0,
    Color? color, // Make it nullable
  }) : position = position ?? Vector2(0, 0), // Default if null
       color = color ?? Color.maroon;

  // Handle Input and Logic
  void update() {
    updateInput();
    move();
  }

  void updateInput() {
    double dx = 0;
    double dy = 0;

    // 1. Capture Directional Intent
    if (isKeyDown(KeyboardKey.w)) dy -= 1;
    if (isKeyDown(KeyboardKey.s)) dy += 1;
    if (isKeyDown(KeyboardKey.a)) dx -= 1;
    if (isKeyDown(KeyboardKey.d)) dx += 1;

    // 2. Only calculate if there is movement
    if (dx != 0 || dy != 0) {
      // Calculate magnitude: sqrt(x² + y²)
      double length = math.sqrt((dx * dx) + (dy * dy));

      // 3. Normalize and Apply Speed
      // (Direction / Length) * Speed
      position = Vector2(
        position.x + (dx / length) * speed,
        position.y + (dy / length) * speed,
      );
    }
  }

  void move() {
    // Boundary Clamping (X-axis)
    if (position.x < radius) {
      position = Vector2(radius, position.y);
    } else if (position.x > Configs.screenWidth - radius) {
      position = Vector2(Configs.screenWidth - radius, position.y);
    }

    // Boundary Clamping (Y-axis)
    if (position.y < radius) {
      position = Vector2(position.x, radius);
    } else if (position.y > Configs.screenHeight - radius) {
      position = Vector2(position.x, Configs.screenHeight - radius);
    }
  }

  // Handle Rendering
  void draw() {
    drawCircleV(position, radius, color);
  }
}
