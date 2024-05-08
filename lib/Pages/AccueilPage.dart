import 'package:flutter/material.dart';
import 'ObjectifHomme.dart'; // Importer la page pour les objectifs des hommes
import 'ObjectifFemme.dart'; // Importer la page pour les objectifs des femmes
import 'NutritonPage.dart'; // Importer la page de nutrition
import 'DecouvrirPage.dart'; // Importer la page de découverte
import 'PersonnelPage.dart'; // Importer la page du personnel
import 'TousJours.dart'; // Importer la page de tous les jours
import 'MoiPage.dart'; // Importer la page "Moi"

class AccueilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day} ${_getMonthName(now.month)} ${now.year}';

    // Variables pour les données factices
    int joursConsecutifs = 30;
    int recordPersonnel = 40;
    int exosRealises = 24; // Correction de la variable
    int exosSemaine = 4; // Nombre d'exercices réalisés sur la semaine (factice)

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Home'),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Utiliser toute la hauteur disponible
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildStatCard('Jours consécutifs', '$joursConsecutifs jours', Icons.whatshot, 'Record personnel : $recordPersonnel'),
                  SizedBox(width: 55), // Espacement entre les widgets
                  _buildExerciseStats(exosSemaine, exosRealises),
                ],
              ),
              SizedBox(height: 8), // Espacement entre les widgets
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ObjectifPage()), // Naviguer vers la page des objectifs pour les hommes
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildObjectiveCard(
                          'Objectifs pour Hommes',
                          'assets/images/objectifHommeCover.jpg',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ObjectifFemmePage()), // Naviguer vers la page des objectifs pour les femmes
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildObjectiveCard(
                          'Objectifs pour Femmes',
                          'assets/images/objectifFemmeCover.jpg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8), // Espacement entre les widgets
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NutritionPage()), // Naviguer vers la page de nutrition
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildNutritionCard(
                      'Nutrition',
                      'assets/images/Nutrition_cover.jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF4B0DD8)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: Color(0xFF4B0DD8)),
            label: 'Découvrir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF4B0DD8)),
            label: 'Personnel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Color(0xFF4B0DD8)),
            label: 'Tous les jours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Color(0xFF4B0DD8)),
            label: 'Moi',
          ),
        ],
        selectedItemColor: Color(0xFF4B0DD8),
        unselectedItemColor: Color(0xFF4B0DD8),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {
          switch (index) {
            case 0:
            // Naviguer vers la page d'accueil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccueilPage()),
              );
              break;
            case 1:
            // Naviguer vers la page de découverte
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DecouvrirPage()),
              );
              break;
            case 2:
            // Naviguer vers la page du personnel
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonnelPage()),
              );
              break;
            case 3:
            // Naviguer vers la page de tous les jours
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TousJoursPage()),
              );
              break;
            case 4:
            // Naviguer vers la page "Moi"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoiPage()),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, String subValue) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.orange, size: 28),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subValue,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildObjectiveCard(String title, String imagePath) {
    return Container(
      width: 300, // Largeur fixe pour la boîte des objectifs
      height: 250, // Hauteur fixe pour la boîte des objectifs
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseStats(int exosSemaine, int exosRealises) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      width: 150, // Largeur fixe pour la case des exercices
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.fitness_center, color: Colors.blue, size: 28),
              Text(
                '$exosSemaine/5', // Nombre d'exercices réalisés sur la semaine
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Exercices réalisés',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Total : $exosRealises', // Nombre total d'exercices réalisés
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionCard(String title, String imagePath) {
    return Container(
      width: 300, // Largeur fixe pour la boîte de la nutrition
      height: 250, // Hauteur fixe pour la boîte de la nutrition
      margin: EdgeInsets.all(8), // Espacement autour du widget
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrer verticalement
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Janvier';
      case 2:
        return 'Février';
      case 3:
        return 'Mars';
      case 4:
        return 'Avril';
      case 5:
        return 'Mai';
      case 6:
        return 'Juin';
      case 7:
        return 'Juillet';
      case 8:
        return 'Août';
      case 9:
        return 'Septembre';
      case 10:
        return 'Octobre';
      case 11:
        return 'Novembre';
      case 12:
        return 'Décembre';
      default:
        return '';
    }
  }
}
