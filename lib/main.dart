import 'package:flutter/material.dart';
import 'package:flutter_tuto/pageAuth/connexion.dart';
import 'package:flutter_tuto/pageAuth/controleAuth.dart';
import 'package:flutter_tuto/pageAuth/inscription.dart';
import 'pageCrud/accueil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_tuto/pageCrud/infos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Utilisateur>.value(
      value: StreamProviderAuth().utilisateur,
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'GultanBonte',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Infos(),
      initialRoute: '/Passerelle',
      routes : {
        '/Accueil' : (context) => Accueil(),
        '/Inscription' : (context) => Inscription(),
        '/Infos' : (context) => Infos(),
        '/Connexion' : (context) => Connexion(),
        '/Passerelle' : (context) => Passerelle()
      }
    )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Accueil();
  }
}