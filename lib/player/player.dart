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
    if (isKeyDown(KeyboardKey.w)) {
      position = Vector2(position.x, position.y - speed);
    }
    if (isKeyDown(KeyboardKey.s)) {
      position = Vector2(position.x, position.y + speed);
    }
    if (isKeyDown(KeyboardKey.a)) {
      position = Vector2(position.x - speed, position.y);
    }
    if (isKeyDown(KeyboardKey.d)) {
      position = Vector2(position.x + speed, position.y);
    }
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
