import 'package:flutter/material.dart';

  

  import 'login.dart';

  class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

    @override
    _IntroPageState createState() => _IntroPageState();
  }

  class _IntroPageState extends State<IntroPage> {
    final PageController _pageController = PageController(initialPage: 0);
    int _currentPage = 0;

    final List<Map<String, dynamic>> _cards = [
      {
        'image': 'assets/image1.jpg',
        'text': 'Card 1',
      },
      {
        'image': 'assets/image2.jpg',
        'text': 'Card 2',
      },
      {
        'image': 'assets/image3.jpg',
        'text': 'Card 3',
      },
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _cards.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return CardWidget(
                    image: _cards[index]['image'],
                    text: _cards[index]['text'],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_currentPage < _cards.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    }

    List<Widget> _buildPageIndicator() {
      List<Widget> indicators = [];
      for (int i = 0; i < _cards.length; i++) {
        indicators.add(
          i == _currentPage
              ? _buildIndicator(true)
              : _buildIndicator(false),
        );
      }
      return indicators;
    }

    Widget _buildIndicator(bool isActive) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: isActive ? 24 : 8,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      );
    }
  }
  


class CardWidget extends StatelessWidget {
  final String image;
  final String text;

  const CardWidget({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}