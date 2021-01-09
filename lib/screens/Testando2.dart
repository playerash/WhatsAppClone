import 'package:WhatsAppClone/compomentes/divider_configurado.dart';
import 'package:WhatsAppClone/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class CodigoEnviado extends StatefulWidget {
  final String numeroTelefone;
  CodigoEnviado(this.numeroTelefone);

  @override
  _CodigoEnviadoState createState() => _CodigoEnviadoState();
}

class _CodigoEnviadoState extends State<CodigoEnviado> {
  String idVerificacao;
  Future<void> verificarNumero(numeroTelefone) async {
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


  @override
  Widget build(BuildContext context) {
       verificarNumero(widget.numeroTelefone);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Confirmar ${widget.numeroTelefone}",
          style: TextStyle(
            color: Color(0xFF075E54),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(
            Icons.more_vert,
            color: Color(0xFF075E54),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
              "Aguardando para detectar automaticamente um SMS enviado para ${widget.numeroTelefone}."),
          TextField(
            decoration: InputDecoration(hintText: "--- ---"),
            inputFormatters: [MaskedInputFormater("### ###")],
          ),
          Text("Insira o código de 6 digitos"),
          FlatButton(
            onPressed: () {},
            child: Row(
              children: [Icon(Icons.chat), Text("Reenviar SMS")],
            ),
          ),
          DividerConfigurado(),
          FlatButton(
            onPressed: () {},
            child: Row(
              children: [Icon(Icons.phone), Text("Me ligue")],
            ),
          )
        ],
      ),
    );
  }
}
