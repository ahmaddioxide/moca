import 'package:flutter/material.dart';
import 'package:moca/views/home_screen.dart';


import 'onboard_content.dart';
const List<Map<String, String>> onboardData = [
  {
    'text': "Welcome to CineMate! We're excited to help you plan the perfect movie night for you and your friends.",
    'image': 'assets/illustrations/Signup.png',
    'heading':'Introduction'
  },
  {
    'text': "Can't remember the name of that movie you loved? Or maybe you're looking for something new to watch that fits your mood. With Movie Night Planner, you can easily search for movies by keywords",
    'image': 'assets/illustrations/Signup.png',
    'heading':'Search Movies'
  },
  {
    'text': "Can't decide what to watch? Let Movie Night Planner help you discover the best movies of the moment. Whether you're looking for the latest blockbusters, the most critically acclaimed indie films, or the hottest streaming trends, we've got you covered.",
    'image': 'assets/illustrations/Signup.png',
    'heading':'Explore'
  },
];

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: onboardData.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: onboardData[index]['image'],
                  text: onboardData[index]['text'],
                  heading: onboardData[index]['heading'],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                if (_currentPage == onboardData.length - 1) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                } else {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 40 : 15,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.deepPurple : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
