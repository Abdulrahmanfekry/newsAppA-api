import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/cubitManager.dart';
import 'package:untitled3/cubit/cubitStates.dart';
import 'package:untitled3/reuse.dart';
import 'package:untitled3/screens/search.dart';
import 'package:untitled3/style.dart';
import 'package:url_launcher/url_launcher.dart';

class Football extends StatelessWidget {

  TextEditingController search=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>newsappManager()..GetSports(),
      child: BlocConsumer<newsappManager,newsappstate>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=newsappManager.get(context);
         // List long=cubit.articelss!;
              return Scaffold(
                body: cubit.searchcheck==false?Center(
                  child: cubit.screens[cubit.current],
                ):Center(child:Search(),),
                appBar: AppBar(
                  backgroundColor: cubit.searchcheck==false?Colors.blue:Colors.white,
                  actions: [
                    if(cubit.searchcheck==false)
                      IconButton(onPressed: (){
                        cubit.search();
                      }, icon: Icon(IconBroken.Search,color: Colors.white,))
                  ],
                  title:  cubit.searchcheck==false?Text(cubit.titles[cubit.current]):TextFormField(
                    controller: search,
                    onChanged: (value){
                      cubit.Getsearchlist(value);
                    },
                  ),
                  leading: cubit.searchcheck==true? IconButton(onPressed: (){
                    cubit.search();
                  }, icon: Icon(IconBroken.Arrow___Left,color:cubit.searchcheck==true?Colors.blue:Colors.white,)):null,
                ),

                bottomNavigationBar: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.sports_volleyball_sharp,),label: "Sports"),
                    BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science"),
                    BottomNavigationBarItem(icon: Icon(IconBroken.Work),label: "Business"),
                  ],
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.shifting,
                  currentIndex: cubit.current,
                  onTap: (index){
                    cubit.bootomnav(index);
                  },
                ),
              );

        },
      ),
    );
  }
}
