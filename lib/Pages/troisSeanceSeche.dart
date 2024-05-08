import 'package:flutter/material.dart';

class CinqSeance extends StatefulWidget {
  const CinqSeance({super.key});

  @override
  State<CinqSeance> createState() => _CinqSeanceState();
}

class _CinqSeanceState extends State<CinqSeance> {
  final events = [
    {
      "speaker" : "Séance 1",
      "date" : "Lundi",
      "subject" : "Full body poids du corps",
      "avatar" : "full_1"
    },
    {
      "speaker" : "Séance 2",
      "date" : "Mardi",
      "subject" : "Cardio",
      "avatar" : "pec"
    },
    {
      "speaker" : "Séance 3",
      "date" : "Jeudi",
      "subject" : "Jambes",
      "avatar" : "jambes"
    },
    {
      "speaker" : "Séance 4",
      "date" : "Vendredi",
      "subject" : "Full body",
      "avatar" : "jambes"
    },
    {
      "speaker" : "Séance 5",
      "date" : "Samedi",
      "subject" : "Repo et étirment",
      "avatar" : "jambes"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tes 5 Séances"),
        backgroundColor: Color(0xFF4B0DD8),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            final avatar = event['avatar'];
            final speaker = event['speaker'];
            final date = event['date'];
            final subject = event['subject'];

            return Card(
              child: ListTile(
                leading: Image.asset("assets/images/$avatar.jpg"),
                title: Text('$speaker ($date)'),
                subtitle: Text('$subject'),
                trailing: Icon(Icons.more_vert),
              ),
            );
          },
        ),
      ),
    );
  }
}



