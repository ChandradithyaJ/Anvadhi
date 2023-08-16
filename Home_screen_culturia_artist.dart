import 'package:flutter/material.dart';
import 'package:trying/Custom_widget/promo_card.dart';

class  Home_screen_culturia_artist extends StatelessWidget{
  @override 
  Widget build(BuildContext context){

    return Scaffold(
     backgroundColor: Colors.grey,
     appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon:const Icon(Icons.menu,color: Colors.black,),
            onPressed: () {},
           ) ,
           actions:<Widget>[
            IconButton(
            icon: const Icon(Icons.help,),
            onPressed: () {}),
            TextButton(onPressed: (){},
             child: const Text("hehehe")),
            ],
          ),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,

            
            

            children: <Widget>[

               const SizedBox(
                height: 20,
              ),
              Expanded(child :
               Container(
                height: 200,
                child:Column(
                children:<Widget>
                [
                   promoCard('assets/images/image.jpg', "Mannu ki bandi" ) ,],
                ),
              ),
              ),
               const SizedBox(
                height: 10,
              ),
                Row(
                  children: [
                    Container(
                    child:Icon(Icons.media_bluetooth_off),),
                    SizedBox( width: 20,),
                     Text("ART...TITS", style: TextStyle(color: Colors.black87 , fontSize:40 ),),
                  ],
                ),

                Text("details ............................................................................................", style: TextStyle(color: Colors.black87 , fontSize:10 ),),

                  const SizedBox(
                height: 200,
              ),  

              Container(
                      child: Center(
        child: ElevatedButton(
          child: const Text('Elevated2 Button'),
          style: ElevatedButton.styleFrom(
             primary: Colors.grey,
             onPrimary : Colors.white,
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
            shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(5))),
                shadowColor: Colors.lightBlue,
          ),
          onPressed: () => Navigator.pop(context)
            // Navigator.of(context)
              // .push(MaterialPageRoute(builder: (context) => Home_screen_culturia_artist())),
        ),
      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
            ],
          ),
 
        )
        );
  }
   
}

























