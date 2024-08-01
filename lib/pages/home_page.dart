import 'package:fit_fusion/pages/exercise_details.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(viewportFraction: 0.8);

  final List<CardData> _cardDataList = [
    CardData(
      title: 'Squats\n with\n Weight',
      description: 'Feel the intensity with weight-based squats.',
      imageUrl: 'assets/images/squat_bg.png',
      kcal: 250,
      time: 20,
      burn: 95,
    ),
    CardData(
      title: 'Squats with No Weight',
      description: 'Feel the intensity with weight-based squats.',
      imageUrl: 'https://via.placeholder.com/300.png?text=Squats+with+Weight',
      kcal: 250,
      time: 20,
      burn: 95,
    ),
    // Add more cards as needed with similar structure
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: Text(
              ">>> SELECT YOUR TRAINING <<<",
              style: TextStyle(
                fontFamily: "Rufner",
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _cardDataList.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = (1 -
                              ((_pageController.page ??
                                              _pageController.initialPage
                                                  .toDouble()) -
                                          index)
                                      .abs() *
                                  0.3)
                          .clamp(0.0, 1.0);
                    }
                    return Center(
                      child: SizedBox(
                        height:
                            Curves.easeOut.transform(value) * 500, // Max height
                        width:
                            Curves.easeOut.transform(value) * 300, // Max width
                        child: child,
                      ),
                    );
                  },
                  child: CardWidget(
                    data: _cardDataList[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: GNav(
          gap: 8.0,
          backgroundColor: Colors.transparent,
          color: Colors.grey,
          activeColor: Color(0xFFF8C06D),
          tabBackgroundColor: Colors.grey.shade800,
          padding: const EdgeInsets.all(18.0),
          tabs: [
            GButton(icon: Icons.home, text: "Home"),
            GButton(icon: Icons.sports_gymnastics, text: "AI"),
            GButton(icon: Icons.scuba_diving_rounded, text: "Routine"),
            GButton(icon: Icons.shopping_basket, text: "Equipment"),
          ],
        ),
      ),
    );
  }
}

class CardData {
  final String title;
  final String description;
  final String imageUrl;
  final int kcal;
  final int time; // Duration of the exercise in minutes
  final int burn;

  CardData({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.kcal,
    required this.burn,
    required this.time,
  });
}

class CardWidget extends StatelessWidget {
  final CardData data;

  CardWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseDetailPage(
              title: data.title,
              imageUrl: data.imageUrl,
              time: data.time,
              burn: data.burn,
              description: data.description,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(data.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Information overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 60,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rufner',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          color: Colors.orange,
                        ),
                        Text(
                          '${data.kcal} kcal',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    /*Text(
                      data.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),*/
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
