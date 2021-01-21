import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tuto/pageAuth/liaisonAuth.dart';
import 'package:flutter_tuto/pageCrud/accueil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tuto/constants/chargement.dart';

class Utilisateur {
  String idUtil;

  Utilisateur({ this.idUtil});
}

class DonneesUtil {
  String email;
  String pseudo;

  DonneesUtil ({ this.email, this.pseudo, idUtil });
}

class StreamProviderAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Creation d un obj utilisateur provenant de la classe firebase User
  Utilisateur _utilisateurDeFirebaseUser(User user){
    return user != null ? Utilisateur(idUtil: user.uid) : null;
  }

  //diffusion de l etat d authentification de l utilisateur
Stream<Utilisateur> get utilisateur {
    return _auth.authStateChanges().map(_utilisateurDeFirebaseUser);
}
}

class Passerelle extends StatefulWidget {
  @override
  _PasserelleState createState() => _PasserelleState();
}

class _PasserelleState extends State<Passerelle> {
  @override
  Widget build(BuildContext context) {
    final utilisateur = Provider.of<Utilisateur>(context);
    // si l utilisateur existe on le dirige direct a l accueil sinon on le dirige a l authentification
    if(utilisateur == null){
      return LiaisonPageAuth();
    }else{
      return Accueil();
    }
  }
}

class GetCurrentUserData {
  String idUtil;
  GetCurrentUserData({ this.idUtil });

  //la reference de la collection utilisateur
  final CollectionReference collectionUtil = FirebaseFirestore.instance.collection('utilisateurs');

  DonneesUtil _donneesUtilDeSnapshot(DocumentSnapshot snapshot){
    return DonneesUtil(
      pseudo: snapshot["pseudo"],
      email: snapshot["email"],
    );
  }

  //Obtenir donnees utilisateur en stream

Stream<DonneesUtil> get donneesUtil {
    return collectionUtil.doc(idUtil).snapshots().map(_donneesUtilDeSnapshot);
}
}
