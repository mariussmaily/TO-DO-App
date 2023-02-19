import 'package:flutter/material.dart';
import '../widgets/task_input.dart';
import '../widgets/task_list.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO-DO List'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TaskList(
              tasks: tasks,
              removeTask: removeTask,
            ),
          ),
          TaskInput(addTask: addTask),
        ],
      ),
    );
  }
}
