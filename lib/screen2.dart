import 'dart:math';

import 'package:flutter/material.dart';

class Custom extends StatefulWidget {
  const Custom({super.key});

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  Duration duration = Duration();
  bool isStart = true;

  @override
  void initState() {
    super.initState();
    var dateTime = DateTime.now();
    duration = Duration(
        hours: dateTime.hour,
        minutes: dateTime.minute,
        seconds: dateTime.second);
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Drawer"),
        centerTitle: true,
      ),
      drawer: NavigationDrawer(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/profile.jpg"),
                  radius: 50,
                ),
                Text(
                  "Pranav Harnesha",
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  "pranavharnesha25@gmail.com",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.home, size: 50),
            label: Text("Home", style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(50, 100)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.settings, size: 50),
            label: Text("Settings", style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(50, 100)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.details, size: 50),
            label: Text("About", style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(50, 100)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.manage_accounts, size: 50),
            label: Text("Manage", style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(50, 100)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.help, size: 50),
            label: Text("Help", style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(50, 100)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height:20),
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black54,
                shape: BoxShape.circle,
               ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: duration.inHours / 6 * pi,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 10,
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Transform.rotate(
                  angle: duration.inMinutes / 30 * pi,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 7,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Transform.rotate(
                  angle: duration.inSeconds / 30 * pi,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 4,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.5),
                  child: Text(
                    "${duration.inHours % 24} : ${duration.inMinutes % 60} : ${duration.inSeconds % 60}",
                    style: TextStyle(color: Colors.green, fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    value: (duration.inHours%12)/12,
                    color: Colors.purple,
                    strokeWidth: 6,
                  ),
                ),
                SizedBox(
                  width: 280,
                  height: 280,
                  child: CircularProgressIndicator(
                    value: (duration.inMinutes%60)/60,
                    color: Colors.red,
                    strokeWidth: 6,
                  ),
                ),
                SizedBox(
                  width: 260,
                  height: 260,
                  child: CircularProgressIndicator(
                    value: (duration.inSeconds%60)/60,
                    color: Colors.yellow,
                    strokeWidth: 3,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40,width: double.infinity),

        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.navigate_before)),
    );
  }
  @override
  void dispose() {
    isStart=false;
    super.dispose();
  }
  void timer() async {
    await Future.delayed(Duration(seconds: 1));
    duration = Duration(seconds: duration.inSeconds + 1);
    if (isStart) {
      setState(() {});
    }
    timer();
  }
}
