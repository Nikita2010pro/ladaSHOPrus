import 'package:flutter/material.dart';
import 'package:untitled1/colors/colors.dart';
import 'package:untitled1/product_list/card_product.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:untitled1/secondary screens/basket.dart';
import 'package:untitled1/secondary screens/favorite.dart';
import 'package:untitled1/secondary%20screens/shopping%20list.dart';


class LadaCarsGrid extends StatefulWidget {
  const LadaCarsGrid({super.key});

  @override
  State<LadaCarsGrid> createState() => _LadaCarsGridState();
}

Widget buildCarCount(List<LadaCar> carss) {
  if (carss.length != 0) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          carss.length.toString(), // количество элементов в корзине
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  } else {
    return SizedBox(); // Возвращаем пустой виджет, если Car_favorite пуст
  }
}


class _LadaCarsGridState extends State<LadaCarsGrid> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(162, 190, 170, 1.0),
      extendBody:
      true, // Расширяем область body за пределы аппбара и bottomNavigationBar

      body:

      Padding(

        padding: const EdgeInsets.only(top: 10, bottom:20, left:10, right:10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 7.0,

          ),
          itemCount: ladaCars.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardScreen(car: ladaCars[index]),
                  ),
                );
              },
              child: Container(

                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF11623A), width: 2.0),
                    borderRadius: BorderRadius.circular(13),
                    color: ColorsApplication.container),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                        child: Image.network(
                          ladaCars[index].imageUrl.isNotEmpty
                              ? ladaCars[index].imageUrl[0]
                              : '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    ),

                    Text(ladaCars[index].name, style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold, backgroundColor: Color.fromRGBO(
                        169, 187, 165, 1.0)),),

                    Text(
                      ladaCars[index].description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 19, color: Colors.black), textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(
                              0xFF354213))
                      ),
                      child: Text(
                        'Цена: ${ladaCars[index].price}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 19, color: Colors.black, backgroundColor: Color.fromRGBO(
                            232, 2, 2, 0.403921568627451)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [








                             Padding(padding: EdgeInsets.only(left: 2, right: 2),
                              child:
                              ElevatedButton(onPressed: () {
                                setState(() {
                                  ladaCars[index].inBasket = !ladaCars[index].inBasket;

                                  Car_in_basket.add(ladaCars[index]);


                                });
                              },
                                  child: Icon(
                                    ladaCars[index].inBasket ? Icons.shopping_basket : Icons.shopping_basket_outlined,
                                    color: ladaCars[index].inBasket ? Color(
                                        0xFF354213) : Color(0xFF466442),
                                  )),),






                            Padding(padding: EdgeInsets.only(left: 2, right: 2),
                              child:

                              ElevatedButton(onPressed: () {
                                setState(() {
                                  ladaCars[index].isLiked = !ladaCars[index].isLiked;

                                  Car_favorite.add(ladaCars[index]);


                                });
                              }, child: Icon(
                                ladaCars[index].isLiked ? Icons.favorite : Icons.favorite_border,
                                color: ladaCars[index].isLiked ? Colors.red : Colors.grey,
                              ),



                              ),),

                          ],
                        )

                    ),






                  ],
                ),
              ),

            );
          },
        ),
      ),
    bottomNavigationBar: Container(
        height: 70,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF11623A), width: 2.0),
    ),

    child: ClipRRect(
      child: BottomAppBar(
          color: Color(0xFF7A8D77), // Цвет фона серый
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              IconButton(
              icon: const Icon(Icons.person),
              color: Color(0xFF22331F),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/to_profile');
              },
              style: ElevatedButton.styleFrom( //<-- SEE HERE
                side: BorderSide(
                  width: 1.5,
                  color: Color(0xFF22331F),
                ),
              ),
            ),

              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    color: Color(0xFF22331F),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Favorite(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        width: 1.5,
                        color: Color(0xFF22331F),
                      ),
                    ),
                  ),
                  buildCarCount(Car_favorite),
                ],
              ),

              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Color(0xFF22331F),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Basket(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom( //<-- SEE HERE
                      side: BorderSide(
                        width: 1.5,
                        color: Color(0xFF22331F),
                      ),
                    ),
                  ),
                 buildCarCount(Car_in_basket),
                ],
              ),

              IconButton(
                icon: const Icon(Icons.shopping_bag),
                color: Color(0xFF22331F),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopList(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom( //<-- SEE HERE
                  side: BorderSide(
                    width: 1.5,
                    color: Color(0xFF22331F),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),);
  }
}