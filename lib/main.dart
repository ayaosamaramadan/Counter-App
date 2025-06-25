import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PointsCounter(),
    );
  }
}

class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  _PointsCounterState createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);
  void _reset() => setState(() => _counter = 0);

  // Reusable button style
  ButtonStyle beautifulButtonStyle(Color bgColor) {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      backgroundColor: bgColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 6,
      shadowColor: bgColor.withOpacity(0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("Points Counter"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(167, 3, 6, 39),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Counter",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: Text(
                '$_counter',
                key: ValueKey<int>(_counter),
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _counter > 0 ? _decrement : null,
                  style: beautifulButtonStyle(Colors.redAccent),
                  child: const Text("-"),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: _increment,
                  style: beautifulButtonStyle(Colors.green),
                  child: const Text("+"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _reset,
              icon: const Icon(Icons.refresh),
              label: const Text("Reset Points"),
              style: beautifulButtonStyle(Colors.purpleAccent).copyWith(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                ),
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
