import 'package:flutter/material.dart';

//Al definir la función como un Future<void>, se garantiza que el resto del código no se ejecutará
//hasta que el usuario haya interactuado con el diálogo y la acción del usuario se haya resuelto.
Future<void> showErrorDialog(
  BuildContext context,
  String text,
) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('An error ocurred'),
          content: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      });
}
