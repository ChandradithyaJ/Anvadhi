import './customWidgets/BoardingPage1.dart';
import './customWidgets/BoardingPage2.dart';
import './customWidgets/BoardingPage3.dart';
import 'package:anvadhi/Hidden_draw.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  Map<String, dynamic> selectedArtForm;
  List<Map<String, dynamic>> ArtForms;

  OnBoardingScreen({required this.ArtForms, required this.selectedArtForm})
      : super();

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
              Container(
                color: Colors.orangeAccent,
                child: BoardingPage1(),
              ),
              Container(
                color: Colors.orange,
                child: BoardingPage2(),
              ),
              BoardingPage3(
                  ArtForms: widget.ArtForms,
                  selectedArtForm: widget.selectedArtForm),
            ],
          ),
          Padding(
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
                      child: const Center(
                          child: Text("Skip",
                              style: TextStyle(
                                  fontSize: 20,
                                  ))),
                    ),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color.fromARGB(255, 88, 54, 3),
                        dotColor: Color.fromARGB(255, 208, 69, 69),
                        dotHeight: 4,
                        dotWidth: 6,
                        spacing: 5,
                      ),
                    ),
                    index != 2
                        ? GestureDetector(
                            onTap: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut);
                            },
                            child: const Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 20,
                                    ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut);
                            },
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Hidden_draww(
                                          ArtForms: widget.ArtForms,
                                          selectedArtForm:
                                              widget.selectedArtForm,
                                        ),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple[700],
                                    minimumSize: const Size(70.0, 40.0),
                                    maximumSize: const Size(70.0, 40.0)),
                                child: const Text("Start!")),
                          )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
