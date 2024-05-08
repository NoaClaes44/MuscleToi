import 'package:flutter/material.dart';
import 'AccueilPage.dart';
import 'NutritonPage.dart';
import 'ExerciseDetailsPage.dart'; // Importer la nouvelle page

class PerdrePoidsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perdre du poids'),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(context, 'Débutant', [
                'Corps entier • debutant',
                'Abdo • debutant',
                'Cardio • debutant',
                'Jambes • debutant',
                'Abdo • debutant'
              ]),
              SizedBox(height: 20),
              _buildSection(context, 'Intermédiaire', [
                'Corps entier • Intermédiaire',
                'Abdo • Intermédiaire',
                'Cardio • Intermédiaire',
                'Jambes • Intermédiaire',
                'Abdo • Intermédiaire'
              ]),
              SizedBox(height: 20),
              _buildSection(context, 'Avancé', [
                'Corps entier • Avancé',
                'Abdo • Avancé',
                'Cardio • Avancé',
                'Jambes • Avancé',
                'Abdo • Avancé'
              ]),
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
        currentIndex: 0,
        selectedItemColor: Color(0xFF4B0DD8),
        unselectedItemColor: Color(0xFF4B0DD8),
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AccueilPage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NutritionPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<String> exercises) {
    List<List<String>> images = [
      [
        'assets/images/corpsdebut.jpg',
        'assets/images/abdoDebut.jpg',
        'assets/images/cardioDebut.jpg',
        'assets/images/jambesDebut.jpg',
        'assets/images/abdoDebut2.jpg',
      ],
      [
        'assets/images/pdm.jpg',
        'assets/images/abdoInter.jpg',
        'assets/images/cardioInter.jpg',
        'assets/images/jambesInter.jpg',
        'assets/images/abdoInter2.jpg',
      ],
      [
        'assets/images/corpsAv.jpg',
        'assets/images/abdoAv.jpg',
        'assets/images/cardioAv.jpg',
        'assets/images/jambesAv.jpg',
        'assets/images/abdoAv2.jpg',
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
            'assets/images/debutant.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          for (int i = 0; i < 5; i++)
            _buildWorkout(context, '${exercises[i]}', images[index][i]),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildWorkout(BuildContext context, String name, String image) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ExerciseDetailsPage(
                name: name,
                image: image,
              )),
        );
      },
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
