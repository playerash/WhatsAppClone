import 'package:WhatsAppClone/compomentes/login_numero/inserir_numero.dart';
import 'package:WhatsAppClone/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginNumero extends StatefulWidget {
  @override
  _LoginNumeroState createState() => _LoginNumeroState();
}

class _LoginNumeroState extends State<LoginNumero> {
  final TextEditingController _controlerNumeroPais = TextEditingController(
    text: "55",
  );

  final TextEditingController _controlerNumeroUsuario = TextEditingController();

  String numeroTelefone;

  String smsCode;

  String idVerificacao;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<dynamic>> dropdown = [
      DropdownMenuItem(
        child: Text("Brasil"),
      )
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Insira seu número de telefone",
          style: TextStyle(color: Color(0xFF075E54)),
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
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "o WhatsApp enviará uma mensagem SMS para confirmar seu número de telefone.",
            ),
            Container(
              width: 170,
              child: DropdownButton(
                items: dropdown,
                hint: Center(
                  child: Text("Brasil"),
                ),
                isExpanded: true,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: FittedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    //controller: _controlerNumeroPais,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: TextField(
                    //controller: _controlerNumeroUsuario,
                    onChanged: (value) {
                      setState(() {
                        numeroTelefone = value;
                      });
                    },
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 150),
              child: Text(
                  "Sujeita a cobranças de tarifas de SMS de sua operadora"),
            ),
            FittedBox(),
            RaisedButton(
              onPressed: () {
                verificarNumero(numeroTelefone);
              },
              child: Text(
                "AVANÇAR",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

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
}
