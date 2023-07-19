part of 'explorex_data.dart';

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
