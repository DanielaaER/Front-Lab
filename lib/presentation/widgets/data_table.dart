import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';

class DataTableWidget extends StatefulWidget {
  final Map<String, dynamic> jsonData;
  final Function(int) onEdit; // Función para editar
  final Function(int) onDelete; // Función para eliminar
  final Function(int) onView; // Función para ver

  DataTableWidget({
    required this.jsonData,
    required this.onEdit,
    required this.onDelete,
    required this.onView, // Nueva función para la acción de ver
  });

  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  late List<List<String>> rows;
  late List<String> headers;

  @override
  void initState() {
    super.initState();
    print("table init");
    print(widget.jsonData);
    print(widget.jsonData['rows']);
    print(widget.jsonData['headers']);
    // rows = List<List<String>>.from(widget.jsonData['rows']);
    // headers = List<String>.from(widget.jsonData['headers']);
    headers = List<String>.from(
        widget.jsonData['headers'].map((header) => header.toString()));

    rows = List<List<String>>.from(widget.jsonData['rows']
        .map((row) => List<String>.from(row.map((cell) => cell.toString()))));
  }

  void _deleteRow(int rowIndex) {
    widget.onDelete(rowIndex); // Llamar a la función de eliminación específica
    setState(() {
      rows.removeAt(rowIndex); // Reflejar visualmente la eliminación
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> dataColumns = headers.map<DataColumn>((header) {
      return DataColumn(label: Text(header));
    }).toList();

    List<DataRow> dataRows = rows.asMap().entries.map<DataRow>((entry) {
      int rowIndex = entry.key;
      List<String> row = entry.value;

      return DataRow(cells: [
        ...row.map<DataCell>((cell) {
          return DataCell(Text(cell));
        }).toList(),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.visibility, color: AppTheme.secondary),
                // Botón "Ver"
                onPressed: () {
                  widget.onView(
                      rowIndex); // Llamar a la función de visualización específica
                },
              ),
              IconButton(
                icon: Icon(Icons.edit, color: AppTheme.secondary),
                onPressed: () {
                  widget.onEdit(
                      rowIndex); // Llamar a la función de edición específica
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: AppTheme.secondary),
                onPressed: () {
                  _deleteRow(rowIndex); // Llamar a la función de eliminación
                },
              ),
            ],
          ),
        ),
      ]);
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          ...dataColumns,
          DataColumn(label: Text('Acciones')), // Columna para las acciones
        ],
        rows: dataRows,
      ),
    );
  }
}
