part of 'explorex_data.dart';

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
