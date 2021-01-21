import 'package:flutter/material.dart';


class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/BackgroundImage.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Container(
                  color: Colors.transparent,
                  child :Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/logo.png', height: 50, width: 50),
                      SizedBox(width: 120),
                      Text("STIX", style: TextStyle( color: Colors.blueAccent[200], fontSize: 20, fontFamily: 'pallini')),
                      SizedBox(width: 120),
                      Column(
                          children: [
                            Text('Pseudo', style: TextStyle(color: Colors.blueAccent[100])),
                            Text('Solde :', style: TextStyle(color: Colors.blueAccent[100]))
                          ]
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                    margin: EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            alignment: AlignmentDirectional.center,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 11,
                            color: Colors.transparent,
                            child: Text("Publicités", style: TextStyle( fontSize: 30, fontFamily: 'GultanBonte'))
                        ),
                        Container(
                            alignment: AlignmentDirectional.center,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 6,
                            color : Colors.transparent,
                            child: Column(
                              children: [
                                RaisedButton(onPressed: () => Navigator.pushReplacementNamed(context, "/Infos")),
                                Text("Actus et choses a parler", style: TextStyle(color: Colors.blueAccent[100], fontSize: 25, fontFamily: 'GultanBonte')),
                                Text("Textes a ecrire ici")
                              ],
                            )
                        ),
                        SizedBox(height : 20),
                      ],
                    )
                ),
                Text("Les meilleurs gagnants", style: TextStyle(fontSize: 40, color: Colors.blueAccent[100], fontFamily: 'GultanBonte')),
                SizedBox(height: 25),
                Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      runSpacing: 10.0,
                      alignment: WrapAlignment.center,
                      spacing: 10.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Container(
                            color: Colors.black,
                            height : MediaQuery.of(context).size.height / 8 ,
                            width : MediaQuery.of(context).size.width / 2.5,
                            child: Image.asset("assets/video.jpg", fit: BoxFit.cover)
                        ),
                        Container(
                            color: Colors.black,
                            height : MediaQuery.of(context).size.height / 8 ,
                            width : MediaQuery.of(context).size.width / 2.5,
                            child: Image.asset("assets/video.jpg", fit: BoxFit.cover)
                        ),
                        Container(
                            color: Colors.black,
                            height : MediaQuery.of(context).size.height / 8 ,
                            width : MediaQuery.of(context).size.width / 2.5,
                            child: Image.asset("assets/video.jpg", fit: BoxFit.cover)
                        ),
                        Container(
                            color: Colors.black,
                            height : MediaQuery.of(context).size.height / 8 ,
                            width : MediaQuery.of(context).size.width / 2.5,
                            child: Image.asset("assets/video.jpg", fit: BoxFit.cover)
                        ),
                        Container(
                            color: Colors.black,
                            height : MediaQuery.of(context).size.height / 8 ,
                            width : MediaQuery.of(context).size.width / 2.5,
                            child: Image.asset("assets/video.jpg", fit: BoxFit.cover)
                        ),
                        Container(
                            color: Colors.black,
                            height : MediaQuery.of(context).size.height / 8 ,
                            width : MediaQuery.of(context).size.width / 2.5,
                            child: Image.asset("assets/video.jpg", fit: BoxFit.cover)
                        ),
                      ],
                    ),
                ),
                Row(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      child:
                      Text("pub pub pub pub pub pub pub pub pub pub pub pub", style: TextStyle(color: Colors.blueAccent[100])
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Mon Compte',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Magasin',
              ),
            ],
          ),
        )
    );
  }
}