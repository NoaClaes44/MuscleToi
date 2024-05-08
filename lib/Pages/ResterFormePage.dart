import 'package:flutter/material.dart';

import 'NutritonPage.dart';
import 'AccueilPage.dart';

class ResterFormePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rester en forme'),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection('Débutant', ['Marche • debutant', 'Exercices • debutant', 'Cardio • debutant', 'Exercices • debutant', 'Marche • debutant']),
              SizedBox(height: 20),
              _buildSection('Intermédiaire', ['Marche • Intermédiaire', 'Exercices • Intermédiaire', 'Cardio • Intermédiaire', 'Exercices • Intermédiaire', 'Marche • Intermédiaire']),
              SizedBox(height: 20),
              _buildSection('Avancé', ['Marche • Avancé', 'Exercices • Avancé', 'Cardio • Avancé', 'Exercices • Avancé', 'Marche • Avancé']),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF4B0DD8)),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant, color: Color(0xFF4B0DD8)),
            label: 'Nutrition',
          ),
        ],
        currentIndex: 0, // Indice de l'élément actuellement sélectionné
        selectedItemColor: Color(0xFF4B0DD8),
        unselectedItemColor: Color(0xFF4B0DD8), // Couleur des libellés non sélectionnés
        onTap: (int index) {
          // Gérer le changement d'onglet ici
          if (index == 0) {
            // Naviguer vers la page d'accueil
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AccueilPage()),
            );
          } else if (index == 1) {
            // Naviguer vers la page de nutrition
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NutritionPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildSection(String title, List<String> exercises) {
    List<List<String>> images = [
      [
        'assets/images/rest_marDebut.jpg',
        'assets/images/abdoDebut.jpg',
        'assets/images/rest_carDebut.jpg',
        'assets/images/jambesDebut.jpg',
        'assets/images/rest_Debut2.jpg',
      ],
      [
        'assets/images/rest_marInter.jpg',
        'assets/images/rest_exoInter.jpg',
        'assets/images/cardioAv.jpg',
        'assets/images/rest_exoInter2.jpg',
        'assets/images/rest_marInter2.jpg',
      ],
      [
        'assets/images/rest_marAv.jpg',
        'assets/images/rest_exoAv.jpg',
        'assets/images/rest_carAv.jpg',
        'assets/images/rest_exoAv2.jpg',
        'assets/images/rest_marAv2.jpg',
      ],
    ];

    int index;
    if (title == 'Débutant') {
      index = 0;

    } else if (title == 'Intermédiaire') {
      index = 1;
    } else {
      index = 2;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '5 séances',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/images/restenforme_cover.jpg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          for (int i = 0; i < 5; i++)
            _buildWorkout('${exercises[i]}', images[index][i]),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildWorkout(String name, String image) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(right: 10), // Ajout de marge à droite pour l'espace
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: 8), // Ajout d'un petit espace entre l'image et le texte
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
