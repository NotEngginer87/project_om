// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference userdata = firestore.collection('user');
  static CollectionReference console = firestore.collection('console');
  static CollectionReference anamnesis = firestore.collection('anamnesis');

  static Future<void> updateakun(String? email,
      String nama,
      String gender,
      String? tanggal,
      String? bulan,
      String? tahun,
      String alamat,
      String noHP,
      String? imageUrl) async {
    await userdata.doc(email).set(
      {
        'email': email,
        'nama': nama,
        'gender': gender,
        'tanggal': tanggal,
        'bulan': bulan,
        'tahun': tahun,
        'alamat': alamat,
        'noHP': noHP,
        'imageurl': imageUrl,
      },
    );
  }

  static Future<void> setFAQ(String email, int n) async {
    await userdata
        .doc(email.toString())
        .collection('FAQ')
        .doc(n.toString())
        .set(
      {
        'expand': false,
        'id': n,
      },
    );
  }

  static Future<void> expandFAQ(int id,
      bool expand,
      String email,) async {
    await userdata
        .doc(email.toString())
        .collection('FAQ')
        .doc(id.toString())
        .update(
      {
        'expand': !expand,
      },
    );
  }

  static Future<void> kritikdansaran(String keluhan) async {
    await userdata.doc().set(
      {
        'keluhan': keluhan,
      },
    );
  }
}