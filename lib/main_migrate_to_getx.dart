import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetXApp());
}

class GetXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GetXPage(),
    );
  }
}

class GetXPage extends StatefulWidget {


  @override
  _GetXPageState createState() => _GetXPageState();
}

class _GetXPageState extends State<GetXPage> {
  var _formKey = GlobalKey<FormState>();

  var _heightController = TextEditingController();
  var _widthController  = TextEditingController();

  void onBtnOkClicked(){
    if(_formKey.currentState?.validate() == true){
      Get.to(BmiResultPage2(double.tryParse(_heightController.text.trim())!,double.tryParse(_widthController.text.trim())!));
    }
  }
  @override
  void dispose() {
    _heightController.dispose();
    _widthController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기'),),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _heightController,
                  validator: (value) {
                    if(value?.trim().isEmpty == true){
                      return '에러';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: '키 입력', border: OutlineInputBorder()),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _widthController,
                  validator: (value) {
                    if(value?.trim().isEmpty == true){
                      return '에러';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: '몸무게 입력', border: OutlineInputBorder())
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      onBtnOkClicked();
                    },
                    child: Text('결과'),
                  ),
                )
              ],
            ),
          )
        ));
  }
}


class BmiResultPage2 extends StatelessWidget {
  final double _height;
  final double _weight;

  BmiResultPage2(this._height, this._weight);



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

