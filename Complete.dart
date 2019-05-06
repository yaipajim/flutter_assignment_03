import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Complete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CompleteState();
  }
}

class CompleteState extends State<Complete> {
  Firestore _store = Firestore();

  Widget listData() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data.documents.length != 0) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                title: Text(
                    snapshot.data.documents.elementAt(index).data['title']),
                value:
                    snapshot.data.documents.elementAt(index).data['done'] == 1,
                onChanged: (bool value) {
                  // _store
                  //     .collection('todo')
                  //     .document(
                  //         snapshot.data.documents.elementAt(index).documentID)
                  //     .setData({
                  //   'title':
                  //       snapshot.data.documents.elementAt(index).data['title'],
                  //   'done': 0
                  // });
                },
              );
            },
          );
        } else {
          return Center(child: Text('No data found...'));
        }
      },
      stream: _store.collection('todo').where('done', isEqualTo: 1).snapshots(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Todo"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                return _store
                    .collection('todo')
                    .where('done', isEqualTo: 1)
                    .getDocuments()
                    .then((d) {
                  d.documents.forEach((r) {
                    print("success");
                    r.reference.delete();
                  });
                });
              })
        ],
      ),
      body: listData(),
    );
  }
}