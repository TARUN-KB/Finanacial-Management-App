import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_validator/InputDeco_design.dart';
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
  String income,incometype,budgetmode,password,confirmpassword ;

  //TextController to read text entered in text field
  //TextEditingController password = TextEditingController();
  //TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("reach",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.white,fontFamily:"teko" ),),
                  Text("Sign Up",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
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
                          return 'Please enter the email id';
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                          return 'Please enter a valid email id';
                        }
                        return null;
                      },
                      onChanged: (value){
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

                  Padding(
                    padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.account_balance_wallet_rounded,"Income(yes or no)"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please Enter Income(yes or no)';
                        }
                        return null;
                      },
                      onSaved: (String value){
                        income = value;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.monetization_on_rounded,"Income Tyoe(consistent or inconsistent)"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please Enter Income Tyoe(consistent or inconsistent)';
                        }
                        return null;
                      },
                      onSaved: (String value){
                        incometype = value;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.money,"Budget Mode(yes or no)"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please Enter Budget Mode(yes or no)';
                        }
                        return null;
                      },
                      onSaved: (String value){
                        budgetmode = value;
                      },
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

                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.lock,"Password"),

                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please Enter the password';
                        }
                        return null;
                      },
                      onChanged: (value){
                        password=value;
                      },


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(

                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.lock,"Confirm Password",),

                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please re-enter password';
                        }
                        print(password);

                        print(confirmpassword);

                        if(password!=confirmpassword){
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

                      //  if(_formkey.currentState.validate())
                      //  {
                         print(email);
                         print(password);
                          print("successful");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>signin(email:email,password:password)));

                      //    return;
                    //    }else{
                     //     print("UnSuccessfull");
                      //  }
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


/*
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

                        validator: (String newvalue){
                  if(newvalue.isEmpty)
                  {
                  return 'Please enter phone no ';
                  }

                  return null;
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
                */
