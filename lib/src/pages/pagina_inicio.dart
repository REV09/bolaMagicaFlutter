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
    String _pregunta = "";

    return Scaffold(
      appBar: AppBar(
        title: Text("La bola magica",
            style: GoogleFonts.getFont('Bitter', textStyle: _tituloStyle)),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade800,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Preguntale a la bola magica',
            style: GoogleFonts.getFont('Dancing Script',
                textStyle: _styleText, fontWeight: FontWeight.w700),
          ),
          TextField(
              style: _styleText,
              decoration: InputDecoration(
                  hintText: 'Ejemplo: ¿Tengo que ir a comer?',
                  labelText: 'Pregunta',
                  helperText:
                      'Solo respondera lo siguiente: si, no, talvez, no lo se, preguntame despues, ahora no estoy, ¿en serio?',
                  suffixIcon: Icon(Icons.question_mark),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              controller: controladorPregunta)
        ],
      )),
      floatingActionButton: _crearBotones(_pregunta),
    );
  }

  Widget _crearBotones(String pregunta) {
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
    print(controladorPregunta.text);
  }

  void limpiarCampoTexto() {
    setState(() {
      controladorPregunta.clear();
    });
  }
}
