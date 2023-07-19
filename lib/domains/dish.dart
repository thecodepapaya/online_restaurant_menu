part of 'explorex_data.dart';

class Dish {
  final String? itemCode;
  final String name;
  final String? description;
  final MeatStatus? meatStatus;
  final bool containsAlcohol;
  final bool isSpicy;
  final bool isChefSpecial;
  final bool hasImage;
  final String? image;

  Dish({
    required this.itemCode,
    required this.name,
    required this.description,
    required this.meatStatus,
    required this.containsAlcohol,
    required this.isSpicy,
    required this.isChefSpecial,
    required this.hasImage,
    required this.image,
  });

  Dish copyWith({
    String? itemCode,
    String? name,
    String? description,
    MeatStatus? meatStatus,
    bool? containsAlcohol,
    bool? isSpicy,
    bool? isChefSpecial,
    bool? hasImage,
    String? image,
  }) =>
      Dish(
        itemCode: itemCode ?? this.itemCode,
        name: name ?? this.name,
        description: description ?? this.description,
        meatStatus: meatStatus ?? this.meatStatus,
        containsAlcohol: containsAlcohol ?? this.containsAlcohol,
        isSpicy: isSpicy ?? this.isSpicy,
        isChefSpecial: isChefSpecial ?? this.isChefSpecial,
        hasImage: hasImage ?? this.hasImage,
        image: image ?? this.image,
      );

  factory Dish.fromRawJson(String str) => Dish.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        itemCode: json["itemCode"],
        name: json["name"],
        description: json["description"],
        meatStatus: meatStatusValues.map[json["meatStatus"]],
        containsAlcohol: json["containsAlcohol"],
        isSpicy: json["isSpicy"],
        isChefSpecial: json["isChefSpecial"],
        hasImage: json["hasImage"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "itemCode": itemCode,
        "name": name,
        "description": description,
        "meatStatus": meatStatusValues.reverse[meatStatus],
        "containsAlcohol": containsAlcohol,
        "isSpicy": isSpicy,
        "isChefSpecial": isChefSpecial,
        "hasImage": hasImage,
        "image": image,
      };
}
