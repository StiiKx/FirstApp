import 'package:flutter/material.dart';
import 'package:flutter_tuto/pageAuth/controleAuth.dart';
import 'package:flutter_tuto/pageAuth/inscription.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Infos extends StatefulWidget {
  @override
  _InfosState createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  String pseudo, email;
  @override
  Widget build(BuildContext context) {

    final utilisateur = Provider.of<Utilisateur>(context);

    GetCurrentUserData(idUtil: utilisateur.idUtil).donneesUtil.forEach((snapshot){
      this.pseudo = snapshot.pseudo;
      this.email = snapshot.email;
    });

    return Scaffold(
        body : Container(
            alignment: AlignmentDirectional.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Pseudo : $pseudo"),
                Text("Adresse email : $email"),
                RaisedButton(
                    color: Colors.blue,
                    onPressed: () async {
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  setState(() {
                    Navigator.pop(context);
                  });
                })
              ],
            )
        )
    );
  }
}
