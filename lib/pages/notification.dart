import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  final List<String> _title = [
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
    "This is notification",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        child: ListView.builder(
          itemCount: _title.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(_title[index]),
                subtitle: const Text("SubTitle"),
              ),
            );
          },
        ),
      ),
    );
  }
}
