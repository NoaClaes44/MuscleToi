import 'package:flutter/material.dart';
import 'AccueilPage.dart'; // Importer la page d'accueil pour la navigation
import 'DecouvrirPage.dart'; // Importer la page de découverte
import 'PersonnelPage.dart'; // Importer la page du personnel
import 'TousJours.dart'; // Importer la page de tous les jours

class MoiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moi'),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Photo de profil avec le texte "Bienvenue, Cher ami !"
            Container(
              color: Colors.grey.shade200,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_image.jpg'), // Ajouter votre chemin d'image ici
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Bienvenue, Cher ami !',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Catégorie "Mon profil"
            _buildCategoryCard(
              title: 'Mon profil',
              content: [
                _buildProfileItem('Nom', 'Noa Claes'),
                _buildProfileItem('Âge', '/'),
                _buildProfileItem('Sexe', 'Masculin'),
                _buildProfileItem('Taille', '177 cm'),
                _buildProfileItem('Poids', '77 kg'),
              ],
            ),
            SizedBox(height: 20),
            // Catégorie "Réglages des exo"
            _buildCategoryCard(
              title: 'Réglages des exo',
              content: [
                _buildSettingItem('Vidéo', Icons.video_library),
                _buildSettingItem('Musique', Icons.music_note),
                _buildSettingItem('Guide vocal', Icons.record_voice_over),
                _buildSettingItem('Effet sonore', Icons.volume_up),
              ],
            ),
            SizedBox(height: 20),
            // Catégorie "Réglages"
            _buildCategoryCard(
              title: 'Réglages',
              content: [
                _buildSettingItem('Rappel', Icons.notifications),
                _buildSettingItem('Unité de mesure', Icons.settings),
                _buildSettingItem('Option de langue', Icons.language),
              ],
            ),
            SizedBox(height: 20),
            // Catégorie "Connecté à Apple Santé"
            _buildCategoryCard(
              title: 'Connecté à Apple Santé',
              content: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/apple_health_logo.png'), // Ajouter votre chemin de logo ici
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
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

  Widget _buildCategoryCard({required String title, required List<Widget> content}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: content,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Ajouter ici la logique pour gérer les réglages
      },
    );
  }
}
