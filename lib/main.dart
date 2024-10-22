import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final restoData = <String, String>{};

  RestoApp({super.key}) {
    restoData['name'] = 'Rm. Sedap Rasa';
    restoData['email'] = 'sedaprasa@gmail.com';
    restoData['phone'] = '+6281234567890';
    restoData['address'] = 'Jl. Diponegoro No.12, Semarang, Indonesia';
    restoData['image'] = 'gambarWarung.jpg';
    restoData['desc'] =
        'Rumah makan yang menyajikan makanan lezat dengan suasana nyaman. Cocok untuk makan bersama keluarga.';
    restoData['menu'] = '1. Ayam Goreng\n2. Nasi Goreng\n3. Sate Ayam';
    restoData['openHours'] =
        'Senin - Jumat: 08.00 - 21.00\nSabtu - Minggu: 09.00 - 22.00';
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Profil Restoran",
      home: Scaffold(
        appBar: AppBar(title: const Text("Profil Restoran")),
      ),
    );
  }
}
