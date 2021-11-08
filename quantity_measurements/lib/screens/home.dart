import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool changeLength = true, changeTemperature = false, changeVolume = false;
  var result;
  String lengthDropDownValue = 'kilometer',
      tempretureDropDownValue = 'celsius',
      volumeDropDownValue = 'liters';
  String lengthConvertDropDownValue = "kilometer",
      tempretureConvertDropDownValue = "celsius",
      volumeConvertDropDownValue = "liters",
      convertDropDownValue = "kilometer";
  var fromTextFieldController = TextEditingController();
  var toTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Welcome to Quantity Measurement'))),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Text('CHOOSE TYPE'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        changeLength = !changeLength;
                        changeTemperature = false;
                        changeVolume = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: 130,
                        width: 100,
                        child: Card(
                          color:
                              changeLength ? Colors.green[100] : Colors.white,
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: changeLength
                                      ? Image.asset(
                                          'assets/images/lengthColor.png',
                                          fit: BoxFit.fill,
                                          height: 46,
                                        )
                                      : Image.asset('assets/images/length.png'),
                                ),
                                SizedBox(
                                  height: 19,
                                ),
                                Text(
                                  'Length',
                                  style: TextStyle(
                                      color: changeLength
                                          ? Colors.green
                                          : Colors.black54,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        changeTemperature = !changeTemperature;
                        changeLength = false;
                        changeVolume = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: 130,
                      width: 100,
                      child: Card(
                        color:
                            changeTemperature ? Colors.red[100] : Colors.white,
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: changeTemperature
                                    ? Image.asset(
                                        'assets/images/temperatureColor.png')
                                    : Image.asset(
                                        'assets/images/temperature.png'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Temperature',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: changeTemperature
                                          ? Colors.red
                                          : Colors.black54))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        changeVolume = !changeVolume;
                        changeLength = false;
                        changeTemperature = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: 130,
                      width: 100,
                      child: Card(
                        color: changeVolume ? Colors.blue[100] : Colors.white,
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: changeVolume
                                    ? Image.asset(
                                        'assets/images/volumeColor.png')
                                    : Image.asset('assets/images/volume.png'),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Text(
                                'Volume',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: changeVolume
                                        ? Colors.blue
                                        : Colors.black54),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Column(
                          children: [
                            TextField(
                              controller: fromTextFieldController,
                              decoration: InputDecoration(
                                  labelText: "Value",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors
                                              .black) //  borderSide: BorderSide(width: 0.5),

                                      )),
                            ),
                            changeLength
                                ? DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          //  borderSide: BorderSide(width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    ),
                                    value: lengthDropDownValue,
                                    onChanged: (String? newvalue) {
                                      setState(() {
                                        lengthDropDownValue = newvalue!;

                                        print("Akash " + lengthDropDownValue);
                                      });
                                    },
                                    items: <String>[
                                      'kilometer',
                                      'meter',
                                      'centimeter',
                                      'milimeter'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )
                                : changeTemperature
                                    ? DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          // border: BorderRadius.all(Radius.circular(0))
                                          // enabledBorder: UnderlineInputBorder(),
                                        ),
                                        value: tempretureDropDownValue,
                                        onChanged: (String? newvalue) {
                                          setState(() {
                                            tempretureDropDownValue = newvalue!;
                                          });
                                          print("tempreture :" +
                                              tempretureDropDownValue);
                                        },
                                        items: <String>[
                                          'celsius',
                                          'fahrenheit',
                                          'kelvin'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )
                                    : DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          // border: BorderRadius.all(Radius.circular(0))
                                          // enabledBorder: UnderlineInputBorder(),
                                        ),
                                        value: volumeDropDownValue,
                                        onChanged: (String? newvalue) {
                                          setState(() {
                                            volumeDropDownValue = newvalue!;
                                          });
                                          print(
                                              "volume :" + volumeDropDownValue);
                                        },
                                        items: <String>[
                                          'liters',
                                          'militers',
                                          'gallons'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Column(
                          children: [
                            TextField(
                              controller: toTextFieldController,
                              decoration: InputDecoration(
                                  labelText: "To",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors
                                              .black) //  borderSide: BorderSide(width: 0.5),

                                      )),
                            ),
                            changeLength
                                ? DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      // border: BorderRadius.all(Radius.circular(0))
                                      // enabledBorder: UnderlineInputBorder(),
                                    ),
                                    value: lengthConvertDropDownValue,
                                    onChanged: (String? newvalue) {
                                      setState(() {
                                        lengthConvertDropDownValue = newvalue!;
                                      });
                                      if (lengthDropDownValue == 'kilometer') {
                                        if (lengthConvertDropDownValue ==
                                            'kilometer') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              1.0;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'meter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              1000.0;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'centimeter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              100000.0;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'milimeter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              1000000.0;
                                        }
                                        // setState(() {
                                        toTextFieldController.text =
                                            result.toString();
                                        //});
                                      }
                                      ////////////////
                                      if (lengthDropDownValue == 'meter') {
                                        print('lllllllllll');
                                        if (lengthConvertDropDownValue ==
                                            'kilometer') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              0.001;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'meter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              1.0;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'centimeter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              100.0;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'milimeter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              1000.0;
                                        }
                                        // setState(() {
                                        toTextFieldController.text =
                                            result.toString();
                                        //});
                                      }
                                      ///////////
                                      if (lengthDropDownValue == 'centimeter') {
                                        print('lllllllllll');
                                        if (lengthConvertDropDownValue ==
                                            'kilometer') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              0.00001;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'meter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              0.01;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'centimeter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              1.0;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'milimeter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              10.0;
                                        }
                                        // setState(() {
                                        toTextFieldController.text =
                                            result.toString();
                                        //});
                                      }
                                      if (lengthDropDownValue == 'milimeter') {
                                        if (lengthConvertDropDownValue ==
                                            'kilometer') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              0.000001;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'meter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              0.001;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'centimeter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              0.1;
                                        }
                                        if (lengthConvertDropDownValue ==
                                            'milimeter') {
                                          result = double.parse(
                                                  fromTextFieldController
                                                      .text) *
                                              1.0;
                                        }
                                        // setState(() {
                                        toTextFieldController.text =
                                            result.toString();
                                        //});
                                      }
                                    },
                                    items: <String>[
                                      'kilometer',
                                      'meter',
                                      'centimeter',
                                      'milimeter'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )
                                : changeTemperature
                                    ? DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          // border: BorderRadius.all(Radius.circular(0))
                                          // enabledBorder: UnderlineInputBorder(),
                                        ),
                                        value: tempretureConvertDropDownValue,
                                        onChanged: (String? newvalue) {
                                          setState(() {
                                            tempretureConvertDropDownValue =
                                                newvalue!;
                                          });
                                          print("temp convert :" +
                                              tempretureConvertDropDownValue);
                                          if (tempretureDropDownValue ==
                                              'celsius') {
                                            if (tempretureConvertDropDownValue ==
                                                'celsius') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  1.0;
                                            }
                                            if (tempretureConvertDropDownValue ==
                                                'fahrenheit') {
                                              result = double.parse(
                                                          fromTextFieldController
                                                              .text) *
                                                      (9 / 5) +
                                                  32;
                                            }
                                            if (tempretureConvertDropDownValue ==
                                                'kelvin') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) +
                                                  273.15;
                                            }
                                            toTextFieldController.text =
                                                result.toString();
                                          }
                                          if (tempretureDropDownValue ==
                                              'fahrenheit') {
                                            if (tempretureConvertDropDownValue ==
                                                'celsius') {
                                              result = (double.parse(
                                                          fromTextFieldController
                                                              .text) -
                                                      32) *
                                                  (5 / 9);
                                            }
                                            if (tempretureConvertDropDownValue ==
                                                'fahrenheit') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  1.0;
                                            }
                                            if (tempretureConvertDropDownValue ==
                                                'kelvin') {
                                              result = (double.parse(
                                                              fromTextFieldController
                                                                  .text) -
                                                          32) *
                                                      (5 / 9) +
                                                  273.15;
                                            }
                                            toTextFieldController.text =
                                                result.toString();
                                          }
                                          if (tempretureDropDownValue ==
                                              'kelvin') {
                                            if (tempretureConvertDropDownValue ==
                                                'celsius') {
                                              result = (double.parse(
                                                      fromTextFieldController
                                                          .text) -
                                                  273.15);
                                            }
                                            if (tempretureConvertDropDownValue ==
                                                'fahrenheit') {
                                              result = (double.parse(
                                                              fromTextFieldController
                                                                  .text) -
                                                          273.15) *
                                                      (9 / 5) +
                                                  32;
                                            }
                                            if (tempretureConvertDropDownValue ==
                                                'kelvin') {
                                              result = (double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  1.0);
                                            }
                                            toTextFieldController.text =
                                                result.toString();
                                          }
                                        },
                                        items: <String>[
                                          'celsius',
                                          'fahrenheit',
                                          'kelvin'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )
                                    : DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          // border: BorderRadius.all(Radius.circular(0))
                                          // enabledBorder: UnderlineInputBorder(),
                                        ),
                                        value: volumeConvertDropDownValue,
                                        onChanged: (String? newvalue) {
                                          setState(() {
                                            volumeConvertDropDownValue =
                                                newvalue!;
                                            //print(convertDropDownValue);
                                          });
                                          print("volume Convert :" +
                                              volumeConvertDropDownValue);
                                          if (volumeDropDownValue == 'liters') {
                                            if (volumeConvertDropDownValue ==
                                                'liters') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  1.0;
                                            }
                                            if (volumeConvertDropDownValue ==
                                                'militers') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  1000.0;
                                            }
                                            if (volumeConvertDropDownValue ==
                                                'gallons') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  0.264172;
                                            }
                                            toTextFieldController.text =
                                                result.toString();
                                          }
                                          if (volumeDropDownValue ==
                                              'militers') {
                                            if (volumeConvertDropDownValue ==
                                                'liters') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  0.001;
                                            }
                                            if (volumeConvertDropDownValue ==
                                                'militers') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  1.0;
                                            }
                                            if (volumeConvertDropDownValue ==
                                                'gallons') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  0.000264172;
                                            }
                                            toTextFieldController.text =
                                                result.toString();
                                          }
                                          if (volumeDropDownValue ==
                                              'gallons') {
                                            if (volumeConvertDropDownValue ==
                                                'liters') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  3.78541;
                                            }
                                            if (volumeConvertDropDownValue ==
                                                'militers') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  3785.41;
                                            }
                                            if (volumeConvertDropDownValue ==
                                                'gallons') {
                                              result = double.parse(
                                                      fromTextFieldController
                                                          .text) *
                                                  1.0;
                                            }
                                            toTextFieldController.text =
                                                result.toString();
                                          }
                                        },
                                        items: <String>[
                                          'liters',
                                          'militers',
                                          'gallons'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     OutlinedButton(
              //       onPressed: () {
              //         print('Received click');
              //         print(int.parse(fromTextFieldController.text) + 10);
              //         print(toTextFieldController.value);
              //         if (changeLength == true) {
              //           changeLengthFunction();
              //         }
              //       },
              //       child: const Text('Convert'),
              //     )
              //   ],
              // )
            ],
          )),
        ));
  }
}
