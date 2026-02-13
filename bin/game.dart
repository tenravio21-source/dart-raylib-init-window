import 'package:game/configs/configs.dart' show Configs;
import 'package:game/player/player.dart' show Player;
import 'package:raylib/raylib.dart';

void main() {
  initLibrary(windows: Configs.libraryPath);

  initWindow(Configs.screenWidth, Configs.screenHeight, Configs.title);

  final Player player = Player(
    position: Vector2(Configs.screenWidth / 2, Configs.screenHeight / 2),
  );

  setTargetFPS(60);

  while (!windowShouldClose()) {
    player.update();

    // 2. DRAW: Render the frame
    beginDrawing();
    clearBackground(Color.rayWhite);

    drawText('Use WASD to move the player!', 10, 10, 20, Color.darkGray);

    player.draw();

    endDrawing();
  }

  closeWindow();
}
