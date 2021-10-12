import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selection_wave_slider/selection_wave_slider.dart';
import 'package:test_task/weight_status.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  WeightStatus weightStatus = WeightStatus.Balanced;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(32, 16, 65, 16),
                      child: Text('What is your weight goal?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 0, 60),
                      child: Text('$weightStatus'.toString().substring(13)),
                    ),
                    Stack(
                      children: [
                        WaveSliderWithDragPoint(
                            toolTipBackgroundColor: Colors.black,
                            toolTipBorderColor: Colors.white,
                            toolTipTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            dragButton: Container(
                              color: Colors.black,
                            ),
                            optionToChoose: showInteger(),
                            onSelected: (value) {
                              print(value);
                              setState(() {
                                weightStatus = changeWeightStatus(value+37)!;
                              });
                            }
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 32, 8, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('40'),
                              Text('120'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Continue',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.arrow_forward_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.grey.shade200,
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> showInteger() {
    final list = <String>[];
    for (int i = 37; i < 124; i++) {
      list.add(i.toString());
    }
    return list;
  }

  WeightStatus? changeWeightStatus(int value) {
    if (value <= 65) {
      return WeightStatus.Underweight;
    } else if (value > 65 && value < 95) {
      return WeightStatus.Balanced;
    } else if (value >= 95) {
      return WeightStatus.Overweight;
    }
  }
}