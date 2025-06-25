import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PointsCounter(),
    );
  }
}

class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PointsCounterState createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Points Counter"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "Counter",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text("Increment Points"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text("Decrement Points"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
