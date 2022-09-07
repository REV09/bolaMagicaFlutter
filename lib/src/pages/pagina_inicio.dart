import 'dart:math';

import 'package:desarrollo_de_apps_app_tarea/src/respuestas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginaInicio extends StatefulWidget {
  @override
  createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  final _styleText = TextStyle(fontSize: 25);
  final _tituloStyle = TextStyle(fontSize: 35, letterSpacing: 0.6);
  TextEditingController controladorPregunta = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("La bola magica",
            style: GoogleFonts.getFont('Bitter', textStyle: _tituloStyle)),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade800,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            "https://gifimage.net/wp-content/uploads/2017/10/magic-8-ball-gif-6.gif",
            height: 250.0,
            width: 250.0,
            fit: BoxFit.contain,
          ),
          Text(
            'Preguntale a la bola magica',
            style: GoogleFonts.getFont('Dancing Script',
                textStyle: _styleText, fontWeight: FontWeight.w700),
          ),
          TextField(
              style: _styleText,
              decoration: InputDecoration(
                  hintText: 'Ejemplo: ¿Que hora es?',
                  labelText: 'Pregunta:',
                  helperText:
                      'Solo respondera lo siguiente: si, no, talvez, no lo se, preguntame despues, ahora no estoy, ¿en serio?',
                  suffixIcon: Icon(Icons.question_mark),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              controller: controladorPregunta)
        ],
      )),
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        FloatingActionButton(
          child: Icon(Icons.restart_alt),
          onPressed: limpiarCampoTexto,
          backgroundColor: Colors.cyan.shade800,
        ),
        Expanded(child: SizedBox(width: 15)),
        FloatingActionButton(
          child: Icon(Icons.check_box),
          onPressed: obtenerPregunta,
          backgroundColor: Colors.cyan.shade800,
        )
      ],
    );
  }

  void obtenerPregunta() {
    String respuesta = responderPregunta();
    _showMyDialog(controladorPregunta.text, respuesta);
  }

  String responderPregunta() {
    String respuesta =
        respuestas.elementAt(Random().nextInt(respuestas.length));
    return respuesta;
  }

  void limpiarCampoTexto() {
    setState(() {
      controladorPregunta.clear();
    });
  }

  Future<void> _showMyDialog(String pregunta, String respuesta) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('La bola magica responde'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(pregunta),
                Text(respuesta),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
