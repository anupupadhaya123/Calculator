import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyHomePage(),
    );
  }
}
 class MyHomePage extends StatefulWidget {
   const MyHomePage({ Key? key }) : super(key: key);
 
   @override
   _MyHomePageState createState() => _MyHomePageState();
 }
 
 class _MyHomePageState extends State<MyHomePage> {

   late int firstnum;
   late int secondnum;
   String textToDisplay = "";
   late String res;
   late String operatorToPerform;

   void btnClicked(String btnValue){

     // Setting value of button which are clicked

     if(btnValue == "C"){
       textToDisplay= "";
       firstnum = 0;
       secondnum = 0;
       res = '0'; 
     }else if(btnValue == '+' || btnValue == '-' || btnValue == 'x' || btnValue == '/')
     {
       firstnum = int.parse(textToDisplay);
       res ='';
       operatorToPerform = btnValue;
     }else if(btnValue == '='){
       secondnum = int.parse(textToDisplay);
       if(operatorToPerform == "+"){
         res = (firstnum + secondnum).toString();
       }
       if(operatorToPerform == "-"){
         res = (firstnum - secondnum).toString();
       }
       if(operatorToPerform == "x"){
         res = (firstnum * secondnum).toString();
       }
       if(operatorToPerform == "/"){
         res = (firstnum ~/ secondnum).toString();
       }
     }else{
       res = int.parse(textToDisplay + btnValue).toString();
     }

     setState(() {
       textToDisplay = res;
     });
   }

   //Creating Widgets
   Widget customButton(String btnValue){
     return Expanded(
       child: RaisedButton(
         padding: EdgeInsets.all(20.0),
       onPressed: () => btnClicked(btnValue),
       child: Text(
         "$btnValue",
         style: TextStyle(
           fontSize: 25.0
         ),
       ),
     ),
     );
   }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Calculator"),
       ),
       body: Container(
         child: Column(

           //Button From Bottom

           mainAxisAlignment: MainAxisAlignment.end,
           children: [

             Expanded(
               child: Container(
                 padding: EdgeInsets.all(10),
                 alignment: Alignment.bottomRight,
                 child: Text("$textToDisplay",
                 style: TextStyle(
                   fontSize: 25.0,
                   fontWeight: FontWeight.w600
                 ),
                 ),
               ),
             ),

             Row(
               children: [
                 customButton("9"),
                 customButton("8"),
                 customButton("7"),
                 customButton("+"),
               ],
             ),
              Row(
               children: [
                 customButton("6"),
                 customButton("5"),
                 customButton("4"),
                 customButton("-"),
               ],
             ),
              Row(
               children: [
                 customButton("3"),
                 customButton("2"),
                 customButton("1"),
                 customButton("x"),
               ],
             ),
              Row(
               children: [
                 customButton("C"),
                 customButton("0"),
                 customButton("="),
                 customButton("/"),
               ],
             ),
           ],
         ),
       ),
     );
   }
 }

