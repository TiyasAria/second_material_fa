import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_two_news_app/data/news.dart';
import 'package:material_two_news_app/utils/theme.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';

import '../utils/routes.dart';

Widget itemHeadline(Article article, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, detailPage, arguments: article);
    },
    child: Container(
        height: 313,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 4),
                  blurRadius: 50,
                  spreadRadius: 1)
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                article.urlToImage,
                height: 202,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 235,
                    child: Text(
                      article.title,
                      style: titleItemText.copyWith(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  sizedBox(0, 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            size: 23,
                            color: greyColor,
                          ),
                          sizedBox(8, 0),
                          Container(
                              width: 100,
                              child: Text(
                                article.author,
                                style: detailText.copyWith(
                                    fontSize: 14, color: greyColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          DateFormat("MMMM, dd yyyy")
                              .format(article.publishedAt),
                          style: detailText.copyWith(
                              fontSize: 14, color: greyColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )),
  );
}
