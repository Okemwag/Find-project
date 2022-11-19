import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card.g.dart';

abstract class BuiltCard implements Built<BuiltCard, BuiltCardBuilder> {
  String? get firstName;
  String? get secondName;
  String? get thirdName;
  String? get regNumber;
  String? get idNumber;
  String? get status;
  String? get department;
  String? get locationFound;
  String? get schoolName;
  
  BuiltCard._();

  factory BuiltCard([Function(BuiltCardBuilder b) updates]) = _$BuiltCard;

  static Serializer<BuiltCard> get serializer => _$builtCardSerializer;
}
