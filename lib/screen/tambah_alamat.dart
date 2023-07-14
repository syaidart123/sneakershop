import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'alamat.dart';

class addAlamat extends StatefulWidget {
  @override
  _addAlamatState createState() => _addAlamatState();
}

class _addAlamatState extends State<addAlamat> {
  TextEditingController namaController = TextEditingController();
  TextEditingController jalanController = TextEditingController();
  TextEditingController nomorRumahController = TextEditingController();
  TextEditingController rtRwController = TextEditingController();
  TextEditingController desaController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);

    final ref = fb.ref().child('alamat/$k');

    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Alamat"),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jalanController,
                decoration: InputDecoration(
                  labelText: 'Jalan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: nomorRumahController,
                decoration: InputDecoration(
                  labelText: 'Nomor Rumah',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: rtRwController,
                decoration: InputDecoration(
                  labelText: 'RT/RW',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: desaController,
                decoration: InputDecoration(
                  labelText: 'Nama Desa',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: kecamatanController,
                decoration: InputDecoration(
                  labelText: 'Kecamatan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: kabupatenController,
                decoration: InputDecoration(
                  labelText: 'Kabupaten',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: provinsiController,
                decoration: InputDecoration(
                  labelText: 'Provinsi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 0, 0, 0),
                  onPrimary: Colors.white,
                  textStyle: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  ref.set({
                    "nama": namaController.text,
                    "jalan": jalanController.text,
                    "nomorRumah": nomorRumahController.text,
                    "rtRw": rtRwController.text,
                    "desa": desaController.text,
                    "kecamatan": kecamatanController.text,
                    "kabupaten": kabupatenController.text,
                    "provinsi": provinsiController.text,
                  }).asStream();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => alamat()),
                  );
                },
                child: Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
