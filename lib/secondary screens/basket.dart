import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/product_list/card_product.dart';
import 'package:untitled1/colors/colors.dart';

List<LadaCar>Car_in_basket = [];

class Basket extends StatefulWidget {



  const Basket({Key? key}) : super(key: key);

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {




  void increment (LadaCar car){
    setState(() {
      car.countInBasket++;
    });
  }
  void decrement (LadaCar car){
    setState(() {
      if( car.countInBasket > 0){
        car.countInBasket--;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(162, 190, 170, 1.0),
      appBar: AppBar(
        backgroundColor: ColorsApplication.appBarColor,
        title: const Text('Корзина'),
        centerTitle: true,),
      body: Column(
        children: <Widget> [
          Expanded(child:  ListView.builder(
            itemCount: Car_in_basket.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(padding: EdgeInsets.all(8),
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
                        leading:  ClipRRect(borderRadius: BorderRadius.circular(12),
                          child: Image.network(Car_in_basket[index].imageUrl.first.toString()),),
                        title: Text(Car_in_basket[index].name),
                        subtitle: Text(Car_in_basket[index].price),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),),


                    ),
                    Positioned(
                      top: 10,
                      right: 5,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {

                            Car_in_basket.removeAt(index);

                          });
                        },

                      ),
                    ),

                    Positioned(
                        top: 10,
                        right: 50,
                        child: Row(
                          children: [
                            IconButton(onPressed: () {
                              decrement(Car_in_basket[index]);
                            }, icon: Icon(Icons.remove),),

                            Text("${Car_in_basket[index].countInBasket}"),

                            IconButton(onPressed: () {increment(Car_in_basket[index]);}, icon: Icon(Icons.add),),
                          ],
                        )
                    )
                  ],
                ),



              );

            },


          ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(padding: EdgeInsets.all(50),
              child: ElevatedButton(onPressed: () {},
                child: Text('заказать',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
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