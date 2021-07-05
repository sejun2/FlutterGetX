import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '비만도 계산기',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State {
  final _formKey = GlobalKey<FormState>();

  final _heightController =
  TextEditingController(); //컨트롤러는 dispose 될때 같이 dispose 해야함.
  final _weightController = TextEditingController();

  void _onOkBtnClicked() {
    if (_formKey.currentState?.validate() == true) {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>
          BmiResultPage(double.tryParse(_heightController.text.trim())!,
            double.tryParse(_weightController.text.trim())!)));
    }else{

    }
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration textFieldDecoration =
    InputDecoration(border: OutlineInputBorder(), labelText: 'TEST');

    return Scaffold(
        appBar: AppBar(
          title: Text('비만도 계산기'),
        ),
        body: Padding(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value
                        ?.trim()
                        .isEmpty == true) {
                      return '키를 입력하세요';
                    }
                    return null;
                  },
                  controller: _heightController,
                  decoration: textFieldDecoration,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value
                        ?.trim()
                        .isEmpty == true) {
                      return '몸무게를 입력하세요';
                    }
                    return null;
                  },
                  controller: _weightController,
                  decoration: textFieldDecoration,
                  keyboardType: TextInputType.number,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _onOkBtnClicked,
                    child: Text('결과'),
                  ),
                )
              ],
            ),
          ),
          padding: EdgeInsets.all(16),
        ));
  }
}

class BmiResultPage extends StatelessWidget {
  final double _height;
  final double _weight;

  BmiResultPage(this._height, this._weight);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _height.toString(),
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 16,
            ),
            Icon(
              Icons.sentiment_satisfied,
              color: Colors.green,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
