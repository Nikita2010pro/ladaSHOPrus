import 'package:flutter/material.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:untitled1/colors/colors.dart';
import 'package:untitled1/product_list/card_product.dart';

List<LadaCar> Car_in_shopping_list = [];


class ShopList extends StatefulWidget {

  const ShopList({Key? key}) : super(key: key);

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(162, 190, 170, 1.0),
      appBar: AppBar(
        backgroundColor: ColorsApplication.appBarColor,
        title: const Text('Покупки'),
        centerTitle: true,),
      body: Column(
        children: <Widget> [
          Expanded(child:  ListView.builder(
            itemCount: Car_in_shopping_list .length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(padding: EdgeInsets.all(8),
                child: Stack(
                  children: [

                    ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardScreen(car: Car_in_shopping_list[index],),
                        ),
                      );
                    },

                      child: ListTile(
                        leading:  ClipRRect(borderRadius: BorderRadius.circular(12),
                          child: Image.network(Car_in_shopping_list[index].imageUrl.first.toString()),),
                        title: Text(Car_in_shopping_list[index].name),
                        subtitle: Text(Car_in_shopping_list[index].price),
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

                            Car_in_shopping_list.removeAt(index);

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

        ],
      ),

    );
  }
}
