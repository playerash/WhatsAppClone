import 'package:WhatsAppClone/compomentes/codigo_enviado/appbar_codigo_enviado.dart';
import 'package:WhatsAppClone/compomentes/codigo_enviado/flatbutton_meligue.dart';
import 'package:WhatsAppClone/compomentes/codigo_enviado/flatbutton_reenviar.dart';
import 'package:WhatsAppClone/compomentes/divider_configurado.dart';
import 'package:WhatsAppClone/services/authservice.dart';
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

  @override
  Widget build(BuildContext context) {
    AuthService()
        .verificarNumero(widget.numeroTelefone, idVerificacao, context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarCodigoEnviado(widget.numeroTelefone),
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
                AuthService().signInComCode(smsCode, idVerificacao, context);
              },
              decoration: InputDecoration(
                hintText: "--- ---",
                hintStyle: TextStyle(fontSize: 30),
              ),
              inputFormatters: [
                MaskedInputFormater("######"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Insira o código de 6 digitos"),
          ),
          DividerConfigurado(),
          FlatButtonReenviar(),
          FlatButtonMeLigue(),
        ],
      ),
    );
  }
}
