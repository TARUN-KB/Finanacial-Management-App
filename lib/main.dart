import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_validator/InputDeco_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_validator/signin.dart';

void main() {
  runApp((MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FormPage(),
  )));
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  String name,email,phone,monthlyexpense;
  String income,incometype,budgetmode ;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    //child: Image.network("https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),
                  ),
                  Text("Sign Up",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent[200]
                  ),),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.person,"Full Name"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      onSaved: (String value){
                        name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.email,"Email"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please a Enter';
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                      onSaved: (String value){
                        email = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:buildInputDecoration(Icons.phone,"Phone No"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please enter phone no ';
                        }
                        if(value.length !=10)
                        {return "Enter Valid phone number";}

                        return null;
                      },
                      onSaved: (String value){
                        phone = value;
                      },
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(9, 4, 4, 4),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue,width:1.5 ),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.grey,

                    ),

                    child: DropdownButtonFormField<String>(
                      hint: Row(
                        children: [
                          Icon(Icons.money,color: Colors.amberAccent[200],),
                          SizedBox(width: 13,),
                          Text("Income",
                          style: TextStyle(
                            color: Colors.amberAccent[200],
                            fontSize: 17,
                          ),),
                        ],
                      ),
                      value: income,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,

                      style: const TextStyle(color: Colors.deepPurple),

                      onChanged: (newValue) {
                        setState(() {
                          income = newValue;
                        });

                      },
                      items: <String>['YES', 'NO']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                          style: TextStyle(
                            fontSize: 17,
                              color: Colors.black
                          ),),
                        );
                      }).toList(),
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.fromLTRB(9, 4, 4, 4),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue,width:1.5 ),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.grey,

                    ),

                    child: DropdownButton<String>(
                      hint: Row(
                        children: [
                          Icon(Icons.money,color: Colors.amberAccent[200],),
                          SizedBox(width: 13,),
                          Text("Income Type",
                            style: TextStyle(
                              color: Colors.amberAccent[200],
                              fontSize: 17,
                            ),),
                        ],
                      ),
                      value: incometype,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline:SizedBox(),
                      style: const TextStyle(color: Colors.deepPurple),

                      onChanged: (newValue) {
                        setState(() {
                          incometype = newValue;
                        });
                      },
                      items: <String>['Consistent', 'Inconsistent']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black
                            ),),
                        );
                      }).toList(),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(9, 4, 4, 4),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 14),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue,width:1.5 ,),
                      borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey,

                    ),

                    child: DropdownButton<String>(
                      hint: Row(
                        children: [
                          Icon(Icons.money,color: Colors.amberAccent[200],),
                          SizedBox(width: 13,),
                          Text("Budget Mode",
                            style: TextStyle(
                              color: Colors.amberAccent[200],

                              fontSize: 17,
                            ),),
                        ],
                      ),
                      value: budgetmode,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline:SizedBox(),
                      style: const TextStyle(color: Colors.deepPurple),

                      onChanged: (newValue) {
                        setState(() {
                          budgetmode = newValue;
                        });
                      },
                      items: <String>['YES', 'NO']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black
                            ),),
                        );
                      }).toList(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:buildInputDecoration(Icons.account_balance_wallet,"Monthly Expenditure"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please enter the Monthly Expenditure ';
                        }


                        return null;
                      },
                      onSaved: (String value){
                        monthlyexpense = value;
                      },
                    ),
                  ),

                   //SizedBox(height: 4,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.lock,"Password"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please Enter Password';
                        }
                        return null;
                      },

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      controller: confirmpassword,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.lock,"Confirm Password",),

                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please re-enter password';
                        }
                        print(password.text);

                        print(confirmpassword.text);

                        if(password.text!=confirmpassword.text){
                          return "Password does not match";
                        }

                        return null;
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));

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
      ),
    );
  }
}




