import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startStopwatch() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
    _stopwatch.start();
  }

  void _stopStopwatch() {
    _timer.cancel();
    _stopwatch.stop();
  }

  void _resetStopwatch() {
    _stopStopwatch();
    _stopwatch.reset();
    setState(() {});
  }

  String _formatTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr:$hundredsStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _formatTime(_stopwatch.elapsedMilliseconds),
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? _stopStopwatch : _startStopwatch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(_stopwatch.isRunning ? 'Stop' : 'Start', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Reset', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}