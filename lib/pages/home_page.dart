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
      title: 'Card 1',
      description: 'This is the description for card 1.',
      imageUrl: 'https://via.placeholder.com/300.png?text=Card+1',
    ),
    CardData(
      title: 'Card 2',
      description: 'This is the description for card 2.',
      imageUrl: 'https://via.placeholder.com/300.png?text=Card+2',
    ),
    CardData(
      title: 'Card 3',
      description: 'This is the description for card 3.',
      imageUrl: 'https://via.placeholder.com/300.png?text=Card+3',
    ),
    CardData(
      title: 'Card 4',
      description: 'This is the description for card 4.',
      imageUrl: 'https://via.placeholder.com/300.png?text=Card+4',
    ),
    CardData(
      title: 'Card 5',
      description: 'This is the description for card 5.',
      imageUrl: 'https://via.placeholder.com/300.png?text=Card+5',
    ),
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
                      double page = _pageController.page ??
                          _pageController.initialPage.toDouble();
                      value =
                          (1 - ((page - index).abs() * 0.3)).clamp(0.0, 1.0);
                    }
                    /*print('Rendering card at index $index with value $value');*/
                    return Center(
                      child: SizedBox(
                        height:
                            Curves.easeOut.transform(value) * 400, // Max height
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

  CardData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class CardWidget extends StatelessWidget {
  final CardData data;

  CardWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                image: NetworkImage(data.imageUrl),
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
            padding: EdgeInsets.all(16),
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    data.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
}
