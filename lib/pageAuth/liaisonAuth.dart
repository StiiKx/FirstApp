import 'package:flutter/material.dart';
import 'connexion.dart';
import 'inscription.dart';

class LiaisonPageAuth extends StatefulWidget {
  @override
  _LiaisonPageAuthState createState() => _LiaisonPageAuthState();
}

class _LiaisonPageAuthState extends State<LiaisonPageAuth> {

  bool affichePageConnexion = true;

  void basculement(){
    setState(() => affichePageConnexion = !affichePageConnexion);
  }

  @override
  Widget build(BuildContext context) {

    if(affichePageConnexion){
      return Connexion(basculement : basculement);
    }else{
      return Inscription(basculement : basculement);
    }
  }
}
