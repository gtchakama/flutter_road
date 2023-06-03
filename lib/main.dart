import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroductionScreen(),
    );
  }
}

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<IconData> iconList = [
    Icons.explore,
    Icons.people,
    Icons.favorite,
  ];

  final List<String> captionList = [
    'Discover new things',
    'Connect with friends',
    'Enjoy your life',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Bra Mozze",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: iconList.length,
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconList[index],
                        size: 100.0,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 32.0),
                      Text(
                        captionList[index],
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              iconList.length,
              (int index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10.0,
                  width: (index == _currentPage) ? 30.0 : 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: (index == _currentPage)
                        ? Colors.blue
                        : Colors.grey[400],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              textStyle: const TextStyle(fontSize: 20),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
            ),
            child: const Text('Get Started'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
