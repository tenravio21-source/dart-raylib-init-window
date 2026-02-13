import 'package:game/configs/configs.dart' show Configs;
import 'package:raylib/raylib.dart';

class Ball {
  Vector2 position;
  Vector2 velocity;
  double radius;

  Ball({required this.position, required this.velocity, required this.radius});

  void update(double dt) {
    // 1. Update position on both axes
    position = Vector2(
      position.x + (velocity.x * dt),
      position.y + (velocity.y * dt),
    );

    // 2. Bounce off LEFT and RIGHT walls
    if (position.x + radius > Configs.screenWidth) {
      position = Vector2(Configs.screenWidth - radius, position.y); // Snap back
      velocity = Vector2(-velocity.x, velocity.y); // Reverse X
    } else if (position.x - radius < 0) {
      position = Vector2(radius, position.y); // Snap back
      velocity = Vector2(-velocity.x, velocity.y); // Reverse X
    }

    // 3. Bounce off TOP and BOTTOM walls (The Pong "Ceiling")
    if (position.y + radius > Configs.screenHeight) {
      position = Vector2(
        position.x,
        Configs.screenHeight - radius,
      ); // Snap back
      velocity = Vector2(velocity.x, -velocity.y); // Reverse Y
    } else if (position.y - radius < 0) {
      position = Vector2(position.x, radius); // Snap back
      velocity = Vector2(velocity.x, -velocity.y); // Reverse Y
    }
  }

  void draw() {
    drawCircle(position.x.toInt(), position.y.toInt(), radius, Color.red);
  }
}
