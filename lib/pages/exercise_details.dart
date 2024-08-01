import 'package:flutter/material.dart';

class ExerciseDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int time;
  final int burn;
  final String description;

  const ExerciseDetailPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.burn,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.5, // Makes the container taller
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.timer, color: Colors.orange),
                          SizedBox(height: 8),
                          Text('$time min', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Container(height: 30, width: 1, color: Colors.grey[300]),
                      Column(
                        children: [
                          Icon(Icons.local_fire_department,
                              color: Colors.orange),
                          SizedBox(height: 8),
                          Text('$burn kcal', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily:
                          'Rufner', // Assuming custom font is configured in the pubspec.yaml
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    color: Colors.orange,
                    onPressed: () {},
                    child: Text('Let\'s Workout',
                        style: TextStyle(color: Colors.white)),
                    minWidth: double.infinity,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
