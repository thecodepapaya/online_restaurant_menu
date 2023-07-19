part of 'explorex_data.dart';

class Entry {
  final String id;
  final Dish dish;
  final String category;
  final EntryMenuEntryType menuEntryType;
  final double sellingPrice;
  final double displayPrice;
  final bool isCustomizable;
  final bool hasAddons;
  final bool hasCombos;
  final List<Addon> addons;
  final List<Combo> combos;
  final bool isBestSeller;
  final bool isRecommended;
  final bool isAvailable;
  final int entryIndex;
  final int imageIndex;
  final bool hasSuggestedMenuEntry;
  final dynamic suggestedMenuEntry;
  final double discountedPrice;

  Entry({
    required this.id,
    required this.dish,
    required this.category,
    required this.menuEntryType,
    required this.sellingPrice,
    required this.displayPrice,
    required this.isCustomizable,
    required this.hasAddons,
    required this.hasCombos,
    required this.addons,
    required this.combos,
    required this.isBestSeller,
    required this.isRecommended,
    required this.isAvailable,
    required this.entryIndex,
    required this.imageIndex,
    required this.hasSuggestedMenuEntry,
    required this.suggestedMenuEntry,
    required this.discountedPrice,
  });

  Entry copyWith({
    String? id,
    Dish? dish,
    String? category,
    EntryMenuEntryType? menuEntryType,
    double? sellingPrice,
    double? displayPrice,
    bool? isCustomizable,
    bool? hasAddons,
    bool? hasCombos,
    List<Addon>? addons,
    List<Combo>? combos,
    bool? isBestSeller,
    bool? isRecommended,
    bool? isAvailable,
    int? entryIndex,
    int? imageIndex,
    bool? hasSuggestedMenuEntry,
    dynamic suggestedMenuEntry,
    double? discountedPrice,
  }) =>
      Entry(
        id: id ?? this.id,
        dish: dish ?? this.dish,
        category: category ?? this.category,
        menuEntryType: menuEntryType ?? this.menuEntryType,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        displayPrice: displayPrice ?? this.displayPrice,
        isCustomizable: isCustomizable ?? this.isCustomizable,
        hasAddons: hasAddons ?? this.hasAddons,
        hasCombos: hasCombos ?? this.hasCombos,
        addons: addons ?? this.addons,
        combos: combos ?? this.combos,
        isBestSeller: isBestSeller ?? this.isBestSeller,
        isRecommended: isRecommended ?? this.isRecommended,
        isAvailable: isAvailable ?? this.isAvailable,
        entryIndex: entryIndex ?? this.entryIndex,
        imageIndex: imageIndex ?? this.imageIndex,
        hasSuggestedMenuEntry: hasSuggestedMenuEntry ?? this.hasSuggestedMenuEntry,
        suggestedMenuEntry: suggestedMenuEntry ?? this.suggestedMenuEntry,
        discountedPrice: discountedPrice ?? this.discountedPrice,
      );

  factory Entry.fromRawJson(String str) => Entry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        id: json["id"],
        dish: Dish.fromJson(json["dish"]),
        category: json["category"],
        menuEntryType: entryMenuEntryTypeValues.map[json["menuEntryType"]]!,
        sellingPrice: json["sellingPrice"],
        displayPrice: json["displayPrice"],
        isCustomizable: json["isCustomizable"],
        hasAddons: json["hasAddons"],
        hasCombos: json["hasCombos"],
        addons: List<Addon>.from(json["addons"].map((x) => Addon.fromJson(x))),
        combos: List<Combo>.from(json["combos"].map((x) => Combo.fromJson(x))),
        isBestSeller: json["isBestSeller"],
        isRecommended: json["isRecommended"],
        isAvailable: json["isAvailable"],
        entryIndex: json["entryIndex"],
        imageIndex: json["imageIndex"],
        hasSuggestedMenuEntry: json["hasSuggestedMenuEntry"],
        suggestedMenuEntry: json["suggestedMenuEntry"],
        discountedPrice: json["discountedPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dish": dish.toJson(),
        "category": category,
        "menuEntryType": entryMenuEntryTypeValues.reverse[menuEntryType],
        "sellingPrice": sellingPrice,
        "displayPrice": displayPrice,
        "isCustomizable": isCustomizable,
        "hasAddons": hasAddons,
        "hasCombos": hasCombos,
        "addons": List<dynamic>.from(addons.map((x) => x.toJson())),
        "combos": List<dynamic>.from(combos.map((x) => x.toJson())),
        "isBestSeller": isBestSeller,
        "isRecommended": isRecommended,
        "isAvailable": isAvailable,
        "entryIndex": entryIndex,
        "imageIndex": imageIndex,
        "hasSuggestedMenuEntry": hasSuggestedMenuEntry,
        "suggestedMenuEntry": suggestedMenuEntry,
        "discountedPrice": discountedPrice,
      };
}

