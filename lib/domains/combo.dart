part of 'explorex_data.dart';

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
