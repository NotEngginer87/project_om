// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../api/ColorsApi.dart';


final ButtonStyle Buttonstyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: ColorsApi.isiqueblue.shade400,
  elevation: 0,
  textStyle: const TextStyle(fontWeight: FontWeight.w900),
  minimumSize: const Size(96, 48),
  padding: const EdgeInsets.symmetric(horizontal: 8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);