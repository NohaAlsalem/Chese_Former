import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'on_Bording_Cubit/on_bord_cubit.dart';
import 'on_Bording_Cubit/states.dart';

class BordingModel {
  final String image;
  final String title;
  final String body;

  BordingModel({required this.image, required this.title, required this.body});
}
// PageView(
// pageSnapping: true,
// controller: pageController,
// onPageChanged: (index) {
// setState(() {
// pageChanged = index;
// });
// print(pageChanged);
// },
//child:Lottie.asset('asset/image/of-ramadan.json') ,
class on_Bording extends StatelessWidget {
  List<BordingModel> bording = [
    BordingModel(
        image: 'asset/image/lifestyle-ramadan-2021.json', title: '', body: ''),
    BordingModel(
        image: 'asset/image/ramadhan-kareem.json', title: '', body: ''),
    BordingModel(
        image: 'asset/image/ramadan.json', title: '', body: ''),
    BordingModel(
        image: 'asset/image/ramadan-2021.json', title: 'Screen3', body: ''),
    // BordingModel(
    //     image: 'asset/image/the-quran-ramadan-2021.json', title: 'Screen3', body: 'body3'),
    BordingModel(
        image: 'asset/image/son-to-read-koran.json', title: 'Screen3', body: '')
  ];
  var boardController=PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>onPordingCub(),
      child: BlocConsumer<onPordingCub,onPording>(
        listener: (context,state){},
        builder:(context,state)=> Scaffold(
          appBar: AppBar(
            backgroundColor:Color(0xAACF8189),

            actions: [
              TextButton(
                child:Text('SKIP',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: (){
                  Navigator.pushReplacementNamed(context,'home');
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBordingItem(bording[index]),
                    onPageChanged:(int index){
                      if(index==bording.length-1){
                        onPordingCub.get(context).changeisLast(true);
                      }
                      else {
                        onPordingCub.get(context).changeisLast(true);
                      }                  } ,
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                       DotsIndicator(
                  dotsCount: 5,
                 // position:bording[index].id,
                  decorator: DotsDecorator(
                   //   color:Color(0xAA7E7F9A) ,
                      activeColor:Color(0xAACF8189),
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),


                    Spacer(),
                    FloatingActionButton(
                      backgroundColor: Color(0xAACF8189),
                      onPressed: () {
                        if(onPordingCub.get(context).isLast){
                         // Navigator.pushReplacementNamed(context,'home');
                        }
                        else {
                          boardController.nextPage(duration: Duration(
                            milliseconds: 750,
                          ), curve: Curves.fastLinearToSlowEaseIn);
                        }},
                      child: Icon(Icons.arrow_forward_ios,),
                    ),],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBordingItem(BordingModel model) => Column(
    children: [
      Expanded(
          child:Lottie.asset('${model.image}') ,),
          // child: Image(
          //   image: AssetImage('${model.image}'),
          // )),
      SizedBox(
        height: 20.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 25.0,
          color:Color(0xAA7E7F9A),
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 20.0,
      )
    ],
  );
}
