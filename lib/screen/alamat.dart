import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'tambah_alamat.dart';

class alamat extends StatefulWidget {
  @override
  _alamatState createState() => _alamatState();
}

class _alamatState extends State<alamat> {
  TextEditingController namaController = TextEditingController();
  TextEditingController jalanController = TextEditingController();
  TextEditingController nomorRumahController = TextEditingController();
  TextEditingController rtRwController = TextEditingController();
  TextEditingController namaDesaController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();

  final fb = FirebaseDatabase.instance;
  var l;
  var g;
  var k;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('alamat');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => addAlamat(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Tambah Alamat',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: FirebaseAnimatedList(
        query: ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          var v = snapshot.value.toString();

          g = v.replaceAll(RegExp("{|}"), "");
          g.trim();

          l = g.split(',');

          return GestureDetector(
            onTap: () {
              setState(() {
                k = snapshot.key;

                namaController.text = l[4].split(':')[1].trim();
                jalanController.text = l[1].split(':')[1].trim();
                nomorRumahController.text = l[5].split(':')[1].trim();
                rtRwController.text = l[7].split(':')[1].trim();
                namaDesaController.text = l[0].split(':')[1].trim();
                kecamatanController.text = l[3].split(':')[1].trim();
                kabupatenController.text = l[2].split(':')[1].trim();
                provinsiController.text = l[6].split(':')[1].trim();
              });
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Edit Alamat'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: namaController,
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: jalanController,
                          decoration: InputDecoration(
                            labelText: 'Jalan',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: nomorRumahController,
                          decoration: InputDecoration(
                            labelText: 'Nomor Rumah',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: rtRwController,
                          decoration: InputDecoration(
                            labelText: 'RT/RW',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: namaDesaController,
                          decoration: InputDecoration(
                            labelText: 'Nama Desa',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: kecamatanController,
                          decoration: InputDecoration(
                            labelText: 'Kecamatan',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: kabupatenController,
                          decoration: InputDecoration(
                            labelText: 'Kabupaten',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: provinsiController,
                          decoration: InputDecoration(
                            labelText: 'Provinsi',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      color: Colors.grey[300],
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await updateAlamat();
                        Navigator.of(ctx).pop();
                      },
                      color: const Color.fromARGB(255, 0, 0, 0),
                      child: Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      l[0].split(':')[1].trim(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l[1].split(':')[1].trim(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l[2].split(':')[1].trim(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l[3].split(':')[1].trim(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l[4].split(':')[1].trim(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l[5].split(':')[1].trim(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l[6].split(':')[1].trim(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l[7].split(':')[1].trim(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () {
                            ref.child(snapshot.key!).remove();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  updateAlamat() async {
    DatabaseReference ref1 = FirebaseDatabase.instance.ref("alamat/$k");

    // Menghapus data yang ada
    await ref1.remove();

    // Memasukkan data yang baru setelah diupdate
    await ref1.set({
      "nama": namaController.text,
      "jalan": jalanController.text,
      "nomor_rumah": nomorRumahController.text,
      "rt_rw": rtRwController.text,
      "nama_desa": namaDesaController.text,
      "kecamatan": kecamatanController.text,
      "kabupaten": kabupatenController.text,
      "provinsi": provinsiController.text,
    });

    // Membersihkan nilai pada controller setelah diupdate
    namaController.clear();
    jalanController.clear();
    nomorRumahController.clear();
    rtRwController.clear();
    namaDesaController.clear();
    kecamatanController.clear();
    kabupatenController.clear();
    provinsiController.clear();
  }
}
