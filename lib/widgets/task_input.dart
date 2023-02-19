import 'package:flutter/material.dart';

// añade a la lista
class TaskInput extends StatefulWidget {
  final Function(String) addTask;

  TaskInput({required this.addTask});

  @override
  _TaskInputState createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    final task = _controller.text;

    if (task.isNotEmpty) {
      widget.addTask(task);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Escribe una tarea',
              ),
              //este onSubmitted es la funccion del boton enviar del teclado del movil.
              //Lo mismo que el boton ElevatedButton de abajo.
              onSubmitted: (_) => _submit(),
            ),
          ),
          SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: _submit,
            child: Text('Agregar'),
          ),
        ],
      ),
    );
  }
}
