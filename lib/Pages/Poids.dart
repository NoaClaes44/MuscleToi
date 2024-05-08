import 'package:flutter/material.dart';

import 'ChoixGenre.dart';

class PoidsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Clé pour le formulaire
  final _poidsController = TextEditingController(); // Contrôleur pour le champ de texte

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Poids'), // Titre de la page
          backgroundColor: Color(0xFF4B0DD8),
        ),
        body: SingleChildScrollView(
          // Ajout du SingleChildScrollView pour permettre le défilement
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey, // Assignation de la clé au formulaire
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Connaissance de votre corps', // Titre principal
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/kilogrammes.png', // Image de l'échelle de poids
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Entrez votre poids actuel (kg) :', // Texte explicatif
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _poidsController, // Contrôleur pour le champ de texte
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Clavier numérique
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre poids.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Ex: 73.4', // Placeholder
                      labelText: 'Poids (kg)', // Label du champ de texte
                      border: OutlineInputBorder(), // Bordure du champ de texte
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Vérification de la validation du formulaire
                      if (_formKey.currentState!.validate()) {
                        // Si le formulaire est valide, naviguer vers la prochaine page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChoixGenrePage()),
                        );
                      }
                    },
                    child: Text('Suivant'), // Texte du bouton
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color(0xFF4B0DD8)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
