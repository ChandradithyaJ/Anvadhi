import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  
  PageController controller = PageController();

  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Stack(

        children:[ PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() {
              this.index = index;
            });
          },
          children: [

            // mannu replace containers to pages via routes 
            Container(
              color: Colors.red,
              child: Text("OnBoardingScreen"),
            ),
             Container(
              color: Colors.orange,
              child: Text("OnBoardingScreen2"),
            ),
              Container(
                color: Colors.orangeAccent,
                child: Text("OnBoardingScree3"),
              ),
          ],
        ),

        Container(
          alignment: Alignment.bottomLeft,

         

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ 

              GestureDetector(
                onTap: (){
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
                  ),),

            index != 2 ?
              GestureDetector(
                onTap: (){
                  controller.nextPage( duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
                },
               
               
                  child: Center(child: Text("Next")),
              )
                
                : GestureDetector(
                onTap: (){
                  controller.nextPage(duration: Duration(milliseconds:600 ), curve: Curves.easeInOut);

                }, 

                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.blue,
                  child: Center(child: Text("Get Started")),
                ),
                ),
              
            ],
          ),
        ),
      
        ],
        ),
    );
     

    
  }
}