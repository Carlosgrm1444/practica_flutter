// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker_practique/functions/messages.dart';
import 'package:images_picker_practique/widgets/my_button.dart';
import 'package:images_picker_practique/widgets/my_title.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const MyTitle(textTitle: "Selecciona una opcion"),
            const SizedBox(height: 30),
            MyButton(
                textButton: "Seleccionar imagen desde la galeria",
                buttonColor1: Colors.blue,
                buttonColor2: Colors.red,
                textPaddingHorizontal: 0.0,
                textPaddingVertical: 15,
                fontSize: 20,
                buttonPadding: 10.0,
                onPressedButton: () =>
                    _checkPermissionImagePicker(_pickImageFromGallery)),
            MyButton(
                textButton: "Seleccionar imagen desde la camara",
                buttonColor1: Colors.red,
                buttonColor2: Colors.blue,
                textPaddingHorizontal: 0.0,
                textPaddingVertical: 15,
                fontSize: 20,
                buttonPadding: 10.0,
                onPressedButton: () =>
                    _checkPermissionImagePicker(_pickImageFromCamera)),
            const SizedBox(
              height: 20,
            ),
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : const Text("Selecciona una imagen por favor")
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future<void> _checkPermissionImagePicker(Future Function() myFuction) async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await plugin.androidInfo;

    PermissionStatus cameraStatus;
    PermissionStatus storageStatus;

    if (android.version.sdkInt < 33) {
      cameraStatus = await Permission.camera.request();
      storageStatus = await Permission.storage.request();
    } else {
      cameraStatus = await Permission.camera.request();
      storageStatus = await Permission.photos.request();
    }

    if (cameraStatus == PermissionStatus.granted &&
        storageStatus == PermissionStatus.granted) {
      myFuction();
    } else if (cameraStatus == PermissionStatus.denied ||
        storageStatus == PermissionStatus.denied) {
      if (cameraStatus == PermissionStatus.denied) {
        ScaffoldMessage("No se concedieron los permisos de la camara", context);
      } else if (storageStatus == PermissionStatus.denied) {
        ScaffoldMessage(
            "No se concedieron los permisos del almacenamiento de fotos.",
            context);
      }
    } else if (cameraStatus == PermissionStatus.permanentlyDenied ||
        storageStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    } else if (cameraStatus.isRestricted || storageStatus.isRestricted) {
      if (cameraStatus.isRestricted) {
        ScaffoldMessage(
            "El permiso de la camara está restringido por el sistema operativo.",
            context);
      } else if (storageStatus.isRestricted) {
        ScaffoldMessage(
            "El permiso del almacenamiento de fotos está restringido por el sistema operativo.",
            context);
      }
    }
  }
}
