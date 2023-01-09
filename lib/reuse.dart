import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/models/newsModel.dart';
import 'package:untitled3/screens/webview.dart';
import 'package:url_launcher/url_launcher.dart';


Widget news(Articles model,context){
  List even=[Colors.blue,Colors.pink,Colors.blueGrey,Colors.deepPurple];


  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>view(model.url!)));
    },
    child: Container(
      height: MediaQuery.of(context).size.height*.2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color:(even..shuffle()).first,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        margin: EdgeInsets.only(top: 10,left: 5),
        child: Row(
          children: [
            Container(
              height: 200,
              width: 150,
              child: Card(

                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsets.all(10),
                child: Image.network(
                    "${model.urlToImage}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: 200,
                    child: Text(

                        "${model.title}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text("${model.publishedAt}",
                    style: TextStyle(
                      color: Colors.white70
                    ),))
              ],
            )
          ],
        ),
      ),
    ),
  );
}