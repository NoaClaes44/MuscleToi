import 'package:flutter/material.dart';
import 'AccueilPage.dart'; // Importer la page d'accueil pour la navigation
import 'DecouvrirPage.dart'; // Importer la page de découverte
import 'TousJours.dart'; // Importer la page de tous les jours
import 'MoiPage.dart'; // Importer la page "Moi"

class PersonnelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personnel'),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: ProgramBuilder(),
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
}

class ProgramBuilder extends StatefulWidget {
  @override
  _ProgramBuilderState createState() => _ProgramBuilderState();
}

class _ProgramBuilderState extends State<ProgramBuilder> {
  List<TrainingSession> trainingSessions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Créez vos propres entraînements',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B0DD8),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: trainingSessions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(trainingSessions[index].name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Exercices:'),
                    ...trainingSessions[index].exercises.map((exercise) => Text(exercise)),
                  ],
                ),
                onTap: () {
                  // Ajouter des exercices à la séance
                  _addExercises(trainingSessions[index]);
                },
              );
            },
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _addNewSessionWithExercises,
          child: Text('Nouvelle séance avec exercices'),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF4B0DD8),
            onPrimary: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _resetSessions,
          child: Text('Réinitialiser'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
          ),
        ),
      ],
    );
  }

  void _addNewSessionWithExercises() {
    String sessionName = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nouvelle séance avec exercices'),
          content: TextField(
            onChanged: (value) {
              sessionName = value;
            },
            decoration: InputDecoration(hintText: 'Nom de la séance'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (sessionName.isNotEmpty) {
                  setState(() {
                    trainingSessions.add(TrainingSession(sessionName, []));
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Ajouter'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  void _addExercises(TrainingSession session) {
    String newExercise = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter des exercices'),
          content: TextField(
            onChanged: (value) {
              newExercise = value;
            },
            decoration: InputDecoration(hintText: 'Nom de l\'exercice'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newExercise.isNotEmpty) {
                  setState(() {
                    session.exercises.add(newExercise);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Ajouter'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  void _resetSessions() {
    setState(() {
      trainingSessions.clear();
    });
  }
}

class TrainingSession {
  String name;
  List<String> exercises;

  TrainingSession(this.name, this.exercises);
}
