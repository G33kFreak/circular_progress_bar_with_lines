import 'package:circular_progress_bar_with_lines/circular_progress_bar_with_lines.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _percent = 0;

  void _updateValue(double newValue) {
    setState(() {
      _percent = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: CircularProgressBarWithLines(
                percent: _percent,
                centerWidgetBuilder: (context) => Text(
                  '${_percent.round()}',
                ),
              ),
            ),
            Slider(
              value: _percent.toDouble(),
              min: 0,
              max: 100,
              onChanged: _updateValue,
            )
          ],
        ),
      ),
    );
  }
}
