import 'package:flutter/material.dart';
import 'package:untitled1/colors/colors.dart';
import 'package:untitled1/product_list/car_info/lada_cars_grid.dart';
import 'package:untitled1/secondary screens/basket.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: ColorsApplication.appBarColor,
        title: const Text('Каталог'),
        centerTitle: true,
      ),
      body: const LadaCarsGrid(),


    );

  }
}
