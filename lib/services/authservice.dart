import 'package:WhatsAppClone/home.dart';
import 'package:WhatsAppClone/models/usuario.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/login_numero.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:WhatsAppClone/compomentes/mocks.dart';
import 'package:WhatsAppClone/main.dart';

class AuthService {
  //handless
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Home(cameras, contatoConversa, contatoChamada, contatoStatus);
        } else {
          return LoginNumero();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  dadosUsuario(Usuario usuario) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth firebaseUser = FirebaseAuth.instance;
    db.collection("usuarios").doc(firebaseUser.currentUser.uid).set(usuario.toMap());
  }

  signIn(AuthCredential credential, context) {
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((firebaseUser) {});

    Navigator.pushReplacementNamed(context, "/editar_perfil");
  }

  //Verificação manual do numero
  signInComCode(smsCode, verId, context) {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: smsCode,
    );
    signIn(credential, context);
  }

//Verificação automatica de numero
  Future<void> verificarNumero(numeroTelefone, idVerificacao, context) async {
    final PhoneVerificationCompleted verificado =
        (AuthCredential authResultado) {
      AuthService().signIn(authResultado, context);
    };

    final PhoneVerificationFailed veriFalho =
        (FirebaseAuthException authException) {
      print("${authException.message}");
    };

    final PhoneCodeSent smsCodeEnviado = (String verId, [int envioForcado]) {
      idVerificacao = verId;
    };

    final PhoneCodeAutoRetrievalTimeout smsAtrasou = (String verId) {
      idVerificacao = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: numeroTelefone,
      timeout: Duration(seconds: 30),
      verificationCompleted: verificado,
      verificationFailed: veriFalho,
      codeSent: smsCodeEnviado,
      codeAutoRetrievalTimeout: smsAtrasou,
    );
  }
}
