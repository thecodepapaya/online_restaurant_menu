// To parse this JSON data, do
//
//     final explorexData = explorexDataFromJson(jsonString);

import 'dart:convert';

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

class Menu {
  final String id;
  final String name;
  final String restaurantId;
  final String menuSlug;
  final String status;
  final bool isActive;
  final int initiatedOn;
  final int lastSavedOn;
  final int totalDishCount;
  final List<dynamic> assignedOutlets;
  final dynamic scheduleInfo;
  final bool applicableForUserApp;
  final dynamic defaultMenuResource;
  final dynamic addonMenuResource;
  final int orderIndex;
  final List<Entry> entries;

  Menu({
    required this.id,
    required this.name,
    required this.restaurantId,
    required this.menuSlug,
    required this.status,
    required this.isActive,
    required this.initiatedOn,
    required this.lastSavedOn,
    required this.totalDishCount,
    required this.assignedOutlets,
    required this.scheduleInfo,
    required this.applicableForUserApp,
    required this.defaultMenuResource,
    required this.addonMenuResource,
    required this.orderIndex,
    required this.entries,
  });

  Menu copyWith({
    String? id,
    String? name,
    String? restaurantId,
    String? menuSlug,
    String? status,
    bool? isActive,
    int? initiatedOn,
    int? lastSavedOn,
    int? totalDishCount,
    List<dynamic>? assignedOutlets,
    dynamic scheduleInfo,
    bool? applicableForUserApp,
    dynamic defaultMenuResource,
    dynamic addonMenuResource,
    int? orderIndex,
    List<Entry>? entries,
  }) =>
      Menu(
        id: id ?? this.id,
        name: name ?? this.name,
        restaurantId: restaurantId ?? this.restaurantId,
        menuSlug: menuSlug ?? this.menuSlug,
        status: status ?? this.status,
        isActive: isActive ?? this.isActive,
        initiatedOn: initiatedOn ?? this.initiatedOn,
        lastSavedOn: lastSavedOn ?? this.lastSavedOn,
        totalDishCount: totalDishCount ?? this.totalDishCount,
        assignedOutlets: assignedOutlets ?? this.assignedOutlets,
        scheduleInfo: scheduleInfo ?? this.scheduleInfo,
        applicableForUserApp: applicableForUserApp ?? this.applicableForUserApp,
        defaultMenuResource: defaultMenuResource ?? this.defaultMenuResource,
        addonMenuResource: addonMenuResource ?? this.addonMenuResource,
        orderIndex: orderIndex ?? this.orderIndex,
        entries: entries ?? this.entries,
      );

  factory Menu.fromRawJson(String str) => Menu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        restaurantId: json["restaurantId"],
        menuSlug: json["menuSlug"],
        status: json["status"],
        isActive: json["isActive"],
        initiatedOn: json["initiatedOn"],
        lastSavedOn: json["lastSavedOn"],
        totalDishCount: json["totalDishCount"],
        assignedOutlets: List<dynamic>.from(json["assignedOutlets"].map((x) => x)),
        scheduleInfo: json["scheduleInfo"],
        applicableForUserApp: json["applicableForUserApp"],
        defaultMenuResource: json["defaultMenuResource"],
        addonMenuResource: json["addonMenuResource"],
        orderIndex: json["orderIndex"],
        entries: List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "restaurantId": restaurantId,
        "menuSlug": menuSlug,
        "status": status,
        "isActive": isActive,
        "initiatedOn": initiatedOn,
        "lastSavedOn": lastSavedOn,
        "totalDishCount": totalDishCount,
        "assignedOutlets": List<dynamic>.from(assignedOutlets.map((x) => x)),
        "scheduleInfo": scheduleInfo,
        "applicableForUserApp": applicableForUserApp,
        "defaultMenuResource": defaultMenuResource,
        "addonMenuResource": addonMenuResource,
        "orderIndex": orderIndex,
        "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
      };
}

class Combo {
  final String comboName;
  final List<Entry> menuEntries;
  final bool hasSelectionRestriction;
  final int selectionCount;
  final int minSelectionCount;
  final int maxSelectionCount;

  Combo({
    required this.comboName,
    required this.menuEntries,
    required this.hasSelectionRestriction,
    required this.selectionCount,
    required this.minSelectionCount,
    required this.maxSelectionCount,
  });

  Combo copyWith({
    String? comboName,
    List<Entry>? menuEntries,
    bool? hasSelectionRestriction,
    int? selectionCount,
    int? minSelectionCount,
    int? maxSelectionCount,
  }) =>
      Combo(
        comboName: comboName ?? this.comboName,
        menuEntries: menuEntries ?? this.menuEntries,
        hasSelectionRestriction: hasSelectionRestriction ?? this.hasSelectionRestriction,
        selectionCount: selectionCount ?? this.selectionCount,
        minSelectionCount: minSelectionCount ?? this.minSelectionCount,
        maxSelectionCount: maxSelectionCount ?? this.maxSelectionCount,
      );

  factory Combo.fromRawJson(String str) => Combo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Combo.fromJson(Map<String, dynamic> json) => Combo(
        comboName: json["comboName"],
        menuEntries: List<Entry>.from(json["menuEntries"].map((x) => Entry.fromJson(x))),
        hasSelectionRestriction: json["hasSelectionRestriction"],
        selectionCount: json["selectionCount"],
        minSelectionCount: json["minSelectionCount"],
        maxSelectionCount: json["maxSelectionCount"],
      );

  Map<String, dynamic> toJson() => {
        "comboName": comboName,
        "menuEntries": List<dynamic>.from(menuEntries.map((x) => x.toJson())),
        "hasSelectionRestriction": hasSelectionRestriction,
        "selectionCount": selectionCount,
        "minSelectionCount": minSelectionCount,
        "maxSelectionCount": maxSelectionCount,
      };
}

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

class Addon {
  final MenuEntry menuEntry;
  final bool hasMaxPurchaseRestriction;
  final int maxPurchaseAmount;

  Addon({
    required this.menuEntry,
    required this.hasMaxPurchaseRestriction,
    required this.maxPurchaseAmount,
  });

  Addon copyWith({
    MenuEntry? menuEntry,
    bool? hasMaxPurchaseRestriction,
    int? maxPurchaseAmount,
  }) =>
      Addon(
        menuEntry: menuEntry ?? this.menuEntry,
        hasMaxPurchaseRestriction: hasMaxPurchaseRestriction ?? this.hasMaxPurchaseRestriction,
        maxPurchaseAmount: maxPurchaseAmount ?? this.maxPurchaseAmount,
      );

  factory Addon.fromRawJson(String str) => Addon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        menuEntry: MenuEntry.fromJson(json["menuEntry"]),
        hasMaxPurchaseRestriction: json["hasMaxPurchaseRestriction"],
        maxPurchaseAmount: json["maxPurchaseAmount"],
      );

  Map<String, dynamic> toJson() => {
        "menuEntry": menuEntry.toJson(),
        "hasMaxPurchaseRestriction": hasMaxPurchaseRestriction,
        "maxPurchaseAmount": maxPurchaseAmount,
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
