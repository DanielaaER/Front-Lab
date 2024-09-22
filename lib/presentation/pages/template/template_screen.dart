import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text.dart';
import 'package:front_laboratory/presentation/widgets/custom_button.dart';
import 'package:front_laboratory/presentation/widgets/custom_textfield.dart';
import '../../themes/Theme.dart';
import '../../widgets/custom_textfield_size.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../pdf/pdf_preview.dart';
import 'pdf_view_screen.dart';
import 'widgets/section.dart';

class TemplateScreen extends StatefulWidget {
  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  List<GlobalKey<SectionState>> sectionKeys = [];
  TextEditingController _studyRequestedController = TextEditingController();

  void addSection() {
    setState(() {
      sectionKeys.add(GlobalKey<SectionState>());
    });
  }
Map<String, dynamic> _saveData() {
  final templateData = {
    'analysis': _studyRequestedController.text,
    'sections': sectionKeys.map((key) {
      final sectionState = key.currentState;
      return sectionState?.toJson() ?? {};
    }).toList(),
  };

  print(templateData);
  return templateData;
}
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: NavBar(title: 'Crear Plantilla'),
      backgroundColor: AppTheme.neutral100,
      body: Container(
        // color: AppTheme.baseWhite,
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.fromLTRB(
            width * 0.1, height * .05, width * 0.1, height * .04),
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: AppTheme.baseWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(labelText: "Estudio Solicitado"),
                  CustomTextFieldSize(
                    labelText: "Estudio Solicitado",
                    controller: _studyRequestedController,
                    width: (width * .6) - 200,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ...sectionKeys.map((key) => Section(key: key)).toList(),
              SizedBox(height: 20),
              _buildAddSectionButton(),
              SizedBox(height: 20),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddSectionButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton.icon(
        onPressed: addSection,
        icon: Icon(Icons.add, color: AppTheme.baseWhite),
        label: Text('Añadir Sección',
            style: TextStyle(fontSize: 16, color: AppTheme.baseWhite)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          backgroundColor: AppTheme.secondary,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          width: 175,
          text: "Previsualizar",
          onPressed: () {
            _generatePDF();
          },
        ),
        CustomButton(width: 175, text: "Guardar", onPressed: _saveData),
      ],
    );
  }

  void _generatePDF() async {
    var jsonData = await _saveData();
    // jsonData['analysis'] = _studyRequestedController.text as List<Map<String, dynamic>>;
    Uint8List pdfBytes = await previewPdf(jsonData);
    PDFViewerDialog(context, pdfBytes);
  }

}
