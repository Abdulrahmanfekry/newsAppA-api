class FootBallModel{
  String? status;
  int? totalResults;
  List<Articles> articles=[];

  FootBallModel.fromjson(json){
    status=json["status"];
    totalResults=json["totalResults"];
    json["articles"].forEach((element){
      articles.add(Articles.fromjson(element));
    });
  }
}


class Articles{
  /*
   "source": {
                "id": null,
                "name": "Manchester United"
            },
            "author": null,
            "title": "تقرير المباراة: يونايتد 2 بيرنلي 0",
            "description": "حجز يونايتد مقعدً في الدور ربع النهائي من كأس كاراباو بعد الفوز على بيرنلي",
            "url": "https://www.manutd.com/ar/news/detail/match-report-and-highlights-hub-man-utd-vs-burnley-21-december-2022",
            "urlToImage": "https://assets.manutd.com/AssetPicker/images/0/0/17/246/1177170/GettyImages_14511396661671656878522_large.jpg",
            "publishedAt": "2022-12-21T23:39:02Z",
            "content": "2 4 . . 8 1 2 . . .\r\nMUFC lost 2 of first 4 home games this season. Things have settled. The home record now reads W8 D1 L2 in all comps. Arsenal, Spurs and Liverpool all defeated at Old Trafford. An… [+696 chars]"
       */
  String? author;
  String? content;
  Source? source;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  Articles.fromjson(json){
    content=json["content"];
    author=json["author"];
    title=json["title"];
    description=json["description"];
    url=json["url"];
    urlToImage=json["urlToImage"];
    publishedAt=json["publishedAt"];
    source=Source.fromjson(json["source"]);


  }
}
class Source{
  String? id;
  String? name;

  Source.fromjson(json){
   id=json["id"];
   name=json["name"];
  }

}