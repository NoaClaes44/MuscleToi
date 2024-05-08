import 'package:flutter/material.dart';

class TroisSeance extends StatefulWidget {
  const TroisSeance({super.key});

  @override
  State<TroisSeance> createState() => _TroisSeanceState();
}

class _TroisSeanceState extends State<TroisSeance> {
  final events = [
    {
      "speaker" : "Séance 1",
      "date" : "Lundi",
      "subject" : "Dos, Biceps",
      "avatar" : "double-biceps-dos"
    },
    {
      "speaker" : "Séance 2",
      "date" : "Mardi",
      "subject" : "Pec, triceps, épaule",
      "avatar" : "pec"
    },
    {
      "speaker" : "Séance 3",
      "date" : "Jeudi",
      "subject" : "Jambes",
      "avatar" : "jambes"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tes 3 Séances"),
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

