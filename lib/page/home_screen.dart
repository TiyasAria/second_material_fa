import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_two_news_app/page/category_list.dart';
import 'package:material_two_news_app/repo/news_repository.dart';
import 'package:material_two_news_app/utils/routes.dart';
import 'package:material_two_news_app/utils/theme.dart';
import 'package:material_two_news_app/widget/item_headline.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';

import '../data/news.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  News news = News();

  @override
  Widget build(BuildContext context) {
    List<Article> articles = [];
    String dateNow = DateFormat("dd MMMM yyyy").format(DateTime.now());

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, accountRoute);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
                        width: 50,
                        fit: BoxFit.cover,
                        height: 50,
                      ),
                    ),
                  ),
                  sizedBox(15, 0),
                  Text(
                    dateNow,
                    style: detailText.copyWith(color: Colors.black),
                  ),
                ],
              ),
              sizedBox(0, 10),
              Text(
                'Breaking News',
                style: mainTitle,
              ),
              sizedBox(0, 14),
              buildListNews(context)
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildListNews(BuildContext context) {
    return FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return buildContent(context, snapshot.data as List<Article>);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Text('HAHAHAHa');
            }
          }
        });
  }

  Column buildContent(BuildContext context, List<Article> articles) {
    // for random index 
    int randomIndex = Random().nextInt(articles.length);

    return Column(
      children: [
        itemHeadline(  articles[randomIndex] , context),
        sizedBox(0, 20),
        CategoryPage(articles)
      ],
    );
  }
}
