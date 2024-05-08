import 'package:flutter/material.dart';

import 'Poids.dart';

class MorphoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Clé pour le formulaire
  final _tailleController = TextEditingController(); // Contrôleur pour le champ de texte

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MorphoPage'), // Titre de la page
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
                    'assets/images/echelle_taille.png', // Image de l'échelle de taille
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Entrez votre taille en centimètres :', // Texte explicatif
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number, // Clavier numérique
                    controller: _tailleController, // Contrôleur pour le champ de texte
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre taille.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Ex: 170', // Placeholder
                      labelText: 'Taille (cm)', // Label du champ de texte
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
                          MaterialPageRoute(builder: (context) => PoidsPage()),
                        );
                      }
                    },
                    child: Text('Prochain'), // Texte du bouton
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
