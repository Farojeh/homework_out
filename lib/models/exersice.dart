import 'package:fitnessapp/models/pivot_exer.dart';

class exersicemodel{
 String id ;
 String name ;
 String des ;
 String calories ;
 String time ;
 String reps ;
 String image ;
 String video_link ;
 String target ;
 String diseases ;
 String level ;
 String gender ;
 String? choose ;
 Pivot pivot ;

 exersicemodel({
  required this.id,
  required this.name,
  required this.des,
  required this.calories,
  required this.time,
  required this.reps,
  required this.image,
  required this.video_link,
  required this.target ,
  required this.diseases,
  required this.level,
  required this.gender,
  required this.choose,
  required this.pivot
  });
 


}