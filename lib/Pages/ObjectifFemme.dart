import 'package:flutter/material.dart';

// Import des pages spécifiques pour chaque objectif
import 'FemPerdrePoidsPage.dart';
import 'FemPrendreMusclePage.dart';
import 'FemResterFormePage.dart';
import 'FemSechePage.dart';

class ObjectifFemmePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Objectif',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF4B0DD8), // Couleur de l'appBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Quel est votre objectif principal ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), // Espacement vertical
              Expanded(
                child: ListView(
                  children: [
                    ObjectifItem(
                      titre: 'Perdre du poids',
                      description: 'Pour perdre du poids',
                      image: 'assets/images/FemPertedepoids.jpg',
                      couleur: Colors.blue,
                      page: FemPerdrePoidsPage(),
                    ),
                    ObjectifItem(
                      titre: 'Prendre du muscle',
                      description: 'Pour prendre du muscle',
                      image: 'assets/images/FemPdm.jpg',
                      couleur: Colors.green,
                      page: FemPrendreMusclePage(),
                    ),
                    ObjectifItem(
                      titre: 'Rester en forme',
                      description: 'Pour avoir une bonne santé et être heureux',
                      image: 'assets/images/femResterenforme.jpg',
                      couleur: Colors.orange,
                      page: FemResterFormePage(),
                    ),
                    ObjectifItem(
                      titre: 'Sèche',
                      description: 'Pour devenir BIEN sec',
                      image: 'assets/images/FemSeche.jpg',
                      couleur: Colors.red,
                      page: FemSechePage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ObjectifItem extends StatelessWidget {
  final String titre;
  final String description;
  final String image;
  final Color couleur;
  final Widget page;

  const ObjectifItem({
    Key? key,
    required this.titre,
    required this.description,
    required this.image,
    required this.couleur,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: couleur,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titre,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
