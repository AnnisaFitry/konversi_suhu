import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({super.key, required this.masukkan});

  final TextEditingController masukkan;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Controller masukkan retrieve
      controller: masukkan,
      decoration: const InputDecoration(
        hintText: 'Masukkan Suhu Dalam Celcius',
        labelText: "Masukkan Suhu Dalam Celcius",
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
