import 'screen2.dart';
import 'stopwatch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: HomePage(),
      routes: {
        "screen2": (context) => Custom(),
        "stopwatch":(context) => StopWatch(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration duration = Duration();
  Duration durationDakar=Duration();
  Duration durationTokyo=Duration();
  Duration durationQueensland=Duration();
  Duration durationBarcelona=Duration();
  bool isStart=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Account Drawer"),
        centerTitle: true,
      ),
      drawer: NavigationDrawer(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Pranav Harnesha",style: TextStyle(color: Colors.black),),
            accountEmail: Text("pranavharnesha25@gmail.com",style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
            otherAccountsPictures: [
              CircleAvatar(backgroundImage: AssetImage("images/profile.jpg")),
              CircleAvatar(backgroundImage: AssetImage("images/profile.jpg"))
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.home,size: 50),
            label: Text("Home",style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize:MaterialStatePropertyAll(Size(50,100)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.settings,size: 50),
            label: Text("Settings",style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize:MaterialStatePropertyAll(Size(50,100)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.details,size: 50),
            label: Text("About",style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize:MaterialStatePropertyAll(Size(50,100)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.manage_accounts,size: 50),
            label: Text("Manage",style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize:MaterialStatePropertyAll(Size(50,100)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.help,size: 50),
            label: Text("Help",style: TextStyle(fontSize: 30)),
            style: ButtonStyle(
              minimumSize:MaterialStatePropertyAll(Size(50,100)),
            ),
          ),
        ],
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
                "${duration.inMinutes%60}:${duration.inSeconds%60}",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Dakar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Spacer(),
                      Text("${durationDakar.inMinutes%60}:${durationDakar.inSeconds%60}", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Tokyo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Spacer(),
                      Text("${durationTokyo.inMinutes%60}:${durationTokyo.inSeconds%60}", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Queensland",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Spacer(),
                      Text("${durationQueensland.inMinutes%60}:${durationQueensland.inSeconds%60}", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Barcelona",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Spacer(),
                      Text("${durationBarcelona.inMinutes%60}:${durationBarcelona.inSeconds%60}", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
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
                          color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.redAccent,
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(2, 2))
                          ]),
                      child: Text(
                        "Set Clock",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "stopwatch");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.redAccent,
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(2, 2))
                          ]),
                      child: Text(
                        " Go to Stop watch",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "screen2");
          },
          child: Icon(Icons.navigate_next)),
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
    durationDakar=Duration(seconds: durationDakar.inSeconds + 2);
    durationTokyo=Duration(seconds: durationTokyo.inSeconds + 4);
    durationQueensland=Duration(seconds: durationQueensland.inSeconds + 6);
    durationBarcelona=Duration(seconds: durationBarcelona.inSeconds + 8);
    if(isStart){
      setState(() {});}
    timer();
  }
}
