import 'dart:math';

import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create a new Task'),
          backgroundColor: Color(0xff151515),
        ),
        backgroundColor: Color(0xff151515),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            MyForm(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Change page')),
          ]),
        ));
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

// final myController = TextEditingController();

class _MyFormState extends State<MyForm> {
  MyInputField fieldOne = MyInputField(
    fieldName: 'Task Name',
  );

  MyInputField fieldTwo = MyInputField(
    fieldName: 'Task Description',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          fieldOne,
          fieldTwo,
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(fieldOne.fieldController.text),
                      );
                    },
                  );
                },
                tooltip: 'Show me the value!',
                heroTag: 'btn1',
                child: const Icon(Icons.first_page),
              ),
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(fieldTwo.fieldController.text),
                      );
                    },
                  );
                },
                tooltip: 'Show me the value!',
                heroTag: 'btn2',
                child: const Icon(Icons.last_page),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyInputField extends StatelessWidget {
  String fieldName;

  TextEditingController fieldController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fieldController.dispose();
    dispose();
  }

  MyInputField({this.fieldName = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            fieldName,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
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
            child: TextField(
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
              ),
              controller: fieldController,
            ),
          ),
        ],
      ),
    );
  }
}
