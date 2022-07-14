// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/ColorsApi.dart';
import '../Database Penyakit/listpenyakit.dart';
import '../anamnesis/deksripsilesi.dart';

class HalamanRumah extends StatefulWidget {
  const HalamanRumah({Key? key}) : super(key: key);

  @override
  State<HalamanRumah> createState() => _HalamanRumahState();
}

class _HalamanRumahState extends State<HalamanRumah> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        title: const Text('OralMedicineApp'),
        centerTitle: true,
        titleTextStyle: GoogleFonts.pathwayGothicOne(
            fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white),
        backgroundColor: ColorsApi.isiqueblue.shade400,
        elevation: 0,
      ),
      body: Container(
          color: Colors.grey.shade50,
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                        clipBehavior: Clip.antiAlias,
                        color: ColorsApi.isiqueblue.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: InkWell(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height:
                                  MediaQuery.of(context).size.height * 0.4,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 32, horizontal: 32),
                                    child: Center(
                                        child: Text(
                                          'Anamnesis',
                                          style: TextStyle(color: Colors.white),
                                        ),),
                                  ))),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const RekamMedis();
                                }));
                          },
                        )),Card(
                        clipBehavior: Clip.antiAlias,
                        color: ColorsApi.isiqueblue.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: InkWell(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height:
                                  MediaQuery.of(context).size.height * 0.4,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 32, horizontal: 32),
                                    child: Center(
                                      child: Text(
                                        'Database',
                                        style: TextStyle(color: Colors.white),
                                      ),),
                                  ))),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const ListPenyakit();
                                }));
                          },
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                        clipBehavior: Clip.antiAlias,
                        color: ColorsApi.isiqueblue.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: InkWell(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height:
                                  MediaQuery.of(context).size.height * 0.4,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 32, horizontal: 32),
                                    child: Center(
                                      child: Text(
                                        'Database',
                                        style: TextStyle(color: Colors.white),
                                      ),),
                                  ))),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const ListPenyakit();
                                }));
                          },
                        )),Card(
                        clipBehavior: Clip.antiAlias,
                        color: ColorsApi.isiqueblue.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: InkWell(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height:
                                  MediaQuery.of(context).size.height * 0.4,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 32, horizontal: 32),
                                    child: Center(
                                      child: Text(
                                        'Database',
                                        style: TextStyle(color: Colors.white),
                                      ),),
                                  ))),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const ListPenyakit();
                                }));
                          },
                        )),
                  ],
                ),
              ],
            ),
          ))),
    );
  }

}
