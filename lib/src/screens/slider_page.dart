import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheck(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imágen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 300.0,
      onChanged: (_bloquear)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://webstockreview.net/images/batman-clipart-transparent-19.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheck() {
    /* return Checkbox(
      value: _bloquear,
      onChanged: (valor) {
        setState(() {
          _bloquear = valor;
        });
      },
    ); */

    return CheckboxListTile(
      title: Text('Bloquear slider:'),
      value: _bloquear,
      onChanged: (valor) {
        setState(() {
          _bloquear = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider:'),
      value: _bloquear,
      onChanged: (valor) {
        setState(() {
          _bloquear = valor;
        });
      },
    );
  }
}
