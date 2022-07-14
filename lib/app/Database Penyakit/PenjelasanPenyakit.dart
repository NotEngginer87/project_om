// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../api/ColorsApi.dart';

class InfoPenyakit extends StatefulWidget {
  const InfoPenyakit(this.id, this.namapenyakit, this.gambar, {Key? key})
      : super(key: key);

  final String id;
  final String namapenyakit;
  final String gambar;

  @override
  State<InfoPenyakit> createState() => _InfoPenyakitState();
}

class _InfoPenyakitState extends State<InfoPenyakit> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference databasepenyakit =
        firestore.collection('databasepenyakit');
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.namapenyakit),
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorsApi.isiqueblue.shade400,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(widget.id),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(widget.namapenyakit),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 200,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                  child: Image(
                    image: NetworkImage(widget.gambar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Faktor Etiologi : ',
                        textAlign: TextAlign.left,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: databasepenyakit
                            .doc(widget.id)
                            .collection('etiologi')
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                                children: snapshot.data.docs
                                    .map<Widget>((e) => PenjelasCard(
                                          e.data()['ket'],
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
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Faktor Predisposisi : ',
                        textAlign: TextAlign.left,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: databasepenyakit
                            .doc(widget.id)
                            .collection('predisposisi')
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                                children: snapshot.data.docs
                                    .map<Widget>((e) => PenjelasCard(
                                          e.data()['ket'],
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
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pemeriksaan Penunjang : ',
                        textAlign: TextAlign.left,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: databasepenyakit
                            .doc(widget.id)
                            .collection('pemeriksaanpenunjang')
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                                children: snapshot.data.docs
                                    .map<Widget>((e) => PenjelasCard(
                                          e.data()['ket'],
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
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rencana Perawatan : ',
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rencana Perawatan Farmakologi : ',
                            textAlign: TextAlign.left,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: databasepenyakit
                                .doc(widget.id)
                                .collection('RPFarmakologi')
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                    children: snapshot.data.docs
                                        .map<Widget>((e) => PenjelasCard(
                                              e.data()['ket'],
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
                      const SizedBox(
                        height: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rencana Perawatan Non Farmakologi : ',
                            textAlign: TextAlign.left,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: databasepenyakit
                                .doc(widget.id)
                                .collection('RPNonFarmakologi')
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                    children: snapshot.data.docs
                                        .map<Widget>((e) => PenjelasCard(
                                      e.data()['ket'],
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
                    ],
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rujukan : ',
                        textAlign: TextAlign.left,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: databasepenyakit
                            .doc(widget.id)
                            .collection('rujukan')
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                                children: snapshot.data.docs
                                    .map<Widget>((e) => PenjelasCard(
                                          e.data()['ket'],
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
                ),
              ),
            ],
          ),
        ));
  }
}

class PenjelasCard extends StatelessWidget {
  const PenjelasCard(this.ket, {Key? key}) : super(key: key);

  final String ket;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('  - '),
        Text(ket),
      ],
    );
  }
}
