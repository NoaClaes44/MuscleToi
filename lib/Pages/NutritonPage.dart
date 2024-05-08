import 'package:flutter/material.dart';
import 'perte_de_poids_alg_page.dart';
import 'prise_de_masse_glut_page.dart';
import 'equilibre_alg_glut_page.dart';
import 'perte_de_poids_page.dart';
import 'prise_de_masse_page.dart';
import 'equilibre_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programme Nutritionniste',
      initialRoute: '/',
      routes: {
        '/': (context) => NutritionPage(),
        '/perteDePoidsALG_page': (context) => PerteDePoidsALGPage(),
        '/priseDeMasseGLUT_page': (context) => PriseDeMasseGLUTPage(),
        '/equilibreALGGLUT_page': (context) => EquilibreALGGLUTPage(),
        '/perteDePoids_page': (context) => PerteDePoidsPage(),
        '/priseDeMasse_page': (context) => PriseDeMassePage(),
        '/equilibre_page': (context) => EquilibrePage(),
      },
    );
  }
}

class NutritionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programme Nutritionniste'),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProgrammeTile(
                context,
                title: 'Programme Perte de Poids',
                allergies: ['Lactose'],
                imagePath: 'assets/images/plat_pertePoids.jpg',
                destinationPage: PerteDePoidsALGPage(),
              ),
              SizedBox(height: 20),
              _buildProgrammeTile(
                context,
                title: 'Programme Prise de Masse',
                allergies: ['Gluten'],
                imagePath: 'assets/images/plat_pdm.jpg',
                destinationPage: PriseDeMasseGLUTPage(),
              ),
              SizedBox(height: 20),
              _buildProgrammeTile(
                context,
                title: 'Programme Équilibre',
                allergies: ['Lactose', 'Gluten'],
                imagePath: 'assets/images/plat_equilibre.jpg',
                destinationPage: EquilibreALGGLUTPage(),
              ),
              SizedBox(height: 20),
              Container(
                height: 1,
                color: Colors.grey[400],
                margin: EdgeInsets.symmetric(vertical: 20),
              ),
              _buildProgrammeTile(
                context,
                title: 'Programme Perte de poids',
                allergies: [],
                imagePath: 'assets/images/plat_pertePoids2.jpg',
                destinationPage: PerteDePoidsPage(),
              ),
              SizedBox(height: 20),
              _buildProgrammeTile(
                context,
                title: 'Programme Prise de masse',
                allergies: [],
                imagePath: 'assets/images/plat_pdm2.jpg',
                destinationPage: PriseDeMassePage(),
              ),
              SizedBox(height: 20),
              _buildProgrammeTile(
                context,
                title: 'Programme Équilibre',
                allergies: [],
                imagePath: 'assets/images/plat_equilibre2.jpg',
                destinationPage: EquilibrePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgrammeTile(BuildContext context, {
    required String title,
    required List<String> allergies,
    required String imagePath,
    required Widget destinationPage,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Allergies: ${allergies.isNotEmpty ? allergies.join(', ') : 'Aucune'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Objectif: ${_getObjectifFromTitle(title)}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getObjectifFromTitle(String title) {
    if (title.toLowerCase().contains('perte de poids')) {
      return 'Perte de poids';
    } else if (title.toLowerCase().contains('prise de masse')) {
      return 'Prise de masse';
    } else {
      return 'Équilibre alimentaire';
    }
  }
}
