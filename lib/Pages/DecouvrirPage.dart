import 'package:flutter/material.dart';
import 'AccueilPage.dart'; // Importer la page d'accueil pour la navigation
import 'PersonnelPage.dart'; // Importer la page du personnel
import 'TousJours.dart'; // Importer la page de tous les jours
import 'MoiPage.dart'; // Importer la page "Moi"

class DecouvrirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenir la date actuelle et la formater
    DateTime now = DateTime.now();
    String formattedDate = '${now.day} ${_getMonthName(now.month)} ${now.year}';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Découvrir'),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Recherche',
                hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF4B0DD8), width: 2),
                ),
              ),
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Contenu de la page de découverte'),
            ),
          ),
        ],
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
          // Naviguer vers la page correspondante en fonction de l'index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccueilPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DecouvrirPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonnelPage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TousJoursPage()),
              );
              break;
            case 4:
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
