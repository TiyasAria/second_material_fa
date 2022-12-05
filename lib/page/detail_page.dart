

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:material_two_news_app/utils/routes.dart';
import 'package:material_two_news_app/utils/theme.dart';
import 'package:material_two_news_app/widget/button.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';

import '../data/news.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.article);
  Article article;

  Future<void> share() async {
    await FlutterShare.share(
      title: 'Breaking News. Ayo baca!',
      text: article.title ,
      linkUrl: article.url
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(0, 10),
                            blurRadius: 30)
                      ]),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: greyColor,
                    ),
                  ),
                ),

                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(0, 10),
                            blurRadius: 30)
                      ]),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        share();
                      },
                      icon: Icon(Icons.share_outlined),
                      color: greyColor,
                    ),
                  ),
                )
              ],
            ),

            sizedBox(0, 30),

            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(article.urlToImage , height: 263, fit: BoxFit.cover,),
            ),

            sizedBox(0, 20),

            Text(article.title , maxLines: 2, style: titleDetailText,),

            sizedBox(0, 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.account_circle_outlined , size: 30, color: greyColor,),
                      sizedBox(10, 0),
                      Container(
                        width: 160,
                        child: Text(article.author , style: detailText, maxLines: 2, ))
                    ],
                  ),
                ),

                Text(DateFormat("MMM, dd yyyy").format(article.publishedAt), style: detailText,)
              ],
            ),

            sizedBox(0, 25),
            Text(article.content, style: detailText,),
            sizedBox(0, 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, webViewRoute , arguments: article.url) ; 
              },
              child: button(context: context, title: "Read More"))
            
          ],
        ),
      )),
    );
  }
}
