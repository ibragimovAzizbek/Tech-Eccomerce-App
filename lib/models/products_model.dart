import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ModelProducts {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? img;
  @HiveField(2)
  String? price;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? description2;

  ModelProducts({
    required this.name,
    required this.price,
    required this.img,
    required this.description,
    required this.description2,
  });
}
