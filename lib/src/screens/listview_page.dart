import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollControler = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _agrego10();

    _scrollControler.addListener(() {
      if (_scrollControler.position.pixels ==
          _scrollControler.position.maxScrollExtent) {
        //_agrego10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollControler,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/spinner.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    new Timer(Duration(seconds: 2), () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agrego10();
    });
    return Future.delayed(Duration(seconds: 2));
  }

  void _agrego10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _loading = true;
    setState(() {});

    return new Timer(Duration(seconds: 2), respuestHTTP);
  }

  void respuestHTTP() {
    _loading = false;

    _scrollControler.animateTo(
      _scrollControler.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );

    _agrego10();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollControler.dispose();
  }

  Widget _crearLoading() {
    if (_loading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
