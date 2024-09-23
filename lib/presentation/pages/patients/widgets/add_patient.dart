import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text_size.dart';
import 'package:front_laboratory/presentation/widgets/custom_button.dart';
import 'package:front_laboratory/presentation/widgets/custom_textfield_size.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatient createState() => _AddPatient();
}

class _AddPatient extends State<AddPatient> {
  final Map<String, TextEditingController> _controllers = {};

  final Map<String, dynamic> jsonData = {
    "headers": [
      "Nombre",
      "Fecha de Nacimiento",
      "Ciudad",
      "Teléfono",
      "Fecha de Registro"
    ],
    "data": []
  };

  @override
  void initState() {
    super.initState();
    for (String header in jsonData['headers']) {
      _controllers[header] = TextEditingController();
    }
  }

  @override
  void dispose() {
    _controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: width * 0.6,
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: AppTheme.baseWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextSize(
                      labelText: "Añadir nuevo paciente", size: 18, width: 200),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text('Rellene la información del paciente',
                  style: TextStyle(color: AppTheme.neutral400)),
              SizedBox(height: 20),
              Column(
                children: List<Widget>.generate(jsonData['headers'].length, (index) {
                  String header = jsonData['headers'][index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        CustomText(labelText: header),
                        CustomTextFieldSize(
                          labelText: header,
                          controller: _controllers[header]!, // Usar el controlador del campo
                          width: width * .3,
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar', style: TextStyle(color: AppTheme.secondary)),
                  ),
                  SizedBox(width: 10),
                  CustomButton(width: 200, text: "Guardar Cambios", onPressed: () {
                    setState(() {
                      List<String> newData = jsonData['headers'].map<String>((header) {
                        return _controllers[header]!.text;
                      }).toList();
                      print(jsonData);
                      jsonData['data'].add(newData);
                      print(jsonData['data']);
                    });
                    Navigator.of(context).pop();
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
