// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_maths_game/providers/app_provider.dart';
import 'package:flutter_maths_game/util/const.dart';
import 'package:flutter_maths_game/widgets/buttons.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MathApp(),
    ),
  ));
}

class MathApp extends StatelessWidget {
  const MathApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider apppr = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Maths Game'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Question Answer
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 105, 65, 175),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        //color: Colors.deepPurpleAccent,
                        child: Text(
                          (apppr.randomA).toString() +
                              (apppr.operator) +
                              (apppr.randomB).toString() +
                              ' = ',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      apppr.temp,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                )),
              ),
            ),
            //NumPad
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                // width: MediaQuery.of(context).size.width / 3,
                color: Color.fromARGB(255, 78, 59, 112),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: apppr.numberPad.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MyButton(
                      child: apppr.numberPad[index].toString(),
                      onTap: () => apppr.onClicked(apppr.numberPad[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
