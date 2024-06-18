import 'package:flutter/material.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Main Text will go on here"),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Get Started",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
          )
        ],
      )
    );
  }
}
