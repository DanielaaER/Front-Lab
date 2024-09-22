
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';


class GlobalVariables {
  static final GlobalVariables _instance = GlobalVariables._internal();

  factory GlobalVariables() {
    return _instance;
  }

  GlobalVariables._internal();

  late String url;
  late String host;

  Future<void> loadApiUrl() async {
    try {

      String configFileContent = await rootBundle.loadString('assets/json/api.json');
      Map<String, dynamic> config = json.decode(configFileContent);

      url = config['api'];
      print(url);
      host = config['host'];
      print  (url);
      print(host);
    } catch (e) {

      print('Error: $e');

    }
  }

}

