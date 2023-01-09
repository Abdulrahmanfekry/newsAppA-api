import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubitManager.dart';
import '../cubit/cubitStates.dart';
import '../reuse.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsappManager,newsappstate>(
      listener: (context,state){},
      builder:(context,state){
        var cubit=newsappManager.get(context);
        return ConditionalBuilder(
            condition: cubit.searchlist.isNotEmpty,
            builder: (context)=>ListView.builder(itemBuilder: (BuildContext context, int index) {
              return news(cubit.searchlist[index],context);
            },
              physics: BouncingScrollPhysics(),
              itemCount: cubit.searchlist.length,
            ),
            fallback: (context)=>Center(
              child: CircularProgressIndicator(),
            ));
      },

    );
  }
}
