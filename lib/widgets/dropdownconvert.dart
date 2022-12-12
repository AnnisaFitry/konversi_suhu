import 'package:flutter/material.dart';

class DropDownConvert extends StatelessWidget {
  const DropDownConvert({
    super.key,
    required this.listItem,
    required this.newValue,
    required this.dropDownConvert,
  });

  final List<String> listItem;
  final String newValue;
  final Function(String?) dropDownConvert;
  //Parameter diberi nullable type karena pada fungsi parent memiliki nullable type.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          items: listItem.map((String value) {
            // listItem dari variabel listItem diubah menjadi string.
            return DropdownMenuItem<String>(
              value: value,
              // nilai dari suatu output, nilai akan tampil di debug console
              child: Text(value),
              //sebuah widget yang akan tampil di output
            );
          }).toList(),
          value: newValue,
          // Mengubah output dropdown
          onChanged: dropDownConvert,
          // Agar Dropdown dapat di klik memakai widget onChanged
          // onchanged tidak bisa memiliki nilai null
        ),
      ],
    );
  }
}
