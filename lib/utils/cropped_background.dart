import 'dart:ui';
import 'package:flame/components.dart';

class CroppedBackground extends Component with HasGameRef {
  final Image image;
  late Rect src;
  late Rect dst;

  CroppedBackground(this.image);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    src = Rect.fromLTWH(0, 0, image.width.toDouble() ?? 0, image.height.toDouble() ?? 0);
    dst = Rect.fromLTWH(0, 0, gameRef.size.x, gameRef.size.y);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawImageRect(image, src, dst, Paint());
  }
}