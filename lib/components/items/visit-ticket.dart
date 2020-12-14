import 'package:flame/sprite.dart';
import '../superclass/item.dart';
import '../../teachers-game.dart';

class VisitTicket extends Item {
  final TeachersGame game;
  Sprite vtSprite;

  VisitTicket(this.game, double x, double y) : super(game, x, y) {
    vtSprite = Sprite('items/visit_ticket.png');
  }
}