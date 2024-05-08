import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:image_picker/image_picker.dart'; 
 import 'package:http/http.dart' as http;

class Datacontroller extends GetxController {
  Color basiccolor = Color.fromARGB(255, 38, 164, 170) ;
  Color deepcolor = Color.fromARGB(255, 27, 118, 122) ;
  Color twocolor = Colors.black ;

  int index = 0;

  void changed(int value) {
    index = value;
    update();
  }
   
   double percent = 1/6 ;
   void nextpercent(){
    percent += 1/6 ;
    update();
   }

   void previouspercent(){
    percent -= 1/6 ;
    update();
   }
  
   
  final control = PageController();

  double heightman =350 ;
  double heightwoman = 340;
   void setwidth (double width_screen , double height_screen ){
   if (man == 0) {
     heightman = height_screen*0.445 ;
   heightwoman = height_screen*0.425;
   }else if(man == 1){
     heightman = height_screen*0.5 ;
     heightwoman = 220;
   }else{
    heightwoman = height_screen*0.48;
    heightman = 220;
   }

   }

 //gender page 
  Color crman = Colors.black;
  double sizeman = 25;
  FontWeight weightman = FontWeight.normal;
  Color crwoman = Colors.black;
  double sizewoman = 25;
  FontWeight weightwoman = FontWeight.normal;
  int man = 0;
  //350
  double leftman = 60;
  double bottomman = 30;
  
  double opacityman = 1;
  double rightwoman = 60;
  double bottomwoman = 30;
  
  double opacitywoman = 1;

  void selectman(
      {required Color crm,
      required double sizem,
      required FontWeight weightm,
      required Color crw,
      required double sizew,
      required FontWeight weightw,
      required int m,
      required double leftm,
      required double bottomm,
      required double heightm,
      required double opacitym,
      required double rightw,
      required double bottomw,
      required double heightw,
      required double opacityw}) {
    crman = crm;
    sizeman = sizem;
    weightman = weightm;
    crwoman = crw;
    sizewoman = sizew;
    weightwoman = weightw;
     man = m;
    leftman = leftm;
    bottomman = bottomm;
    heightman = heightm;
    opacityman = opacitym;
    rightwoman = rightw;
    bottomwoman = bottomw;
    heightwoman = heightw;
    opacitywoman = opacityw;
    update();
  }


   //target page 
   String selectgoal =''; 

   void setselectgoal(String value){
     selectgoal = value ;
     update();
   }


 // focus area page 
 int selectfocusarea = 0 ;

 void setfocusarea(int value){
    selectfocusarea = value ;
    update();
 }


 //weight and height 
 int totalhieght = 220;
 int initheight = 160;
 int currentheight = 160;

 int totalwieght = 220;
 int initweight = 60;
 int currentweight = 60;

 void setheight(int value){
    currentheight = value ;
    initheight = value ;
    update();
 }

 void setweight(int value){
    currentweight = value ;
    initweight = value ;
    update();
 }

//image picker 
final imagepicker = ImagePicker();
File? pickedimage ;

void fetchimage()async{
 XFile? image = await imagepicker.pickImage(source: ImageSource.gallery);
 if(image == null){return;}
 pickedimage = File(image.path);
 update();
}


//Days page
List days =[];

bool check(int a){
  if(days.contains(a)){
    return true;
  }else{return false ;}
}

void setdays(int a ){
  if(days.contains(a)){
    days.remove(a);
  }else{
    days.add(a);
  }
  update();
}

TimeOfDay time = TimeOfDay.now();

 void setclock (TimeOfDay s){
  time = s;
  update();
 }

//illness page 

int selectill =0; 

bool checkill(int num ){
  if(selectill == num){
    return true ;
  }else{
    return false;
  }
}

