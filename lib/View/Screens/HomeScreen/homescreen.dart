import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Controller/Network/endpoint.dart';
import 'package:netflix/Controller/Provider/GetPopuler.dart';
import 'package:netflix/Controller/Provider/GetTopRated.dart';
import 'package:netflix/View/Component/Card/CardPopular.dart';
import 'package:netflix/View/Component/TextCopm/CustomText.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:netflix/View/Screens/DetailsScreen/DetailsScreen.dart';
import 'package:provider/provider.dart';

import '../../../Constant.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          elevation: 0,
          title: CustomTest(
            ColorText:primarycolor,
            title: "NetFlix",
            FontSize: 24,
            fontWeight:FontWeight.bold ,
          ),
          centerTitle: true,
          leading: Icon(
            Icons.search_outlined,
            color: primarycolor,
            size: 33,
          ),
        ),
      backgroundColor: black,
      body:Column(
        children: [
          Consumer<GetTopRated>(
            builder: (context,value,child){
             if(value.loading==false&&value.error==false){
               return CarouselSlider.builder(
                 itemCount:5,//value.MovieList.length,
                 options:CarouselOptions(
                   height: MediaQuery.of(context).size.height/3,
                   aspectRatio: 1.5,
                   viewportFraction: 0.7,
                   initialPage: 0,
                   enableInfiniteScroll: true,
                   reverse: false,
                   autoPlay: true,
                   autoPlayInterval: Duration(seconds: 5),
                   autoPlayAnimationDuration: Duration(milliseconds: 800),
                   autoPlayCurve: Curves.fastOutSlowIn,
                   enlargeCenterPage: true,
                   scrollDirection: Axis.horizontal,
                 ),
                 itemBuilder:(context , index , realIndex){
                   return GridTile(
                     child: Image.network(
                       image_url+value.MovieList[index].poster_path,
                       fit: BoxFit.fill,
                     ),
                     footer: Container(
                       alignment: Alignment.center,
                       color:Colors.red.withOpacity(0.5),
                       child: Text("${value.MovieList[index].title}",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: black,
                         ),),
                     ),
                   );
                 } ,
               );
             }
             if(value.loading==false&&value.error==true){
               return Text("no data",style: TextStyle(
                 color: Colors.red
               ),);
             }else{
               return Center(child: CircularProgressIndicator());
             }

            },
          ),
          Expanded(
            child: Consumer<GetPopuler>(                                //ال consumer دا هو الي بيخليني اعمل refreash للصفحة بتاعتي
              builder:(context,value,child){
                return  MasonryGridView.count(
                  crossAxisCount: 2,
                  itemCount:5,//value.MovieList.length,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return DetailsScreen(value.MovieList[index]);
                              }));
                        },
                        child: CardPopular(title: '${value.MovieList[index].title}',poster_path:'${value.MovieList[index].poster_path}'));
                  },
                );
              },

            ),
          ),
        ],
      ),


    );
  }
}
