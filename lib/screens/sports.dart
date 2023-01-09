import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubitManager.dart';
import '../cubit/cubitStates.dart';
import '../reuse.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsappManager,newsappstate>(
      listener: (context,state){},
      builder:(context,state){
        var cubit=newsappManager.get(context);
          return ConditionalBuilder(
              condition: cubit.sportss.isNotEmpty,
              builder: (context)=>ListView.builder(itemBuilder: (BuildContext context, int index) {
                return news(cubit.sportss[index],context);
              },
                physics: BouncingScrollPhysics(),

                itemCount: cubit.sportss.length,
              ),
              fallback: (context)=>Center(
                child: CircularProgressIndicator(),
              ));


      } ,
    );
  }
}
