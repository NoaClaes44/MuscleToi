import 'package:flutter/material.dart';

import 'MorphoPage.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Image en arrière-plan
            Image.asset(
              'assets/images/fond_intro.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Dégradé entre l'image de fond et le fond blanc
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.9), // Opacité élevée pour le blanc
                    ],
                  ),
                ),
              ),
            ),
            // Fond blanc en bas de la page
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bonjour ! Je peux vous aider, je suis votre coach personnel. Je vais vous poser quelques questions pour créer votre programme personnalisé.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MorphoPage()),
                        );
                      },
                      child: Text('Continuer'), // Texte du bouton
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
