import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes/task_info.dart';

enum States { pending, done, canceled }

class Task extends StatelessWidget {
  String taskName;
  String taskDescription;
  States taskState;

  Task(
      {this.taskDescription = 'Task description',
      this.taskName = 'New Task',
      this.taskState = States.pending});

  @override
  Widget build(BuildContext context) {
    Icon taskIcon;

    switch (taskState) {
      case States.canceled:
        {
          taskIcon = const Icon(
            Icons.cancel,
            color: Color(0xFFFF5934),
            size: 50,
          );
          break;
        }
      case States.done:
        {
          taskIcon = const Icon(
            Icons.check_circle,
            color: Color(0xFF44FF8F),
            size: 50,
          );
          break;
        }
      default:
        {
          taskIcon = const Icon(
            Icons.check,
            color: Color(0x0000),
            size: 50,
          );
          break;
        }
    }

    return GestureDetector(
        onTap: () {
          print('Clicked Container');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskInfo(
                        title: 'Task Info',
                        name: taskName,
                        description: taskDescription,
                        status: taskState,
                      )));
        },
        child: Container(
          margin:
              const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 0),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xFF323232),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000),
                spreadRadius: 3,
                blurRadius: 6,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      this.taskName,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    this.taskDescription,
                    style: TextStyle(color: Color(0x66FFFFFF)),
                  )
                ],
              )),
              taskIcon,
            ],
          ),
        ));
  }
}
