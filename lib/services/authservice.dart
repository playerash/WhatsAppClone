import 'package:WhatsAppClone/screens/Testando2.dart';
import 'package:WhatsAppClone/screens/Teste.dart';
import 'package:WhatsAppClone/screens/abertura_screen.dart';
import 'package:WhatsAppClone/screens/login_numero.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  //handless
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Testando();
        } else {
          return LoginNumero();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential);
  }
}
