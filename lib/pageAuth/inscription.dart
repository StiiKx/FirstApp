import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tuto/constants/chargement.dart';

class Inscription extends StatefulWidget {
  final Function basculement;

  Inscription({this.basculement});

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  //Collection Utilisateur depuis firestore
  final CollectionReference collectionUtil =
      FirebaseFirestore.instance.collection('utilisateurs');

  String email = '';
  String pseudo = '';
  String motDePasse = '';
  String confirmeMdp = '';

  bool chargement = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String _idUtil() {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print(user.uid);
        return user.uid;
      } else {
        return "pas d'utilisateurs courant";
      }
    }

    return chargement
        ? Chargement()
        : Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/BackgroundImage.jpg"),
                    fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 100.0, horizontal: 30.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset("assets/logo.png",
                                height: 100.0, width: 100.0),
                            SizedBox(height: 10.0),
                            Center(
                                child: Text(
                                    "Créer un compte Stix pour accéder à notre appli",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent[100]))),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Adresse Mail",
                                  border: OutlineInputBorder()),
                              validator: (val) => val.isEmpty
                                  ? 'Entrez une adresse mail'
                                  : null,
                              onChanged: (val) => email = val,
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Pseudo",
                                  border: OutlineInputBorder()),
                              validator: (val) =>
                                  val.isEmpty ? 'Entrez votre pseudo' : null,
                              onChanged: (val) => pseudo = val,
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Mot de passe",
                                  border: OutlineInputBorder()),
                              validator: (val) => val.length < 6
                                  ? 'Votre mot de passe doit contenir au moins 6 caractères'
                                  : null,
                              onChanged: (val) => motDePasse = val,
                              obscureText: true,
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Confirmez le mot de passe",
                                  border: OutlineInputBorder()),
                              validator: (val) => val != motDePasse
                                  ? 'Le mot de passe doit correspondre a la confirmation'
                                  : null,
                              onChanged: (val) => confirmeMdp = val,
                              obscureText: true,
                            ),
                            FlatButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    chargement = true;
                                  });
                                  UserCredential result = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: motDePasse);
                                  await collectionUtil.doc(_idUtil()).set({
                                    'idUtil': _idUtil(),
                                    'pseudo': pseudo,
                                    'email': email
                                  });
                                  if (result == null) {
                                    setState(() => chargement = true);
                                  }
                                }
                              },
                              color: Colors.blueAccent,
                              child: Text("S'inscrire"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                            OutlineButton(
                              onPressed: () {
                                widget.basculement();
                              },
                              borderSide: BorderSide(
                                  width: 2.0, color: Colors.blueAccent),
                              child: Text("Déja Inscrit ?"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ],
                        ))),
              ),
            ));
  }
}
