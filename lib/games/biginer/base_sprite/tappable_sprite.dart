import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

/// This class encapulates the whole game.
class TappableSprite extends FlameGame with HasTappables {
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    add(await FireSprite.getFireSprite());
  }
}

class FireSprite extends SpriteAnimationComponent with Tappable {
  FireSprite({
    required SpriteAnimation animation,
    required Vector2 size,
    required Vector2 position,
  }) : super(animation: animation, size: size, position: position);

  static Future<FireSprite> getFireSprite() async {
    const String src = 'fire.png';
    await Flame.images.load(src);
    var image = Flame.images.fromCache(src);

    const int rowCount = 4;
    const int columnCount = 8;
    final Vector2 textureSize = Vector2(
      image.width / columnCount,
      image.height / rowCount,
    );

    SpriteAnimation animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: rowCount * columnCount,
        amountPerRow: columnCount,
        stepTime: 1 / 24,
        textureSize: textureSize,
      ),
    );

    Vector2 size = Vector2(30, 50);
    return FireSprite(
        animation: animation, size: size, position: Vector2(50, 50));
  }

  @override
  bool onTapUp(TapUpInfo info) {
    position.add(Vector2(20, 0));
    return true;
  }
}
