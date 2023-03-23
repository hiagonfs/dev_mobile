import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isRunning = false;
  int _seconds = 0;
  Timer? _timer;

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _timer?.cancel();
  }

  void _resetTimer() {
    _isRunning = false;
    _timer?.cancel();
    setState(() {
      _seconds = 0;
    });
  }

  String _formatSeconds() {
    int hours = (_seconds / 3600).floor();
    int minutes = ((_seconds % 3600) / 60).floor();
    int seconds = _seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cronômetro'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _formatSeconds(),
              style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  child: Text('Iniciar'),
                  onPressed: _isRunning ? null : _startTimer,
                ),
                TextButton(
                  child: Text('Parar'),
                  onPressed: _isRunning ? _stopTimer : null,
                ),
                TextButton(
                  child: Text('Zerar'),
                  onPressed: _resetTimer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
