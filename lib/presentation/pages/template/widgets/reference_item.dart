import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/widgets/custom_textfield.dart';

import '../../../widgets/Custom_text_size.dart';
import '../../../widgets/custom_drop.dart';
import '../../../widgets/custom_textfield_size.dart';

class ReferenceItem extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  // String unit = 'Opción 1';

  ReferenceItem({Key? key}) : super(key: key);

  Map<String, dynamic> toJson() {
    return {
      'description': descriptionController.text,
      'value': valueController.text,
      'unit': unitController.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .25,
      // margin: EdgeInsets.symmetric(vertical: 5),
      // padding: EdgeInsets.all(8),

      child: Column(
        children: [

          Row(
            children: [
              const CustomTextSize(
                labelText: 'Descripción',
                width: 100,
                size: 16,
              ),
              CustomTextFieldSize(
                labelText: "Descripción",
                controller: descriptionController,
                width: (width * .3) - 200,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const CustomTextSize(
                labelText: 'Valor',
                width: 100,
                size: 16,
              ),
              CustomTextFieldSize(
                labelText: "Valor",
                controller: valueController,
                width: (width * .3) - 200,
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            children: [
              const CustomTextSize(
                labelText: 'Unidad de Medida',
                width: 100,
                size: 16,
              ),

              CustomDropdown(
                labelText: 'Unidad de Medida:',
                items: ['Opción 1', 'Opción 2'],
                controller: unitController,
                width: (width * .3) - 200,
                onChanged: (value) {
                  print('Valor seleccionado: $value');
                },
              ),
            ],
          ),

        ],
      ),
    );
  }



}
