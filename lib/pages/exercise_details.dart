import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  icon:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.57, // Makes the container taller
              decoration: const BoxDecoration(
                color: Color(0xFFFEF9F1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.timer, color: Colors.orange),
                          const SizedBox(height: 8),
                          Text(
                            '$time min',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Rufner',
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: 30, width: 4, color: const Color(0xFFDADADA)),
                      Column(
                        children: [
                          const Icon(Icons.local_fire_department,
                              color: Colors.orange),
                          const SizedBox(height: 8),
                          Text(
                            '$burn kcal',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Rufner',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Rufner',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'SQUATS WITH WEIGHT REALLY TARGET THE INNER QUAD\N'
                    'THUS MAXIMIZING GAINS WITHIN A SHORT PERIOD OF TIME, SQUEEZE AT THE TOP \n',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Rufner',
                        color: Color(0xFF939291)),
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    color: const Color(0xFFF8C06D),
                    onPressed: () {},
                    minWidth: double.infinity,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      'Let\'s Workout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        wordSpacing: 1.5,
                        fontFamily: 'Candice',
                      ),
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
