import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../api/ColorsApi.dart';

import 'PenjelasanPenyakit.dart';

class ListPenyakit extends StatefulWidget {
  const ListPenyakit({Key? key}) : super(key: key);

  @override
  State<ListPenyakit> createState() => _ListPenyakitState();
}

class _ListPenyakitState extends State<ListPenyakit> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference databasepenyakit =
        firestore.collection('databasepenyakit');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('list penyakit'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorsApi.isiqueblue.shade400,
      ),
      body: Container(
          color: Colors.grey.shade50,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: ListView(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: databasepenyakit.snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          children: snapshot.data.docs
                              .map<Widget>((e) => PenyakitCard(
                                    e.data()['1id'],
                                    e.data()['2namapenyakit'],
                                    e.data()['3gambar'],
                                  ))
                              .toList());
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Center(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class PenyakitCard extends StatelessWidget {
  const PenyakitCard(this.id, this.nama, this.gambar, {Key? key})
      : super(key: key);

  final String id;
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(id),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(nama),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoPenyakit(id, nama, gambar)));
              },
            ),
          ),
        ));
  }
}
