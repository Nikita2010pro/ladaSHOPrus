import 'package:flutter/material.dart';

import '../colors/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(162, 190, 170, 1.0),
      appBar: AppBar(
        backgroundColor: ColorsApplication.appBarColor,
        title: const Text('Ваш профиль'),
        centerTitle: true,),
      body:

      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage('https://hombex.com/assets/img/icon_profile.png'),
                  ),),


                Expanded(
                    flex: 1,
                    child: SizedBox()),

                Expanded(
                  flex: 5,
                  child:  Column(
                      children: [
                        Text('Никнейм', style: TextStyle(fontSize: 24),),
                        Text('nonime@nn.com', style: TextStyle(fontSize: 20),)
                      ]


                  ),
                ),
              ],

            ),
          ),

          Padding(padding: EdgeInsets.all(50),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(onPressed: () {Navigator.pushNamed(context, "/to_shoplist");}, child: Text('покупки',
                      style:  TextStyle(fontSize: 20, color: Color.fromRGBO(41, 61, 21, 1.0)))),
                ],
              ),
            ),


        ],
      ),




      
    );




  }
}
