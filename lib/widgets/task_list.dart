import 'package:flutter/material.dart';

// muestra y borra la lista
class TaskList extends StatelessWidget {
  final List<String> tasks;
  final Function(int) removeTask;

  TaskList({required this.tasks, required this.removeTask});

  @override
  Widget build(BuildContext context) {
    //utilizamos ListView
    //(gran cantidad de elementos)
    //(tiene itemCount para nuestra lista)
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        //utiliza para representar un elemento en una lista,
        //como una lista de opciones o una lista de contactos.
        //ListTile proporciona una representación visual coherente para
        //los elementos de la lista, incluyendo una etiqueta principal,
        //una etiqueta secundaria y un icono opcional.
        return ListTile(
          title: Text(tasks[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              removeTask(index);
            },
          ),
        );
      },
    );
  }
}
