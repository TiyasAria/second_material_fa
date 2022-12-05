import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_two_news_app/data/news.dart';
import 'package:material_two_news_app/utils/routes.dart';
import 'package:material_two_news_app/utils/theme.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget itemHorizontal(BuildContext context, Article article) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, detailPage, arguments: article);
    },
    child: Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              article.urlToImage,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            )),
        sizedBox(16, 0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 245,
                  child: Text(
                    article.title,
                    style: titleItemText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
              sizedBox(0, 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: greyColor,
                      ),
                      sizedBox(5, 0),
                      Text(
                        DateFormat("MMM, dd yyyy").format(article.publishedAt),
                        style:
                            detailText.copyWith(fontSize: 12, color: greyColor),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 16,
                        color: greyColor,
                      ),
                      sizedBox(5, 0),
                      Text(
                        timeUntil(
                            DateTime.parse(article.publishedAt.toString())),
                        style:
                            detailText.copyWith(fontSize: 12, color: greyColor),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

String timeUntil(DateTime parse) {
  return timeago.format(parse, allowFromNow: true, locale: 'en');
}
