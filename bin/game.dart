import 'package:game/configs/configs.dart' show Configs;
import 'package:raylib/raylib.dart';

void main() {
  initLibrary(windows: Configs.libraryPath);

  initWindow(Configs.screenWidth, Configs.screenHeight, Configs.title);

  setTargetFPS(60);

  while (!windowShouldClose()) {
    beginDrawing();
    clearBackground(Color.white);
    drawText(
      'Congrats! You created your first window!',
      190,
      200,
      20,
      Color.lightGray,
    );
    endDrawing();
  }

  closeWindow();
}
