import 'package:game/ball/ball.dart' show Ball;
import 'package:game/configs/configs.dart' show Configs;
import 'package:raylib/raylib.dart';

void main() {
  initLibrary(windows: Configs.libraryPath);

  initWindow(Configs.screenWidth, Configs.screenHeight, Configs.title);

  final Ball ball = Ball(
    position: Vector2(Configs.screenWidth / 2, Configs.screenHeight / 2),
    velocity: Vector2(200, 200),
    radius: 50,
  );

  setTargetFPS(60);

  while (!windowShouldClose()) {
  	double dt = getFrameTime();
    ball.update(dt);
    beginDrawing();
    clearBackground(Color.rayWhite);
    ball.draw();
    endDrawing();
  }

  closeWindow();
}
