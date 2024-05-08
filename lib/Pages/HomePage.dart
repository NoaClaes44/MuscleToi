import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'loginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Muscle Toi !"),
          elevation: 20,
          backgroundColor: Color(0xFF4B0DD8),
        ),
        body:   Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/etr.svg",
                width: 200,
              ),
              const Text("Muscle Toi ! ",
                style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'Poppins'
                ),
              ),
              const Text("Programme d'entrainement juste pour toi",
                  style: TextStyle(
                      fontSize: 24
                  ),
                  textAlign: TextAlign.center
              ),
              const Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF4B0DD8))
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>LoginPage()
                      )
                  );
                },
                child: const Text("Commencez maintenant",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}