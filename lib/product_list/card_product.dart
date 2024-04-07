

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:untitled1/secondary screens/basket.dart';
import 'package:untitled1/secondary screens/favorite.dart';
import 'package:untitled1/secondary screens/shopping list.dart';

import '../colors/colors.dart';


class CardScreen extends StatefulWidget {
  final LadaCar car;


  const CardScreen({super.key, required this.car});

  @override
  // ignore: library_private_types_in_public_api
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int currentPage = 1;
  late YoutubePlayerController _controller;


  @override
  void initState(){
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.car.youtubeVideo).toString(),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApplication.appBarColor,
        title: Text(widget.car.name),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.car.imageUrl.length,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page + 1;
                    });
                  },

                  itemBuilder: (context, idx) {
                    return Image.network(
                      widget.car.imageUrl[idx],
                        fit: BoxFit
                            .cover,
                    );
                  },
                ),

                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      '$currentPage/${widget.car.imageUrl.length}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF364836),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),

          Expanded(
            flex: 6,
            child:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(widget.car.name,textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,  fontWeight: FontWeight.bold)),

                Text('Цена: ${widget.car.price}',textAlign: TextAlign.center,  style: TextStyle(fontSize: 22)),



SingleChildScrollView (

                child:  Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Color.fromRGBO(162, 182, 160, 1.0),
                border: Border.all(color: Color.fromARGB(255, 74, 89, 71), width: 2)),
            height: 130,
            padding: EdgeInsets.all(3.0),
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                      widget.car.description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)
                  ),
                ),
              ),
            ),
          ),),


                const SizedBox(
                  height: 5,
                ),
                Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Expanded(

                      child:
                      Padding(padding: EdgeInsets.only(left: 2, right: 2,),

                        child:
                        ElevatedButton(onPressed: () {
                          showModalBottomSheet(context: context, builder: (BuildContext context){
                            return Padding(padding: const EdgeInsets.all(16),
                              child: Container(
                                child: Scaffold(
                                  body: Column(
                                    children: [
                                      ElevatedButton(onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CardScreen(car: widget.car),
                                          ),
                                        );

                                      },

                                        child:
                                        ListTile(
                                          leading:  ClipRRect(borderRadius: BorderRadius.circular(1),
                                            child: Image.network(widget.car.imageUrl.first.toString()),),
                                          title: Text(widget.car.name),
                                          subtitle: Text(widget.car.price),
                                        ),),

                                      Padding(padding: EdgeInsets.only(top: 50),
                                      child:
                                      ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Вы уверены, что хотите купить этот товар?"),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    child: Text("купить", style: const TextStyle(color: Colors.white)),
                                                    onPressed: () {Car_in_shopping_list.add(widget.car);
                                              Navigator.push(context, MaterialPageRoute( builder: (context) => ShopList(),),
                                              );
                                              },
                                                    style: ButtonStyle(

                                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF354411))),),
                                                  ElevatedButton(
                                                    child: Text("отмена", style: const TextStyle(color: Colors.white)),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    style: ButtonStyle(

                                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF354411))),),
                                                ],

                                              );
                                            },
                                          );
                                        },
                                        child: Text("оплатить", style: const TextStyle(fontSize: 20, color: Colors.white)),
                                        style: ButtonStyle(

                                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF354411))),)
                                      ),

                                    ],
                                  ),
                                ),),

                            );
                          },);
                        },

                            child: Text("купить", style: const TextStyle(fontSize: 19, color: Color(
                                0xFF28330D)))),),),

                    ElevatedButton(onPressed: () {
                      setState(() {
                        widget.car.inBasket = !widget.car.inBasket;

                        Car_in_basket.add(widget.car);


                      });
                    },

                        child: Icon(
                          widget.car.inBasket ? Icons.shopping_basket : Icons.shopping_basket_outlined,
                          color: widget.car.inBasket ? Color(
                              0xFF354213) : Color(
                              0xFF354213),
                        )),

                    ElevatedButton(onPressed: () {
                      setState(() {

                        widget.car.isLiked = !widget.car.isLiked;
                        Car_favorite.add(widget.car);
                      }
                      );
                    },

                      child: Icon(
                        widget.car.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: widget.car.isLiked ? Colors.red : Color(
                            0xFF354213),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ),
          ),

      Expanded(
        flex: 6,
        child:  Align(
        alignment: Alignment.centerLeft,

        child: Container(

          width: MediaQuery.of(context).size.width ,
          margin: EdgeInsets.only(),

          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(widget.car.youtubeVideo).toString(),
              flags: YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
          ),
        ),
      ),
      )
        ],
      ),
    );
  }
}
