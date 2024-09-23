import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class ApiService with ChangeNotifier {
  final String url = '${GlobalVariables().url}';

  final _storage = SharedPreferences.getInstance();
  bool _autenticando = false;

  bool get autenticando => _autenticando;

  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  Future<Map<String, dynamic>> getAnalysisRequest() async {
    print("get_jsonData");

    final dio = Dio();
    final response = await dio.get('${url}requests');

    List<dynamic> data = response.data;

    final Map<String, dynamic> jsonData = {
      "headers": [
        "ID",
        "Email",
        "Teléfono",
        "Tipo de Paciente",
        "Fecha",
        "Total",
        "Pagado"
      ],
      "rows": []
    };

    for (var item in data) {
      var row = [
        item['id'].toString(), // ID
        item['patient']['email'], // Email
        item['patient']['phone_number'], // Teléfono
        item['patient']['patient_type']['description'], // Tipo de Paciente
        item['date'], // Fecha
        item['total'].toString(), // Total
        item['paid'].toString(), // Pagado
      ];
      jsonData["rows"].add(row);
    }

    print(jsonData);
    return jsonData;
  }
}
