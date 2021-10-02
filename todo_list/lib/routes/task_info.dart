import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInfo extends StatelessWidget {
  // const TaskInfo({Key? key}) : super(key: key);

  String title;
  String name;
  String description;
  States status;

  TaskInfo(
      {this.title = 'Test Title',
      this.name = '',
      this.description = '',
      this.status = States.done});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Color(0xff151515),
        ),
        backgroundColor: Color(0xff151515),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              name,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Change page')),
          ]),
        ));
  }
}
