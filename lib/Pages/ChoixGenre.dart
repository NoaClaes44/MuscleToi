import 'package:flutter/material.dart';

import 'ObjectifHomme.dart';
import 'ObjectifFemme.dart';

// Classe représentant la page de choix de genre
class ChoixGenrePage extends StatefulWidget {
  // Crée et retourne l'état associé à cette classe
  @override
  _ChoixGenrePageState createState() => _ChoixGenrePageState();
}

// Classe d'état pour la page de choix de genre
class _ChoixGenrePageState extends State<ChoixGenrePage> {
  // Booléens pour suivre si l'utilisateur a sélectionné homme ou femme
  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;

  // Méthode pour sélectionner homme
  void _selectMale() {
    // Met à jour l'état pour indiquer que l'utilisateur a sélectionné homme
    setState(() {
      _isMaleSelected = true;
      _isFemaleSelected = false;
    });
  }

  // Méthode pour sélectionner femme
  void _selectFemale() {
    // Met à jour l'état pour indiquer que l'utilisateur a sélectionné femme
    setState(() {
      _isMaleSelected = false;
      _isFemaleSelected = true;
    });
  }

  // Méthode pour naviguer vers la page appropriée en fonction du choix de genre
  void _navigateToProgrammePage(BuildContext context) {
    // Vérifie si l'utilisateur a sélectionné homme
    if (_isMaleSelected) {
      // Navigation vers la page du programme pour homme
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>ObjectifPage()),
      );
    }
    // Vérifie si l'utilisateur a sélectionné femme
    else if (_isFemaleSelected) {
      // Navigation vers la page du programme pour femme
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ObjectifFemmePage()),
      );
    }
    // Gère le cas où aucun genre n'est sélectionné
    else {
      // Afficher un message d'erreur ou prendre une action appropriée si aucun genre n'est sélectionné
    }
  }

  // Méthode de construction de l'interface utilisateur
  @override
  Widget build(BuildContext context) {
    // Retourne un MaterialApp, qui est la racine de l'interface utilisateur
    return MaterialApp(
      // La page d'accueil de l'application, qui est un Scaffold
      home: Scaffold(
        // Barre d'appel qui affiche le titre de la page
        appBar: AppBar(
          title: Text('ChoixGenre'),
          backgroundColor: Color(0xFF4B0DD8),
        ),
        // Corps de la page, centré verticalement
        body: Center(
          // Colonne pour organiser les éléments verticalement
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Widget GestureDetector pour détecter les taps sur l'option homme
              GestureDetector(
                onTap: _selectMale,
                // Conteneur contenant l'image et le texte pour l'option homme
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _isMaleSelected ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _isMaleSelected ? Colors.blue : Colors.grey,
                      width: 2,
                    ),
                  ),
                  // Contenu de l'option homme
                  child: Column(
                    children: <Widget>[
                      // Image représentant l'option homme
                      Image.asset(
                        'assets/images/mec.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      // Texte indiquant "Homme"
                      Text(
                        'Homme',
                        style: TextStyle(
                          fontSize: 20,
                          color: _isMaleSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Widget GestureDetector pour détecter les taps sur l'option femme
              GestureDetector(
                onTap: _selectFemale,
                // Conteneur contenant l'image et le texte pour l'option femme
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _isFemaleSelected ? Colors.pink : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _isFemaleSelected ? Colors.pink : Colors.grey,
                      width: 2,
                    ),
                  ),
                  // Contenu de l'option femme
                  child: Column(
                    children: <Widget>[
                      // Image représentant l'option femme
                      Image.asset(
                        'assets/images/meuf.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      // Texte indiquant "Femme"
                      Text(
                        'Femme',
                        style: TextStyle(
                          fontSize: 20,
                          color: _isFemaleSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Bouton pour continuer vers la page du programme
              ElevatedButton(
                onPressed: () {
                  // Appelle la méthode pour naviguer vers la page du programme
                  _navigateToProgrammePage(context);
                },
                // Texte du bouton "Continuer"
                child: Text('Continuer'),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF4B0DD8))
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
