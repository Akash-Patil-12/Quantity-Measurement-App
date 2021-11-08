import 'package:flutter/material.dart';

class Length extends StatefulWidget {
  const Length({Key? key}) : super(key: key);

  @override
  _LengthState createState() => _LengthState();
}

class _LengthState extends State<Length> {
  String unitDropDownValue = 'kilometer';
  String convertDropDownValue = "kilometer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //   backgroundColor: Colors.white,
            elevation: 0,
            title: Text('Length conversion')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                // Container(
                //   child: TextField(
                //     decoration: InputDecoration(hintText: 'enter value'),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                DropdownButton<String>(
                  value: unitDropDownValue,
                  onChanged: (String? newvalue) {
                    setState(() {
                      unitDropDownValue = newvalue!;
                    });
                  },
                  items: <String>[
                    'kilometer',
                    'meter',
                    'centimeter',
                    'milimeter'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Column(
              children: [
                DropdownButton<String>(
                  value: convertDropDownValue,
                  onChanged: (String? newvalue) {
                    setState(() {
                      convertDropDownValue = newvalue!;
                    });
                  },
                  items: <String>[
                    'kilometer',
                    'meter',
                    'centimeter',
                    'nanometer'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ));
  }
}
