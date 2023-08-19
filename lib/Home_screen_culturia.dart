
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:anvadhi/customWidgets/promo_card.dart';


class Home_screen_culturia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
=======
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Chandra and nandha gay",
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "SEX SEX SEX",
                      style: TextStyle(color: Colors.black87, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "GAy  IS MAANNU",
                            hintStyle:
                                TextStyle(color: Colors.pink, fontSize: 20)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Bhenchod",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 13),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          children: <Widget>[
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 200,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                autoPlayInterval: Duration(seconds: 200),
                              ),
                              itemCount: 12,
                              itemBuilder: (context, index, realIndex) {
                                return Row(
                                  children: <Widget>[
                                      

                                    Expanded(
                                        child: promoCard(
                                            "lib/assets/images/image.jpg",
                                            "kalamkari",
                  
                                            0.1
                                            )),
                                    // Expanded(
                                    //     child: promoCard(
                                    //          "lib/assets/images/image.jpg"  ,
                                    //         "kalamkari",
                                    //         0.2  )),

                                    // need to work to make promocard popup
                                  ],
                                ); //need to shift children widget here
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                          child: ElevatedButton(
                            child: const Text('Elevated Button'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              onPrimary: Colors.white,
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              shadowColor: Colors.lightBlue,
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Placeholder())),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            promoCard(
                                            'lib/assets/images/image.jpg',
                                            "kalamkari",
                                            0.1),
                       promoCard(
                                            'lib/assets/images/image.jpg',
                                            "kalamkari",
                                            0.1),
                        promoCard(
                                            'lib/assets/images/image.jpg',
                                            "kalamkari",
                                            0.1),
                          promoCard(
                                            'lib/assets/images/image.jpg',
                                            "kalamkari",
                                            0.1),
                        
                          
                                            
                                            
                                    
                           
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                          child: ElevatedButton(
                            child: Text('Continue  Button'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              onPrimary: Colors.white,
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal),
                              shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              shadowColor: Colors.lightBlue,
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home_screen_culturia())),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
>>>>>>> Stashed changes
          ),
          onPressed: () {},
        ),
        //  bottom: TabBar(
        //  tabs: <Widget>[
        //    Tab(
        //       icon: const Icon(Icons.cloud_outlined),
        //       text: "Buddy cloud",
        //     ),

        //  ]),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.help,
              ),
              onPressed: () {}),
          TextButton(onPressed: () {}, child: const Text("hehehe")),
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Chandra and nandha gay",
                  style: TextStyle(color: Colors.black87, fontSize: 25),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "SEX SEX SEX",
                  style: TextStyle(color: Colors.black87, fontSize: 40),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black87,
                        ),
                        hintText: "search here",
                        hintStyle: TextStyle(color: Colors.pink, fontSize: 20)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Bhenchod",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      children: <Widget>[
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 200,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: Duration(seconds: 200),
                          ),
                          itemCount: 12,
                          itemBuilder: (context, index, realIndex) {
                            return Row(
                              children: <Widget>[
                                Expanded(
                                    child: promoCard('assets/images/image.jpg',
                                        "Meri bandi", 0.3)),

                                // need to work to make promocard popup
                              ],
                            ); //need to shift children widget here
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        child: const Text('Elevated Button'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontStyle: FontStyle.normal),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          shadowColor: Colors.lightBlue,
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Home_screen_culturia())),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        promoCard('assets/images/image.jpg', "Mannu ki bandi",0.0000001),
                        promoCard(
                          'assets/images/image.jpg',
                          "Chandra ki bandi ",0.1
                        ),
                        promoCard(
                            'assets/images/image.jpg', "Karthikey ki bandi",0.1),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        child: Text('Continue  Button'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontStyle: FontStyle.normal),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          shadowColor: Colors.lightBlue,
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Home_screen_culturia())),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
