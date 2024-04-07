

import 'package:flutter/material.dart';
import 'package:untitled1/secondary screens/basket.dart';

import 'package:untitled1/product_list/car_info/lada_car_info.dart';

import 'package:untitled1/product_list/card_product.dart';
import 'package:untitled1/colors/colors.dart';

List<LadaCar>Car_favorite = [];

class Favorite extends StatefulWidget {

  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(162, 190, 170, 1.0),
      appBar: AppBar(
        backgroundColor: ColorsApplication.appBarColor,
        title: const Text('Избранное'),
        centerTitle: true,),
      body: Column(
        children: <Widget> [
          Expanded(child:  ListView.builder(

            itemCount: Car_favorite.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(padding: const EdgeInsets.all(9),
                child: Stack(
                  children: [

                    ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardScreen(car: Car_in_basket[index],),
                        ),
                      );
                    },

                      child: ListTile(
                        leading:  ClipRRect(borderRadius: BorderRadius.circular(10),
                          child: Image.network(Car_in_basket[index].imageUrl.first.toString()),),
                        title: Text(Car_in_basket[index].name),
                        subtitle: Text(Car_in_basket[index].price),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),),


                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {

                            Car_favorite.removeAt(index);

                          });
                        },

                      ),
                    )
                  ],
                ),

              );


            },


          ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(padding: const EdgeInsets.all(50),
              child: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Basket(),
                  ),
                );
              },
                child: const Text('перейти к корзине',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF354411)),),
              ),
            ),

          )
        ],
      ),

    );
  }
}