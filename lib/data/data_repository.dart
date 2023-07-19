import 'dart:convert';

import 'package:explorex/domains/explorex_data.dart';
import 'package:flutter/services.dart';

class DataRepository {
  static Future<ExplorexData> getJsonDecodedData() async {
    String data = await rootBundle.loadString("assets/data.json");
    final jsonResult = jsonDecode(data);

    final explorexData = ExplorexData.fromJson(jsonResult);

    return explorexData;
  }
}
