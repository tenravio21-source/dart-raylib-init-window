import 'package:game/configs/configs.dart' show Configs;
import 'package:raylib/raylib.dart';

void main() {
  initLibrary(windows: Configs.libraryPath);

  initWindow(Configs.screenWidth, Configs.screenHeight, Configs.title);

  setTargetFPS(60);

  while (!windowShouldClose()) {
    beginDrawing();
    clearBackground(Color.rayWhite);
    endDrawing();
  }

  closeWindow();
}
