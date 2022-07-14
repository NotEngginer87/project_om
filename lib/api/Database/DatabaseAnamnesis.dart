// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseAnamnesis {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference userdata = firestore.collection('user');
  static CollectionReference console = firestore.collection('console');
  static CollectionReference anamnesis = firestore.collection('anamnesis');

  static Future<void> tambahanamnesis() async {
    await console.doc('anamnesis').update(
      {
        'count': FieldValue.increment(1),
      },
    );
  }

  static Future<void> updatedataanamnesis(
      int id,
      String nama,
      jeniskelamin,
      int umur,
      nomorHP,
      alamat,
      statuspernikahan,
      agama,
      suku,
      pekerjaan,
      keluhan,
      urlgambar) async {
    await anamnesis.doc(id.toString()).set(
      {
        'id': id,
        'nama': nama,
        'jeniskelamin': jeniskelamin,
        'umur': umur,
        'noHp': nomorHP,
        'alamat': alamat,
        'statuspernikahan' : statuspernikahan,
        'agama' : agama,
        'suku' : suku,
        'pekerjaan' : pekerjaan,
        'keluhan' : keluhan,
        'urlgambar' : urlgambar
      },
    );
  }
}
