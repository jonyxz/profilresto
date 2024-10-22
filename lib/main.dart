import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(RestoApp());
}

class RestoApp extends StatelessWidget {
  final restoData = <String, String>{};

  RestoApp({super.key}) {
    restoData['name'] = 'Rm. Sedap Rasa';
    restoData['email'] = 'sedaprasa@gmail.com';
    restoData['phone'] = '+6281234567890';
    restoData['address'] = 'Jl. Diponegoro No.12, Semarang, Indonesia';
    restoData['image'] = 'gambarWarung.jpg';
    restoData['desc'] =
        'Rumah makan yang menyajikan makanan lezat dengan suasana nyaman. Cocok untuk makan bersama keluarga.';
    restoData['menu'] =
        '1. Ayam Goreng\n2. Nasi Goreng\n3. Mie Goreng\n4. Sate Ayam\n5. Es Teh Manis';
    restoData['openHours'] =
        'Senin - Jumat: 08.00 - 21.00\nSabtu - Minggu: 09.00 - 22.00';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profil Restoran",
      home: Scaffold(
        backgroundColor: Color(0xFFfffdf5), // #fffdf5
        appBar: AppBar(
          backgroundColor: Color(0xFFfffdf5), // #4d301b
          title: const Text(
            "Profil Restoran",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              teksKotak(Color(0xFF4d301b), restoData['name'] ?? ''), // #4d301b
              Image(image: AssetImage('assets/${restoData["image"] ?? ''}')),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  btnContact(
                      Icons.email,
                      Color(0xFF865b33), // #865b33
                      "mailto:${restoData['email'] ?? ''}?subject=Tanya%20Seputar%20Resto"),
                  btnContact(
                      Icons.phone,
                      Color(0xFF865b33), // #865b33
                      "tel:${restoData['phone']}"),
                  btnContact(
                      Icons.map,
                      Color(0xFF865b33), // #865b33
                      "https://www.google.com/maps/search/?api=1&query=-6.982928,110.409208"), // Coordinates for UDINUS
                ],
              ),
              const SizedBox(height: 10),
              teksKotak(Color(0xFF4d301b), 'Deskripsi'), // #4d301b
              Text(
                restoData['desc'] ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              teksKotak(Color(0xFF4d301b), 'List Menu'), // #4d301b
              Text(
                restoData['menu'] ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              teksKotak(Color(0xFF4d301b), 'Alamat'), // #4d301b
              Text(
                restoData['address'] ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              teksKotak(Color(0xFF4d301b), 'Jam Buka'), // #4d301b
              Text(
                restoData['openHours'] ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Expanded btnContact(IconData icon, var color, String uri) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        launch(uri);
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color,
          foregroundColor: Colors.white),
      child: Icon(icon),
    ),
  );
}

Row textAttribute(String judul, String teks) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 80,
        child: Text(
          '- $judul ',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Expanded(
        child: Text(
          ': $teks',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}

Container teksKotak(Color bgColor, String teks) {
  return Container(
    padding: const EdgeInsets.all(10),
    alignment: Alignment.centerLeft,
    width: double.infinity,
    decoration: BoxDecoration(color: bgColor),
    child: Text(
      teks,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}

Future launch(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {
    throw Exception('Tidak dapat membuka: $uri');
  }
}
