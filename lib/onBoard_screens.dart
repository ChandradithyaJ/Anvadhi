import 'package:anvadhi/BoardingPage1.dart';
import 'package:anvadhi/BoardingPage2.dart';
import 'package:anvadhi/Home_screen_culturia.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:anvadhi/BoardingPage3.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  PageController controller = PageController();

  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                this.index = index;
              });
            },
            children: [
              // mannu replace containers to pages via routes
              Container(
                color: Colors.orangeAccent,
                child: BoardingPage1(),
              ),
              Container(
                color: Colors.orange,
                child: BoardingPage2(),
              ),
              Container(
                child: BoardingPage3(),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.jumpToPage(2);
                        },
                        child: Center(child: Text("Skip")),
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.orange,
                          dotColor: Colors.grey,
                          dotHeight: 4,
                          dotWidth: 6,
                          spacing: 5,
                        ),
                      ),
                      index != 2
                          ? GestureDetector(
                              onTap: () {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeInOut);
                              },
                              child: Center(child: Text("Next",style: TextStyle( fontSize: 10),) ,),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeInOut);
                              },
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Home_screen_culturia()));
                                    

                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple[100]
                                ),
                                
                                child: Text("Get Started")),
                                
                            )
                    ],
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
