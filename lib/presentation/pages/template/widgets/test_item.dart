import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import '../../../widgets/Custom_text_size.dart';
import '../../../widgets/custom_drop.dart';
import '../../../widgets/custom_textfield_size.dart';
import 'reference_item.dart';

class TestItem extends StatefulWidget {
  const TestItem({Key? key}) : super(key: key);

  @override
  TestItemState createState() => TestItemState();
}

class TestItemState extends State<TestItem> {
  List<ReferenceItem> references = [];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _methodController = TextEditingController();
  TextEditingController _sampleController = TextEditingController();
  String _inputType = 'valor';

  void addReference() {
    setState(() {
      references.add(ReferenceItem());
    });
  }

  Map<String, dynamic> toJson() {
    return {
      'test': {
        'name': _nameController.text,
        'method': _methodController.text,
        'sample': _sampleController.text,
        'type': _inputType,
      },
      'result': {
        'type': _inputType,
        'result': 0,
      },
      'references': references.map((ref) => ref.toJson()).toList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(20),
      width: width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: _buildTestFields()),
              const SizedBox(width: 10),
              Expanded(
                child: _buildInputTypeSelector(),
              ),
              Container(
                width: width * .3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: references
                        .map((ref) => Container(
                              padding: const EdgeInsets.only(
                                  left: 8.0, bottom: 10.0),
                              child: ref,
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: addReference,
              icon: const Icon(Icons.add, color: AppTheme.baseWhite),
              label: const Text('Añadir Referencia',
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

  Widget _buildTestFields() {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            const CustomTextSize(
              labelText: 'Nombre',
              width: 100,
              size: 16,
            ),
            CustomTextFieldSize(
              labelText: "Nombre",
              controller: _nameController,
              width: (width * .3) - 200,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const CustomTextSize(
              labelText: 'Método',
              width: 100,
              size: 16,
            ),
            CustomDropdown(
              labelText: 'Método:',
              items: ['Opción 1', 'Opción 2'],
              controller: _methodController,
              width: (width * .3) - 200,
              onChanged: (value) {
                print('Valor seleccionado: $value');
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const CustomTextSize(
              labelText: 'Muestra',
              width: 100,
              size: 16,
            ),
            CustomDropdown(
              labelText: 'Muestra:',
              items: ['Opción 1', 'Opción 2'],
              controller: _sampleController,
              width: (width * .3) - 200,
              onChanged: (value) {
                print('Valor seleccionado: $value');
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputTypeSelector() {
    return Expanded(
        // width: 300,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<String>(
          title: const Text('Valor'),
          value: 'valor',
          activeColor: AppTheme.secondary,
          groupValue: _inputType,
          onChanged: (value) {
            setState(() {
              _inputType = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Positivo / Negativo'),
          value: 'positivo_negativo',
          activeColor: AppTheme.secondary,
          groupValue: _inputType,
          onChanged: (value) {
            setState(() {
              _inputType = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Otro'),
          value: 'otro',
          activeColor: AppTheme.secondary,
          groupValue: _inputType,
          onChanged: (value) {
            setState(() {
              _inputType = value!;
            });
          },
        ),
      ],
    ));
  }
}
