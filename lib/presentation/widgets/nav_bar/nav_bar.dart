import 'package:flutter/material.dart';

import 'Text_nav_bar.dart';

class NavBar extends StatelessWidget {
  final String title;

  NavBar({required this.title});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [

            TextButton(
              onPressed: () {},
              child: TextNavBar(
                text: 'Inicio',
                color: Colors.black,
              ),
            ),
            SizedBox(width: 20),
            TextButton(
              onPressed: () {},
              child: TextNavBar(
                text: 'Análisis',
                color: Colors.black,
              ),
            ),
            SizedBox(width: 20),
            TextButton(
              onPressed: () {},
              child: TextNavBar(
                text: 'Pacientes',
                color: Colors.black,
              ),
            ),
            SizedBox(width: 20),
            TextButton(
              onPressed: () {},
              child: TextNavBar(
                text: 'Plantillas',
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.blue,
              onPressed: () {},
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.blue,
              onPressed: () {},
            ),
            SizedBox(width: 10),
            // CircleAvatar(
            //   backgroundImage: AssetImage('assets/user_avatar.png'),
            //   radius: 20,
            // ),
          ],
        ),
      ],
    );
  }
}
