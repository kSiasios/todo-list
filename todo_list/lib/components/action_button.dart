import 'dart:io';
import 'package:flutter/material.dart';

import '../routes/task_info.dart';
import '../routes/new_task.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({Key? key}) : super(key: key);
  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  Color _containerColor = Color(0xFF8F8F8F);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('Clicked Container');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewTask()));
        },
        onTapDown: (details) => {
              setState(() {
                _containerColor = Color(0xFFFFFFFF);
              })
            },
        onTapUp: (details) => {
              setState(() {
                _containerColor = Color(0xFF8F8F8F);
              })
            },
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: _containerColor,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle,
                size: 30,
                color: Color(0xFF151515),
              ),
            ],
          ),
        ));
  }
}
