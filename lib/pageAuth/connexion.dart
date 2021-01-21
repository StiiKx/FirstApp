import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tuto/constants/chargement.dart';

class Connexion extends StatefulWidget {

  final Function basculement;
  Connexion({ this.basculement });
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  String email = "";
  String motDePasse = "";

  bool chargement = false;

  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return chargement ? Chargement() : Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/BackgroundImage.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 150.0, horizontal: 30.0),
            child: Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/logo.png', height: 100.0, width: 100.0),
                  Center(
                    child: Text("Bienvenue sur Stix !!",
                    style: TextStyle( fontSize: 30.0))
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(

                      ),
                    ),
                    validator: (val) => val.isEmpty ? "Entrez votre adresse mail" : null,
                    onChanged: (val) => email = val,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Mot de Passe",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (val) => val.length < 6 ? "Mot de passe trop court" : null,
                    onChanged: (val) => motDePasse = val,
                  ),
                      SizedBox(height: 10.0),
                      FlatButton(
                          onPressed: () async {
                            if(_keyForm.currentState.validate()){
                              setState(() {
                                chargement = true;
                              });
                              UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: motDePasse);
                              if(result == null) {
                                setState(() => chargement = false);                              }
                            }
                          },
                          color: Colors.blueAccent,
                          child: Text("Connexion"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      ),
                  OutlineButton(
                    onPressed: (){
                      widget.basculement();
                    },
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                    child: Text("Vous n'avez pas de compte ?"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  )
                ],
              )
            )
          )
        )
    );
  }
}
