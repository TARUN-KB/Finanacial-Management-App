import 'package:flutter/material.dart';
import 'package:flutter_form_validator/InputDeco_design.dart';
import 'package:flutter_form_validator/main.dart';

void main() {
  runApp((MaterialApp(
    debugShowCheckedModeBanner: false,
    home: signin(),
  )));
}

class signin extends StatefulWidget {
  final email;
  final password;

  const signin({key,@required this.email, this.password}):super(key: key);
  @override
  _signinState createState() => _signinState(email,password);
}

class _signinState extends State<signin> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email="";
  String password="";
  bool flag=false;
  _signinState(this.email,this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("reach",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.white,fontFamily:"teko" ),),
                Text("Sign in",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.email,"Email"),
                    validator: (String value){

                      if(value.isEmpty)
                      {
                        return 'Please enter the email id';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please enter a valid email id';
                      }
                      if(value!=email)
                        {
                          return 'This email id does not exist';
                        }
                      else
                        {
                          flag=true;
                        }

                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(

                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Password"),

                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter the password';
                      }
                      if(value==password && flag)
                        {
                          return null;
                        }
                      else{
                        return 'Password is incorrect';
                      }


                    },


                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: (){

                      if(_formkey.currentState.validate())
                      {
                        print("successful");
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>signin(email:email,password:password)));

                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue,width: 2)
                    ),
                    textColor:Colors.white,child: Text("Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
