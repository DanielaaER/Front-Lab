import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';

import '../../pages/template/template_screen.dart';
import 'Text_nav_bar.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  NavBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.baseWhite,
      leadingWidth: MediaQuery.of(context).size.width,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: TextNavBar(
                  text: 'Inicio',
                  color: AppTheme.secondary,
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {},
                child: TextNavBar(
                  text: 'Análisis',
                  color: AppTheme.secondary,
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {},
                child: TextNavBar(
                  text: 'Pacientes',
                  color: AppTheme.secondary,
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return TemplateScreen();
                  }));
                },
                child: TextNavBar(
                  text: 'Crear Plantilla',
                  color: AppTheme.secondary,
                ),
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // width: 20,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      color: AppTheme.baseWhite,
                      onPressed: () {},
                    ),
                  ),

                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // width: 20,
                    child: IconButton(
                      icon: Icon(Icons.notifications_none_outlined),
                      color: AppTheme.baseWhite,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(width: 10),
                  // CircleAvatar(
                  //   backgroundImage: AssetImage('assets/user_avatar.png'),
                  //   radius: 20,
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
