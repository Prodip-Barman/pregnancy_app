import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(180.0),
                  bottomLeft: Radius.circular(180.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Start Date", style: TextStyle(fontSize: 26),),
              Image(image: AssetImage("assets/images/img.png",), height: 120,),
              Text("Last Date", style: TextStyle(fontSize: 26),),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.accessibility,
                        size: 60,
                        color: Colors.pink,
                      ),
                      Text("আমার স্বাস্থ্য")
                    ],
                  ),
                ),
                elevation: 4,
                shadowColor: Colors.green,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.accessibility,
                        size: 60,
                        color: Colors.pink,
                      ),
                      Text("আমার স্বাস্থ্য")
                    ],
                  ),
                ),
                elevation: 4,
                shadowColor: Colors.green,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.accessibility,
                        size: 60,
                        color: Colors.pink,
                      ),
                      Text("আমার স্বাস্থ্য")
                    ],
                  ),
                ),
                elevation: 4,
                shadowColor: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.accessibility,
                        size: 60,
                        color: Colors.pink,
                      ),
                      Text("আমার স্বাস্থ্য")
                    ],
                  ),
                ),
                elevation: 4,
                shadowColor: Colors.green,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.accessibility,
                        size: 60,
                        color: Colors.pink,
                      ),
                      Text("আমার স্বাস্থ্য")
                    ],
                  ),
                ),
                elevation: 4,
                shadowColor: Colors.green,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.accessibility,
                        size: 60,
                        color: Colors.pink,
                      ),
                      Text("আমার স্বাস্থ্য")
                    ],
                  ),
                ),
                elevation: 4,
                shadowColor: Colors.green,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
