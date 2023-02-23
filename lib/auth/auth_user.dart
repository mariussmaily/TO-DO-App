import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;
  const AuthUser(this.isEmailVerified);

  //Crea un Factory Method en la clase AuthUser
  //que permite crear instancias de AuthUser a partir de un objeto User obtenido de Firebase,
  //y devuelve una nueva instancia de AuthUser con la propiedad emailVerified inicializada.
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
