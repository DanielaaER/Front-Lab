import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/pages/auth/login/login_screen.dart';
import 'package:front_laboratory/presentation/pages/patients/patients.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/server/auth_service.dart';

import '../../pages/home/HomeScreen.dart';
import '../../pages/requestAnalisis/analysis_request.dart';
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
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                child: TextNavBar(
                  text: 'Inicio',
                  color: AppTheme.secondary,
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AnalysisRequestPage();
                  }));
                },
                child: TextNavBar(
                  text: 'Solicitudes de Analisis',
                  color: AppTheme.secondary,
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return PatientsPage();
                  }));
                },
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
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: AppTheme.primary,
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   // width: 20,
                  //   child: IconButton(
                  //     icon: Icon(Icons.search),
                  //     color: AppTheme.baseWhite,
                  //     onPressed: () {},
                  //   ),
                  // ),

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
                  GestureDetector(
                    onTap: () {
                      RenderBox renderBox =
                          context.findRenderObject() as RenderBox;
                      Offset offset = renderBox.localToGlobal(Offset.zero);

                      showMenu<String>(
                        shadowColor: AppTheme.primary,
                        surfaceTintColor: AppTheme.baseWhite,
                        context: context,
                        position: RelativeRect.fromLTRB(
                          MediaQuery.of(context).size.width - 100,
                          offset.dy + renderBox.size.height,
                          0,
                          0,
                        ),
                        color: AppTheme.baseWhite,
                        items: [
                          PopupMenuItem<String>(
                            value: 'perfil',
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppTheme.primary,
                                  // backgroundImage: AssetImage('assets/user_avatar.png'), // Descomenta si tienes imagen
                                ),
                                SizedBox(width: 10),
                                Text('Perfil', style: TextStyle(color: AppTheme.secondary),),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'ajustes',
                            child: Row(
                              children: [
                                Icon(Icons.settings, color: AppTheme.secondary,),
                                SizedBox(width: 10),
                                Text('Ajustes', style: TextStyle(color: AppTheme.secondary),),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'cerrar',
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: AppTheme.secondary,),
                                SizedBox(width: 10),
                                Text('Cerrar sesión', style: TextStyle(color: AppTheme.secondary),),
                              ],
                            ),
                          ),
                        ],
                      ).then((value) {
                        if (value != null) {
                          // Manejo de la selección
                          switch (value) {
                            case 'perfil':
                              // Lógica para ir al perfil
                              break;
                            case 'ajustes':
                              // Lógica para ir a los ajustes
                              break;
                            case 'cerrar':
                              AuthService().logout();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                              break;
                          }
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: AppTheme.primary,
                      // backgroundImage: AssetImage('assets/user_avatar.png'), // Descomenta si tienes imagen
                    ),
                  ),
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
