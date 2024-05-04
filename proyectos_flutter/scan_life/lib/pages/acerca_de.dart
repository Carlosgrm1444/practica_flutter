import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de Scan Life'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                subtitle: Text(
              'Es una aplicación que utiliza la cámara de tu teléfono como escaner que analizara los medicamentos y desarrollara una investigación especifica del medicamento que toma en cuenta que el servicio que se ofrece en cuestión es un fácil escaneo de los medicamentos que cuente el usuario para una fácil administración de dichos medicamentos para así el cliente pueda llevar el conteo y fácil administración de sus medicamentos de uso diario:',
            )),
            SizedBox(height: 8),
            Text(
              'Misión:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
                subtitle: Text(
              'Facilitar el acceso a información precisa y confiable sobre medicamentos, contribuyendo a mejorar la salud y el bienestar de las personas en todo el mundo.',
            )),
            SizedBox(height: 16),
            Text(
              'Visión:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
                subtitle: Text(
              'Ser líderes en la innovación tecnológica para escaneo de medicamentos, ofreciendo una solución integral que empodere a los usuarios para tomar decisiones informadas sobre su salud.',
            )),
            SizedBox(height: 16),
            Text(
              'Valores:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              subtitle: Text(
                  '1. Excelencia: Nos comprometemos a ofrecer un servicio confiable respaldados por estándares rigurosos de precisión y confiabilidad.'),
            ),
            ListTile(
              subtitle: Text(
                  '2. Integridad: Operamos con honestidad y transparencia en todas nuestras acciones, manteniendo la confianza de nuestros usuarios y socios.'),
            ),
            ListTile(
              subtitle: Text(
                  '3. Empatía: Nos preocupamos por las necesidades y preocupaciones de nuestros usuarios, y nos esforzamos por brindar soluciones que mejoren su calidad de vida.'),
            ),
          ],
        ),
      ),
    );
  }
}
