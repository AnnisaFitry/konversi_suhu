import 'package:flutter/material.dart';
import 'package:konversi_suhu/widgets/button.dart';
import 'package:konversi_suhu/widgets/dropdownconvert.dart';
import 'package:konversi_suhu/widgets/riwayat.dart';
import 'package:konversi_suhu/widgets/input.dart';
import 'package:konversi_suhu/widgets/hasil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController masukan = TextEditingController();
  double masukanuser = 0;
  String _newValue = "Kelvin";
  double hasil = 0;

  @override
  void dispose() {
    masukan.dispose();
    super.dispose();
  }

  convert() {
    setState(() {
      masukanuser = double.parse(masukan.text);

      if (_newValue == "Kelvin") {
        hasil = 273 + masukanuser;
        riwayat.add("Kelvin : $hasil"); //Add List for History
      } else if (_newValue == "Fahrenheid") {
        hasil = (1.8 * masukanuser) + 32;
        riwayat.add("Fahrenheid : $hasil");
      } else {
        hasil = 0.8 * masukanuser;
        riwayat.add("Reamor : $hasil");
      }
    });
  }

  void dropdownOnChanged(String? changeValue) {
    setState(() {
      _newValue = changeValue!;
      convert();
    });
  }

  var listItem = [
    "Kelvin",
    "Fahrenheid",
    "Reamur",
  ];

  List<String> riwayat = <String>[]; //List ini masih kosong

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Map',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konversi Suhu - Annisa Fitri Y"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              // Classes from diff files.
              Input(
                masukkan: masukan,
              ),
              DropDownConvert(
                  listItem: listItem,
                  newValue: _newValue,
                  dropDownConvert: dropdownOnChanged),
              Result(result: hasil),
              Button(convert: convert),
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text(
                    "Riwayat Konversi",
                    style: TextStyle(fontSize: 20),
                  )),
              Riwayat(riwayat: riwayat)
            ],
          ),
        ),
      ),
    );
  }
}
