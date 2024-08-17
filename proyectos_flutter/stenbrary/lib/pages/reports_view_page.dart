import 'package:flutter/material.dart';
import 'package:stenbrary/widgets/drawer_menu_widget.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          String size;
          Color color;
          double cubeSize;

          // Determinar el tamaño de la pantalla
          if (constraints.maxWidth < 576) {
            size = 'xs';
            color = Colors.red;
            cubeSize = 50;
          } else if (constraints.maxWidth < 768) {
            size = 'sm';
            color = Colors.blue;
            cubeSize = 100;
          } else if (constraints.maxWidth < 992) {
            size = 'md';
            color = Colors.green;
            cubeSize = 150;
          } else if (constraints.maxWidth < 1200) {
            size = 'lg';
            color = Colors.orange;
            cubeSize = 200;
          } else {
            size = 'xl';
            color = Colors.purple;
            cubeSize = 250;
          }

          return Center(
            child: Container(
              width: cubeSize,
              height: cubeSize,
              color: color,
              child: Center(
                child: Text(
                  'Size: $size',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
      drawer: const DrawerMenu(),
    );
  }
}
