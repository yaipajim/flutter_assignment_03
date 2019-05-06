import 'package:flutter/material.dart';
import 'TaskScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewSubject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewSubjectState();
  }
}

class NewSubjectState extends State<NewSubject> {
  final _formkey = GlobalKey<FormState>();
  Firestore _store = Firestore();
  @override
  Widget build(BuildContext context) {
    TextEditingController subject = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("New Subject")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: subject,
                decoration: InputDecoration(hintText: "Subject"),
                validator: (value) {
                  if (value.isEmpty) return "Please fill subject";
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Save"),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          _store.collection('todo').add(
                              {'title': subject.text, 'done': 0}).then((r) {
                            Navigator.pushReplacementNamed(context, '/');
                          });
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}