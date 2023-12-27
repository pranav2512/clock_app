import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Duration duration = Duration();
  Duration durationDakar = Duration();
  Duration durationTokyo = Duration();
  Duration durationQueensland = Duration();
  Duration durationBarcelona = Duration();
  bool isStart = true;

  @override
  void initState() {
    instance.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stop Watch"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 20, color: Colors.purple)),
              child: Text(
                "${duration.inHours % 24}:${duration.inMinutes % 60}:${duration.inSeconds % 60}",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20, width: double.infinity),
            Container(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: instance.map((e) {
                    return Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: double.infinity,
                      child: Text(
                        "${e.inHours % 24}:${e.inMinutes % 60}:${e.inSeconds % 60}",
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                timer();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.purpleAccent,
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(2, 2))
                    ]),
                child: Text(
                  "Start Watch",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            instance.add(duration);
          },
          child: Icon(Icons.stop)),
    );
  }

  @override
  void dispose() {
    isStart = false;
    super.dispose();
  }

  void timer() async {
    await Future.delayed(Duration(seconds: 1));
    duration = Duration(seconds: duration.inSeconds + 1);
    durationDakar = Duration(seconds: durationDakar.inSeconds + 2);
    durationTokyo = Duration(seconds: durationTokyo.inSeconds + 4);
    durationQueensland = Duration(seconds: durationQueensland.inSeconds + 6);
    durationBarcelona = Duration(seconds: durationBarcelona.inSeconds + 8);
    if (isStart) {
      setState(() {});
    }
    timer();
  }
}

List instance = [];
