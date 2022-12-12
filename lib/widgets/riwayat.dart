import 'package:flutter/material.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({
    super.key,
    required this.riwayat,
  });

  final List<String> riwayat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            children: riwayat.map((String value) {
      return Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            value,
            style: const TextStyle(fontSize: 15),
          ));
    }).toList()));
  }
}
