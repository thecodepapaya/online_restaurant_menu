import 'dart:convert';

import 'package:explorex/domains/menu.dart';
import 'package:flutter/services.dart';

class DataRepository {
  Future<ExplorexData> getJsonDecodedData() async {
    String data = await rootBundle.loadString("assets/data.json");
    final jsonResult = jsonDecode(data);

    final explorexData = ExplorexData.fromJson(jsonResult);

    return explorexData;
  }
}
