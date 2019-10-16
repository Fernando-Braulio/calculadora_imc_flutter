import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados!";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _infoText = "Informe seus dados!";
    });
  }

  void calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);

      if(imc < 17){
        _infoText = "Muito abaixo do peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 17 && imc < 18.49){
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 18.5 && imc < 24.99){
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 25 && imc < 29.99){
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 30 && imc < 34.99){
        _infoText = "Obesidade I (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 35 && imc < 39.99){
        _infoText = "Obesidade II (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 40){
        _infoText = "Obesidade III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //Tentar alargar toda a largura da tela
          children: <Widget>[
            Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso (kg - *apenas números*)",
                  labelStyle: TextStyle(
                      color: Colors.green
                  )
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24.0
              ),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (cm - *apenas números*)",
                  labelStyle: TextStyle(
                      color: Colors.green
                  )
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24.0
              ),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: calculate,
                  child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  color: Colors.green,
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
