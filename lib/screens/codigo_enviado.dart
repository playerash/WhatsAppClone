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
  String idVerificacao, smsCode;
  bool codeEnviado = false;
  Future<void> verificarNumero(numeroTelefone) async {
    final PhoneVerificationCompleted verificado =
        (AuthCredential authResultado) {
      AuthService().signIn(authResultado);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AuthService().handleAuth()));
    };

    final PhoneVerificationFailed veriFalho =
        (FirebaseAuthException authException) {
      print("${authException.message}");
    };

    final PhoneCodeSent smsCodeEnviado = (String verId, [int envioForcado]) {
      idVerificacao = verId;
      setState(() {
        codeEnviado = true;
      });
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
            "Aguardando para detectar automaticamente um SMS enviado para ${widget.numeroTelefone}.",
          ),
          Container(
            width: 55,
            child: TextField(
              onChanged: (value) {
                print(smsCode);
                setState(
                  () {
                    smsCode = value;
                  },
                );
                AuthService().signInComCode(smsCode, idVerificacao);
              },
              decoration: InputDecoration(
                  hintText: "--- ---", hintStyle: TextStyle(fontSize: 30)),
              inputFormatters: [
                MaskedInputFormater("######"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Insira o código de 6 digitos"),
          ),
          FlatButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.chat,
                  color: Color(0xFF075E54),
                ),
                Text(
                  "Reenviar SMS",
                  style: TextStyle(
                    color: Color(0xFF075E54),
                  ),
                ),
              ],
            ),
          ),
          DividerConfigurado(),
          FlatButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Color(0xFF075E54),
                ),
                Text(
                  "Me ligue",
                  style: TextStyle(
                    color: Color(0xFF075E54),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
