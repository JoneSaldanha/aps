import 'package:flutter/material.dart';
import 'package:pet/ui/menu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

//  BuildContext _meuContexto;


  void login(){

    Navigator.push(context,
      MaterialPageRoute(builder: (context) => MenuDashboardPage()),
    );

  }


  @override
  Widget build(BuildContext context) {
//    _meuContexto = context;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF294993), Color(0xFF8973e3), Color(0xFFa13add)])
        ),
        child: SingleChildScrollView(
          child: Stack(

            children: [
              Container(

            ),
              Container(
                margin: EdgeInsets.fromLTRB(45, 70, 45, 170),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(45, 150, 45, 0),
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left:5),
                      child:
                        Text("SEUS PETS EM BOAS MÃOS", style: TextStyle(fontSize: 30.0, color: Colors.white), textAlign: TextAlign.left, )),
                    Container(
                        margin: EdgeInsets.only(right:35, top: 20),
                        child:
                        Text("Criando pensando em você", style: TextStyle(fontSize: 15.0, color: Colors.white, ), textAlign: TextAlign.left, )),


                    Container(
                      margin: EdgeInsets.only(top: 10.8, bottom: 10.8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))

                        ),
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(top: 10.8, bottom: 10.8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                        ),
                      ),
                    ),

                    Material(elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xFF613aff),
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: login,
                        child: Text("Login",
                            textAlign: TextAlign.center,
                            style:TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    //Divider(),

                    //RaisedButton(child: Text("LOGIN WITH"),
                    //color: Colors.purple,),

                  ],),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*

Expanded(child:
TextFormField(
decoration: InputDecoration(
hintText: "Email",
border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))

),
),
),
TextFormField(
decoration: InputDecoration(
hintText: "Password",
border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
),
),*/