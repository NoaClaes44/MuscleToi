import 'package:flutter/material.dart';
import 'AccueilPage.dart'; // Importer la page d'accueil pour la navigation
import 'DecouvrirPage.dart'; // Importer la page de découverte
import 'PersonnelPage.dart'; // Importer la page du personnel
import 'MoiPage.dart'; // Importer la page "Moi"

class TousJoursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tous les jours'),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('Calories dépensées', '500', Icons.local_fire_department),
                  SizedBox(width: 16), // Ajout d'un espace entre les boîtes
                  _buildStatCard('Poids (kg)', '75', Icons.fitness_center),
                ],
              ),
              SizedBox(height: 20),
              _buildHabitContainer(5, 3),
              SizedBox(height: 20),
              Text(
                'Tentez d\'augmenter votre santé, à force de développer ces bonnes habitudes',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildTrackerCard('Nombre de pas', Icons.directions_walk, 8500),
              SizedBox(height: 10),
              _buildTrackerCard('Consommation d\'eau', Icons.local_drink, 5),
              SizedBox(height: 20),
              Text(
                'Suivi quotidien',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildDailyStats(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Découvrir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personnel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Tous les jours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
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

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
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
            Icon(icon, color: Colors.blue, size: 28),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHabitContainer(int totalDays, int connectedDays) {
    List<Widget> habits = [];
    for (int i = 0; i < totalDays; i++) {
      if (i < connectedDays) {
        habits.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.green,
            ),
          ),
        );
      } else {
        habits.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
            ),
          ),
        );
      }
    }
    return Container(
      padding: EdgeInsets.all(16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: habits,
      ),
    );
  }

  Widget _buildTrackerCard(String title, IconData icon, int progress) {
    return Container(
      padding: EdgeInsets.all(16),
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
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Progression: $progress',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              value: progress / 10, // Assuming max progress is 10
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyStats() {
    return Container(
      padding: EdgeInsets.all(16),
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
        children: [
          Text(
            'Graphique bâtonnet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // Add your bar chart widget here
          // This is just a placeholder text
          Text('En recherche'),
        ],
      ),
    );
  }
}
