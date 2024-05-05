import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Exercise extends StatefulWidget {
  String image;
  String title;
  String des ;
  Exercise({super.key , required this.image , required this.title , required this.des});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  List exer =[
    {
      "img":"assets/images/t1.gif",
      "title":"JUMPING JUCKS",
      "des":"00:20",
    },
    {
      "img":"assets/images/t2.gif",
      "title":"ABDOMINAL CRUNCHES",
      "des":"x16",
    },
    {
      "img":"assets/images/t3.png",
      "title":"RUSSIAN TWIST",
      "des":"00:15",
    },
    {
      "img":"assets/images/t4.png",
      "title":"HEEL TOUCH",
      "des":"00:30",
    },
    {
      "img":"assets/images/t5.png",
      "title":"LEG RAISES",
      "des":"x13",
    },
    {
      "img":"assets/images/t1.gif",
      "title":"JUMPING JUCKS",
      "des":"00:20",
    },
  ];

  bool test = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate:CustomSliverAppbarDelegate(expandedHeight: MediaQuery.of(context).size.height*0.35, img: widget.image , title: widget.title , des: widget.des)),
         SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
               /*  Container(
                  height: MediaQuery.of(context).size.height*0.18,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height*0.08,
                        width: MediaQuery.of(context).size.width*0.85,
                        decoration: BoxDecoration(
                       // color: Color.fromARGB(48, 66, 190, 196),
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 38, 164, 170)
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.sports_gymnastics_rounded),
                          Text("Start With a Warm Up" , style: TextStyle(
                            fontSize: 18 , 
                            fontFamily: "WorkSans",
                            color: Colors.black
                          ), ),
                           Switch(
                  value: test,
                  onChanged: (nlan) {
                    setState(() {
                      test = nlan ;
                    });
                  },
                  trackOutlineColor: MaterialStatePropertyAll(Colors.black12),
                  activeColor: Color.fromARGB(255, 38, 164, 170),
                  inactiveThumbColor: Colors.black,
                  inactiveTrackColor: Colors.black26,
                ),
                        ],
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: MediaQuery.of(context).size.height*0.08,
                        width: MediaQuery.of(context).size.width*0.85,
                        decoration: BoxDecoration(
                       // color: Color.fromARGB(81, 38, 163, 170),
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 38, 164, 170)
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      ),
                    ],
                  )
                ),
              */
               ...exer.map((item) => allexer(context, item)),
                button(context),
              ],
            ),
          )
         ),
        ],
      ),
    );
  }

  Container button(BuildContext context) {
    return Container(
               height: MediaQuery.of(context).size.height*0.15,
             //  color: Colors.amber,
               alignment: Alignment.center,
               child: ElevatedButton(onPressed: (){},
               style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 38, 164, 170),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),),
                child: Container(
                  alignment: Alignment.center,
                  padding:const EdgeInsets.symmetric(horizontal: 20 , vertical: 8),
                  height: 60,
                  width: 250,
                  child:  Text("start" , style: const TextStyle(
                    fontFamily: "WorkSans",
                    fontSize: 25 ,
                    fontWeight: FontWeight.w600 ,
                    color: Colors.white
                  ),),
                 )),
              );
  }

  Column allexer(BuildContext context, item) {
    return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5 , bottom: 5 , left: 15 , right: 15),
                  height: MediaQuery.of(context).size.height*0.11,
                  width: MediaQuery.of(context).size.width,
                //  color: Colors.amber,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.35,
                        height: MediaQuery.of(context).size.height*0.11,
                      //  color: Colors.pink,
                        child: Image.asset(item["img"] , fit: BoxFit.contain,),
                      ),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.075,
                          //  color: Colors.black,
                            alignment: Alignment.centerLeft,
                            child: Text(item["title"] , style: TextStyle(
                              fontFamily: "WorkSans",
                              fontSize: 20,
                              color: Colors.black
                            ),),
                          ),
                          Text(item["des"] , style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Colors.black54
                          ),)
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider())
              ],
             );
  }
}

class CustomSliverAppbarDelegate extends SliverPersistentHeaderDelegate{
final double expandedHeight ;
final String img ;
final String title ;
final String des ;
const CustomSliverAppbarDelegate({required this.expandedHeight , required this.img , required this.title , required this.des});

@override
Widget build(BuildContext context , double shrinkOffset , bool overlapsContent){
  final size = 70;
  final top = expandedHeight - shrinkOffset - size / 2;
  return Stack(
   fit: StackFit.expand,
   children: [
    Container(
      height: MediaQuery.of(context).size.height*0.34 ,
      color: Colors.white,
    ),
    buildBackground(shrinkOffset, context),
    buildAppBar(shrinkOffset),
     Positioned(
          top: top - 30,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
   ],
  );
}

 double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

 Widget buildBackground(double shrinkOffset , BuildContext context ) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Stack(
            children: [
              Container(
                color: Colors.black,
                height: /* MediaQuery.of(context).size.height*0.27 */ expandedHeight-30,
                width: MediaQuery.of(context).size.width,
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(img , fit: BoxFit.cover,))),
                Positioned(
                  left: 0,
                  bottom: 60,
                  child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                     // color: Color.fromARGB(156, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        title,
                        style:  TextStyle(fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white , fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.71,
                        child: Text(
                          textAlign: TextAlign.left,
                          des,
                          style:  TextStyle(
                          fontFamily: "WorkSans",
                          fontSize: MediaQuery.of(context).size.width*0.03,
                          color: Colors.white,
                         // fontWeight: FontWeight.bold
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),)
            ],
          ),
      );

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back , color: Colors.white,)),
          backgroundColor: /* Colors.black */Color.fromARGB(255, 38, 164, 170),
          title: Text(title, style: TextStyle(
            fontFamily: "WorkSans",
            fontSize: 25,
            color: Colors.white,
          ),),
        //  centerTitle: true,
        ),
      );

 Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Container(
          height: 65,
          child: Card(
            color: const Color.fromARGB(206, 0, 0, 0)/* Color.fromARGB(206, 38, 163, 170) */,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: buildButton(text: '16 min', icon: Icons.timer_sharp)),
                Expanded(child: buildButton(text: '4 Exe', icon: null)),
                Expanded(child: buildButton(text: '30 cal', icon: Icons.local_fire_department_sharp)),
              ],
            ),
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required IconData? icon,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
        icon==null? Container():  Icon(icon , color: Colors.white,),
          const SizedBox(width:4 ),
          Text(text, style: TextStyle(fontSize: 25 , fontFamily: "WorkSans", color: Colors.white )),
        ],
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight+30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}