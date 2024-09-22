import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text.dart';
import 'package:front_laboratory/presentation/widgets/custom_textfield.dart';
import '../../../widgets/Custom_text_size.dart';
import '../../../widgets/custom_textfield_size.dart';
import 'test_item.dart';

class Section extends StatefulWidget {
  const Section({Key? key}) : super(key: key);

  @override
  SectionState createState() => SectionState();
}

class SectionState extends State<Section> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _methodController = TextEditingController();
  TextEditingController _sampleController = TextEditingController();

  List<GlobalKey<TestItemState>> testItemKeys = [];

  void addTest() {
    setState(() {
      testItemKeys.add(GlobalKey<TestItemState>());
    });
  }

  Map<String, dynamic> toJson() {
    return {
      'name': _nameController.text,
      'method': _methodController.text,
      'sample': _sampleController.text,
      'tests': testItemKeys.map((key) => key.currentState?.toJson()).toList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSize(
            labelText: 'Sección',
            width: 100,
            size: 17,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CustomTextSize(
                labelText: 'Nombre',
                width: 100,
                size: 16,
              ),
              CustomTextFieldSize(
                labelText: "Nombre",
                controller: _nameController,
                width: (width * .7) - 200,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CustomTextSize(
                labelText: 'Metodo',
                width: 100,
                size: 16,
              ),
              CustomTextFieldSize(
                labelText: "Metodo",
                controller: _methodController,
                width: (width * .7) - 200,
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            children: [
              CustomTextSize(
                labelText: 'Muestra',
                width: 100,
                size: 16,
              ),
              CustomTextFieldSize(
                labelText: "Muestra",
                controller: _sampleController,
                width: (width * .7) - 200,
              ),
            ],
          ),
          SizedBox(height: 20),
          // Mapeamos los TestItems correctamente
          ...testItemKeys.map((key) => TestItem(key: key)).toList(),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton.icon(
              onPressed: addTest,
              icon: Icon(Icons.add, color: AppTheme.baseWhite),
              label: Text('Añadir Prueba',
                  style: TextStyle(fontSize: 16, color: AppTheme.baseWhite)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                backgroundColor: AppTheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
