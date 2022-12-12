import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.convert,
  });

  final Function() convert;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: convert,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.blue,
      ),
      child: const Text('Konversi Suhu'),
    );
  }
}
