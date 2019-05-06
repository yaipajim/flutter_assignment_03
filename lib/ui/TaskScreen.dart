import 'package:flutter/material.dart';
import './Complete.dart';
import './Task.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoScreenState();
  }
}

class TodoScreenState extends State<TodoScreen> {
  int _selectedPage = 0;
  final _pageOptions = [Task(), Complete()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), title: Text("Task")),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all), title: Text("Completed"))
        ],
      ),
    );
  }
}