class MenuEntry {
  final Id id;
  final Dish dish;
  final dynamic category;
  final PurpleMenuEntryType menuEntryType;
  final double sellingPrice;
  final double displayPrice;
  final bool isCustomizable;
  final bool hasAddons;
  final bool hasCombos;
  final List<dynamic> addons;
  final List<dynamic> combos;
  final bool isBestSeller;
  final bool isAvailable;
  final int entryIndex;
  final int imageIndex;

  MenuEntry({
    required this.id,
    required this.dish,
    required this.category,
    required this.menuEntryType,
    required this.sellingPrice,
    required this.displayPrice,
    required this.isCustomizable,
    required this.hasAddons,
    required this.hasCombos,
    required this.addons,
    required this.combos,
    required this.isBestSeller,
    required this.isAvailable,
    required this.entryIndex,
    required this.imageIndex,
  });

  MenuEntry copyWith({
    Id? id,
    Dish? dish,
    dynamic category,
    PurpleMenuEntryType? menuEntryType,
    double? sellingPrice,
    double? displayPrice,
    bool? isCustomizable,
    bool? hasAddons,
    bool? hasCombos,
    List<dynamic>? addons,
    List<dynamic>? combos,
    bool? isBestSeller,
    bool? isAvailable,
    int? entryIndex,
    int? imageIndex,
  }) =>
      MenuEntry(
        id: id ?? this.id,
        dish: dish ?? this.dish,
        category: category ?? this.category,
        menuEntryType: menuEntryType ?? this.menuEntryType,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        displayPrice: displayPrice ?? this.displayPrice,
        isCustomizable: isCustomizable ?? this.isCustomizable,
        hasAddons: hasAddons ?? this.hasAddons,
        hasCombos: hasCombos ?? this.hasCombos,
        addons: addons ?? this.addons,
        combos: combos ?? this.combos,
        isBestSeller: isBestSeller ?? this.isBestSeller,
        isAvailable: isAvailable ?? this.isAvailable,
        entryIndex: entryIndex ?? this.entryIndex,
        imageIndex: imageIndex ?? this.imageIndex,
      );

  factory MenuEntry.fromRawJson(String str) => MenuEntry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MenuEntry.fromJson(Map<String, dynamic> json) => MenuEntry(
        id: idValues.map[json["id"]]!,
        dish: Dish.fromJson(json["dish"]),
        category: json["category"],
        menuEntryType: purpleMenuEntryTypeValues.map[json["menuEntryType"]]!,
        sellingPrice: json["sellingPrice"],
        displayPrice: json["displayPrice"],
        isCustomizable: json["isCustomizable"],
        hasAddons: json["hasAddons"],
        hasCombos: json["hasCombos"],
        addons: List<dynamic>.from(json["addons"].map((x) => x)),
        combos: List<dynamic>.from(json["combos"].map((x) => x)),
        isBestSeller: json["isBestSeller"],
        isAvailable: json["isAvailable"],
        entryIndex: json["entryIndex"],
        imageIndex: json["imageIndex"],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "dish": dish.toJson(),
        "category": category,
        "menuEntryType": purpleMenuEntryTypeValues.reverse[menuEntryType],
        "sellingPrice": sellingPrice,
        "displayPrice": displayPrice,
        "isCustomizable": isCustomizable,
        "hasAddons": hasAddons,
        "hasCombos": hasCombos,
        "addons": List<dynamic>.from(addons.map((x) => x)),
        "combos": List<dynamic>.from(combos.map((x) => x)),
        "isBestSeller": isBestSeller,
        "isAvailable": isAvailable,
        "entryIndex": entryIndex,
        "imageIndex": imageIndex,
      };
}
