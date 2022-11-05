import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'AuthServices.dart';
import 'databaseFunctions.dart';
import 'home_screen.dart';

class UserData extends StatefulWidget {

  final String uid;
  UserData({required this.uid});

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();

  // String uid = uid;

  @override
  Widget build(BuildContext context) {

    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value){
        if(value!.isEmpty){
          return('Please enter your name');
        }
        return null;
      },
      onSaved: (value){
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15)
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return("Please enter your email id");
        }
        //reg expression for email validation
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return("Please enter a valid email id");
        }
        return null;
      },
      onSaved: (value){
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15)
      ),
    );

    final ageField = TextFormField(
      autofocus: false,
      controller: ageController,
      keyboardType: TextInputType.number,
      validator: (value){
        if(value!.isEmpty){
          return('Please enter your age');
        }
        return null;
      },
      onSaved: (value){
        ageController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.calendar_today),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15)
      ),
    );

    final cityField = TextFormField(
      autofocus: false,
      controller: cityController,
      keyboardType: TextInputType.name,
      validator: (value){
        if(value!.isEmpty){
          return('Please enter your city');
        }
        return null;
      },
      onSaved: (value){
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.home),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15)
      ),
    );

    final nextButton = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(25),
        color: Color(0xff4D7482),
        child: MaterialButton(
          onPressed: ()async{
            final uid = AuthService().inputData();
            await create('users', uid!, nameController.text, cityController.text, emailController.text, ageController.text);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Homescreen()));
          },
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
    ));

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    emailField,
                    SizedBox(height: 30,),
                    nameField,
                    SizedBox(height: 30,),
                    ageField,
                    SizedBox(height: 30,),
                    cityField,
                    SizedBox(height: 30,),
                    nextButton
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
