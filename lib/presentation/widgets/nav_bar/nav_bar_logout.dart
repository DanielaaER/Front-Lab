import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';

import 'Text_nav_bar.dart';

class NavBarLogOut extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  NavBarLogOut({required this.title});

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
                  text: 'Inicia sesión',
                  color: AppTheme.primary900,
                ),
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
