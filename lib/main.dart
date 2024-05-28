import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de IMC',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height = 0;
  double _weight = 0;

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Calculadora IMC',),
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: Key('Altura'),
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
              ),
              onChanged: (value) {
                setState(() {
                  _height = double.parse(value) / 100;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: Key('peso'),
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
              onChanged: (value) {
                setState(() {
                  _weight = double.parse(value);
                });
              },
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              double imc = _weight / (_height * _height);
              String message = 'Seu IMC é ${imc.toStringAsFixed(2)}.';
              if (imc < 18.5) {
                message += '\nVocê está abaixo do peso.';
              } else if (imc < 24.9) {
                message += '\nVocê tem um peso normal.';
              } else if (imc < 29.9) {
                message += '\nVocê está acima do peso.';
              } else {
                message += '\nVocê é obeso.';
              }
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Resultado'),
                    content: Text(message),
                  );
                },
              );
            },
            child: Text('Calcular IMC'),
          ),
        ],
      ),
    );
  }
}