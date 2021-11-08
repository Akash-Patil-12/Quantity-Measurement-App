import 'package:flutter/material.dart';

class Tempreture extends StatefulWidget {
  const Tempreture({Key? key}) : super(key: key);

  @override
  _TempretureState createState() => _TempretureState();
}

class _TempretureState extends State<Tempreture> {
  String unitDropDownValue = 'celsius';
  String convertDropDownValue = "celsius";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //   backgroundColor: Colors.white,
            elevation: 0,
            title: Text('Tempreture conversion')),
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
                  items: <String>['celsius', 'fahrenheit', 'kelvin']
                      .map<DropdownMenuItem<String>>((String value) {
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
                  items: <String>['celsius', 'fahrenheit', 'kelvin']
                      .map<DropdownMenuItem<String>>((String value) {
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
