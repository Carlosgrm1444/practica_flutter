import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stenbrary/pages/register_attendance_page.dart';
import 'package:stenbrary/pages/register_student_page.dart';
import 'package:stenbrary/pages/reports_view_page.dart';
import 'package:stenbrary/pages/student_list_page.dart';
import 'package:stenbrary/providers/drawer_state_provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colors.primary,
            ),
            child: const ListTile(
              title: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              subtitle: Text(
                'Stenbrary',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const DrawerButton(
            newPage: RegisterStudent(),
            textButton: 'Alumno Nuevo',
            iconButton: FontAwesomeIcons.userPlus,
          ),
          const DrawerButton(
            newPage: RegisterAttendance(),
            textButton: 'Registro de asistencias',
            iconButton: FontAwesomeIcons.pen,
          ),
          const DrawerButton(
            newPage: StudentList(),
            textButton: 'Listado de alumnos',
            iconButton: FontAwesomeIcons.rectangleList,
          ),
          const DrawerButton(
            newPage: ReportsView(),
            textButton: 'Reportes',
            iconButton: FontAwesomeIcons.chartPie,
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final Widget newPage;
  final String textButton;
  final IconData iconButton;

  const DrawerButton({
    super.key,
    required this.newPage,
    required this.textButton,
    required this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    final drawerStateProvider = Provider.of<DrawerStateProvider>(context);

    return ListTile(
      leading: FaIcon(iconButton),
      title: Text(textButton),
      enabled: drawerStateProvider.oldPage != newPage,
      onTap: () {
        drawerStateProvider.changePage(newPage);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => newPage),
        );
      },
    );
  }
}
