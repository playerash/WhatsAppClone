import 'package:WhatsAppClone/home.dart';
import 'package:WhatsAppClone/screens/login_numero.dart';
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

  signIn(AuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInComCode(smsCode, verId) {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: smsCode,
    );
    signIn(credential);
  }

  Future<void> verificarNumero(numeroTelefone, idVerificacao) async {
    final PhoneVerificationCompleted verificado =
        (AuthCredential authResultado) {
      AuthService().signIn(authResultado);
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
