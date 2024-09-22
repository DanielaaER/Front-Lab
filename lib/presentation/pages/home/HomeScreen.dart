import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text_size.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../../widgets/request/header.dart';
import '../../widgets/request/pending_analysis.dart';
import '../../widgets/request/statistics.dart';
import '../../widgets/request/tasks_summary.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: NavBar(title: 'Inicio'),
      backgroundColor: AppTheme.neutral100,
      body: Container(
        // color: AppTheme.baseWhite,
        // width: MediaQuery.of(context).size.width *.9,
        // margin: EdgeInsets.fromLTRB(
        //     width * 0.05, height * .05, width * 0.5, height * .04),
        padding: EdgeInsets.fromLTRB(width * 0.03, height * .04, width * 0.04, height * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextSize(
                labelText: "Bienvenida", size: 30, width: width * .3),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TasksSummary(),
                      SizedBox(height: 20),
                      Statistics(),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: PendingAnalysis(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
