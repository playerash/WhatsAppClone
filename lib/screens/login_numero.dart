import 'package:WhatsAppClone/compomentes/login_numero/app_bar_login_numero.dart';
import 'package:WhatsAppClone/compomentes/login_numero/botao_login_numero.dart';
import 'package:WhatsAppClone/compomentes/login_numero/dropdown_login_numero.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter/material.dart';

class LoginNumero extends StatefulWidget {
  @override
  _LoginNumeroState createState() => _LoginNumeroState();
}
class _LoginNumeroState extends State<LoginNumero> {
  final TextEditingController _controlerNumeroPais = TextEditingController(
    text: "+55 ",
  );

  final TextEditingController _controlerNumeroUsuario = TextEditingController();
  String numeroTelefone;
  @override
  Widget build(BuildContext context) {
    numeroTelefone = _controlerNumeroPais.text + _controlerNumeroUsuario.text;
    List<DropdownMenuItem<dynamic>> dropdown = [
      DropdownMenuItem(
        child: Text("Brasil"),
      )
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarLoginNumero(),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "o WhatsApp enviará uma mensagem SMS para confirmar seu número de telefone.",
            ),
            DropdownLoginNumero(dropdown),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _controlerNumeroPais,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _controlerNumeroUsuario,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      MaskedInputFormater('(##) # ####-####'),
                    ],
                    onChanged: (value) {
                      numeroTelefone = _controlerNumeroPais.text + value;
                    },
                  ),
                ),
                Spacer()
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 150),
              child: Text(
                  "Sujeita a cobranças de tarifas de SMS de sua operadora"),
            ),
            FittedBox(),
            BotaoLoginNumero(numeroTelefone)
          ],
        ),
      ),
    );
  }
}