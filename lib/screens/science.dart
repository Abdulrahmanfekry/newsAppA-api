import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/cubitManager.dart';
import 'package:untitled3/cubit/cubitStates.dart';

import '../reuse.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsappManager,newsappstate>(
      listener: (context,state){},
      builder:(context,state){
        var cubit=newsappManager.get(context);
          return ConditionalBuilder(
              condition: cubit.sciencee.isNotEmpty,
              builder: (context)=>ListView.builder(itemBuilder: (BuildContext context, int index) {
                return news(cubit.sciencee[index],context);
              },
                physics: BouncingScrollPhysics(),

                itemCount: cubit.sciencee.length,
              ),
              fallback: (context)=>Center(
                child: CircularProgressIndicator(),
              ));


      } ,
    );
  }
}
