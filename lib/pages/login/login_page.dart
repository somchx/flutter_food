import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String input = '';


  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // ไล่เฉดจากสีแดงไปสีน้ำเงิน
            colors: [
              Colors.white,
              Colors.blue.shade100,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(//
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 80.0,
                        color: Colors.grey.shade700,
                      ),
                      Text(
                        'LOGIN',style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.grey.shade700),
                      ),
                      Text(
                        'Enter PIN to login',style: TextStyle(fontSize: 16.0,),
                      ),
                     // Text(input,style: TextStyle(fontSize: 30.0),),
                    ],
                  ),
                ),
              ),
              //if(count ==6) _feedback = _setCheck(),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(var i=0;i<input.length;i++)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 22.0,
                          height: 22.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    for(var i=0;i<6-input.length;i++)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 22.0,
                          height: 22.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                //color: Colors.pinkAccent,
                child: Column(
                  children: [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: LoginButton(
                            number: item,
                            onClick: _handleClickButton,
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  void _handleClickButton(int num) {
    print('Hello $num');
    setState(() {
      if(num==-1){
        if (input.length>0)
        input = input.substring(0,input.length-1);
      }else{input = input + '$num';}
    });
    setState(() {
      if(input.length ==6){
        if(input == '123456'){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondRoute()));
        }
        else{
          _showMaterialDialog('ERROR', 'Invalid PIN. Please try again.');
        }
        input='';
      }
    });
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number==-2?null:() => onClick(number),
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number==-2?null:BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3.5,color: Colors.grey.shade700),
          color: Colors.blue.shade50,
        ),
        child: Center(
          child: number>=0?Text(
            '$number',
            style: Theme.of(context).textTheme.headline1 ,
          ):(number==-1?Icon(Icons.backspace_outlined,size: 28.0,):SizedBox.shrink()),
        ),
      ),
    );
  }


}
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLUTTER FOOD"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('THIS IS A HOME PAGE',style:Theme.of(context).textTheme.headline1,)),
        ],
      ),
    );
  }
}