   void setselectill(int value){
    if(selectill == value){
      selectill = 0;
    }else{
      selectill = value ;
    }
     update();
   }

//
  String token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDYwZjM0MmRjYWY5NWEwZGNjM2ExNzE2ZGIzNjYyYWY2ZTUxM2U0NGU4M2FlZjI1NzQ1NDc5MmQwZjAyNWJjY2I5MTNkYTNmZmY2NDc1NmMiLCJpYXQiOjE3MTQzNzg0MjcuODM3Mzk5LCJuYmYiOjE3MTQzNzg0MjcuODM3NDAyLCJleHAiOjE3NDU5MTQ0MjcuNzA1MzkzLCJzdWIiOiIyIiwic2NvcGVzIjpbInVzZXIiXX0.D1pXYfNZr5RMewsc687mssDUTOeXnhVelem5GoVBz00ThFOMj29iuR_KZZhYkT1Y41_nI90VB073Mwuj4n3WGDydo2261xa9d9pwmHRPhBfDe7i2SxNLub41riC-HDcvGhDbMhwNZeLvXefP0ePNM249EHQjBb9yvXteHc5gSudGVFMw_zaBWBxZReaDLXMupmNRGySX6pOGkys0BqevGq6llD487CpmTv836CulAAu5TTFPsqruO5RLNygOrUGyumfM_rk1kgRjbDw6mWCBjM_RCiRzCXUt3meWP5omYiedghjUPIQhpQ_0ajh4pZq5jDeuSIN8SWU_J_IdJoRbgmkxkLdOneJ8-9i1epG1j2STJaHb8zVNd4tVjV1KEFxgJWLemsi6Tahrf_9NQAaoyJ3Xi_XVlOAr2QnTDub1H7q3-OIEd_SdOLIo1wNjiDsXSmVdyPLoPRs-t3_gUF5ZlF_CV99bIaOplY16jDr5M7uzUnpDhPSfODRmdZH0o68EoXeCSGOlbKXGWOAHNlG9CeOjGOC8T2AkYoVXH2Ol3L2-RXX9a2EsvJ0a1j0jiYlgvJkj1ZN05M-lONV_7Xlr0-7GpYHooMe70EA3wrMMZPQNkFAyKXpkj1vasedevz9EzoBCmqkne_TtvcZnXS0EQGDJBYTgMQ7BXyOdFZuE4ZM";
   String baseurl ="http://192.168.43.27:8000/api/";
 
  Map <String , String> User_data ={
    'gender':'',
    'target':'',
    'diseases':'',
    'focus_area':'',
    'tall':'',
    'weight':'',
    'preferred_time':''
  };


  void setUser_Data(){
    if (man == 1) {
       User_data["gender"]="male";
    }else{
      User_data["gender"]="female";
    }
   if(selectgoal =="1"){
     User_data["target"]="lose weight";
   }else if(selectgoal == "2"){
     User_data["target"]="build muscle";
   }else{
     User_data["target"]="keep fit";
   }
   User_data["tall"]=currentheight.toString();
   User_data["weight"]=currentweight.toString();
   if(selectfocusarea ==1){
     User_data['focus_area'] = 'all';
   }else if(selectfocusarea == 2){
     User_data['focus_area'] = 'chest';
   }else if (selectfocusarea == 3){
    User_data['focus_area'] = 'abs';
   }else if(selectfocusarea == 4){
     User_data['focus_area'] = 'arm';
   }else{
    User_data['focus_area'] = 'leg';
   }
   if(selectill == 0){
    User_data['diseases'] = 'none';
   }else if(selectill == 1){
    User_data['diseases'] = 'knee';
   }else if(selectill == 2){
     User_data['diseases'] = 'heart';
   }else{
    User_data['diseases'] = 'breath';
   }
   User_data['preferred_time'] = "${time.hour.toString()}:${time.minute.toString()}";
  }

 Future Setdata ()async{
  final String url = '${baseurl}trainer/info';
  try{
     final request = http.MultipartRequest('POST',Uri.parse(url));
    
    request.headers.addAll({'Accept':'application/json' ,
      'Authorization': 'Bearer $token',
      },);
      request.fields.addAll(User_data);
      if(pickedimage!= null){
      request.files.add(await http.MultipartFile.fromPath("image", pickedimage!.path));
      }
     var res= await request.send();
     var response = await http.Response.fromStream(res);
     print(response.body);
     if(response.statusCode == 500){
      throw 'No Internet , Please try again';
     }
     }
    catch(errore){
      rethrow ;
    }
 }

bool isloading = false;

void Load(bool value){
  isloading = value;
  update();
}





}
