import 'dart:convert';

part 'addon.dart';
part 'combo.dart';
part 'dish.dart';
part 'menu.dart';
part 'menu_entry.dart';

class ExplorexData {
  final int code;
  final Description description;

  ExplorexData({
    required this.code,
    required this.description,
  });

  ExplorexData copyWith({
    int? code,
    Description? description,
  }) =>
      ExplorexData(
        code: code ?? this.code,
        description: description ?? this.description,
      );

  factory ExplorexData.fromRawJson(String str) => ExplorexData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExplorexData.fromJson(Map<String, dynamic> json) => ExplorexData(
        code: json["code"],
        description: Description.fromJson(json["description"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description.toJson(),
      };
}

class Description {
  final List<Menu> menus;
  final String hash;
  final bool orderEnabled;

  Description({
    required this.menus,
    required this.hash,
    required this.orderEnabled,
  });

  Description copyWith({
    List<Menu>? menus,
    String? hash,
    bool? orderEnabled,
  }) =>
      Description(
        menus: menus ?? this.menus,
        hash: hash ?? this.hash,
        orderEnabled: orderEnabled ?? this.orderEnabled,
      );

  factory Description.fromRawJson(String str) => Description.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
        hash: json["hash"],
        orderEnabled: json["orderEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
        "hash": hash,
        "orderEnabled": orderEnabled,
      };
}

enum MeatStatus { VEG, NON_VEG, VEG_CONTAINS_EGG, VEGAN, NA }

final meatStatusValues = EnumValues({
  "NA": MeatStatus.NA,
  "NON_VEG": MeatStatus.NON_VEG,
  "VEG": MeatStatus.VEG,
  "VEGAN": MeatStatus.VEGAN,
  "VEG_CONTAINS_EGG": MeatStatus.VEG_CONTAINS_EGG
});

enum Id {
  THE_6375_DF152_F34_E110_C632_BA36,
  THE_6375_DF152_F34_E110_C632_BA37,
  THE_6375_DF152_F34_E110_C632_BA35,
  THE_636_D7_D0_D733_E8_C10_DABAE5_FF,
  THE_636_D7_D0_D733_E8_C10_DABAE5_FE,
  THE_636_D7_D0_C733_E8_C10_DABAE5_FB,
  THE_636_D7_D0_C733_E8_C10_DABAE5_FC,
  THE_636_D7_D0_C733_E8_C10_DABAE5_F8,
  THE_636_D7_D0_C733_E8_C10_DABAE5_F7,
  THE_636_D7_D0_C733_E8_C10_DABAE5_F9,
  THE_636_D7_D0_C733_E8_C10_DABAE5_FA,
  THE_636_D7_D0_C733_E8_C10_DABAE5_FD
}

final idValues = EnumValues({
  "636d7d0c733e8c10dabae5f7": Id.THE_636_D7_D0_C733_E8_C10_DABAE5_F7,
  "636d7d0c733e8c10dabae5f8": Id.THE_636_D7_D0_C733_E8_C10_DABAE5_F8,
  "636d7d0c733e8c10dabae5f9": Id.THE_636_D7_D0_C733_E8_C10_DABAE5_F9,
  "636d7d0c733e8c10dabae5fa": Id.THE_636_D7_D0_C733_E8_C10_DABAE5_FA,
  "636d7d0c733e8c10dabae5fb": Id.THE_636_D7_D0_C733_E8_C10_DABAE5_FB,
  "636d7d0c733e8c10dabae5fc": Id.THE_636_D7_D0_C733_E8_C10_DABAE5_FC,
  "636d7d0c733e8c10dabae5fd": Id.THE_636_D7_D0_C733_E8_C10_DABAE5_FD,
  "636d7d0d733e8c10dabae5fe": Id.THE_636_D7_D0_D733_E8_C10_DABAE5_FE,
  "636d7d0d733e8c10dabae5ff": Id.THE_636_D7_D0_D733_E8_C10_DABAE5_FF,
  "6375df152f34e110c632ba35": Id.THE_6375_DF152_F34_E110_C632_BA35,
  "6375df152f34e110c632ba36": Id.THE_6375_DF152_F34_E110_C632_BA36,
  "6375df152f34e110c632ba37": Id.THE_6375_DF152_F34_E110_C632_BA37
});

enum PurpleMenuEntryType { ADDON }

final purpleMenuEntryTypeValues = EnumValues({"ADDON": PurpleMenuEntryType.ADDON});

enum EntryMenuEntryType { DISH, COMBO }

final entryMenuEntryTypeValues = EnumValues({"COMBO": EntryMenuEntryType.COMBO, "DISH": EntryMenuEntryType.DISH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
