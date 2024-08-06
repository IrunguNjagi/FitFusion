import 'package:fit_fusion/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  void _saveDetails() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setInt('age', int.tryParse(_ageController.text) ?? 0);
    prefs.setDouble('weight', double.tryParse(_weightController.text) ?? 0.0);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/db_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 80,
            left: 70,
            child: Text(
              "FIT FUSION",
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: "Rufner",
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 280.0,
                left: 43,
                right: 43,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      labelStyle: const TextStyle(
                        fontFamily: 'Rufner',
                        color: Color(0xFF1D6B68),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your age',
                      labelStyle: const TextStyle(
                        fontFamily: 'Rufner',
                        color: Color(0xFF1D6B68),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your weight(lbs)',
                      labelStyle: const TextStyle(
                        fontFamily: 'Rufner',
                        color: Color(0xFF1D6B68),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 120),
                  GestureDetector(
                    onTap: () {
                      _saveDetails();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 292,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(57.0),
                        color: const Color(0xFFF8C06D),
                      ),
                      child: const Text(
                        "COMPLETE",
                        style: TextStyle(
                          fontFamily: 'Rufner',
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
