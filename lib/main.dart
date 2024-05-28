import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Altura',
                    fillColor: Colors.white,
                    filled: true,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}