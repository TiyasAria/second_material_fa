import 'package:flutter/material.dart';
import 'package:material_two_news_app/data/news.dart';
import 'package:material_two_news_app/repo/news_repository.dart';
import 'package:material_two_news_app/utils/theme.dart';
import 'package:material_two_news_app/widget/item_hotizontal.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class CategoryPage extends StatefulWidget {
  final List<Article> article;
  CategoryPage(this.article);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final List<Tab> myTab = [
    //  berisi judul tab2 kita
    const Tab(
      text: 'Business',
    ),
    const Tab(
      text: 'Entertainment',
    ),
    const Tab(
      text: 'General',
    ),
    const Tab(
      text: 'Health',
    ),
    const Tab(
      text: 'Science',
    ),
    const Tab(
      text: 'Sports',
    ),
    const Tab(
      text: 'Technology',
    ),
  ];

  News news = News();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: myTab.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Material(
          child: TabBar(
            controller: tabController,
            indicatorColor: blueColor,
            tabs: myTab,
            isScrollable: true,
            labelColor: blueColor,
            unselectedLabelColor: greyColor,
            indicator: DotIndicator(
              color: blueColor,
              distanceFromCenter: 16,
              radius: 3,
              paintingStyle: PaintingStyle.fill,
            ),
          ),
        ),
        sizedBox(0, 10),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: myTab.map((Tab tab) {
              return FutureBuilder(
                  future: news.getNewsByCategory(tab.text.toString()),
                  builder: (context, snapshot) => snapshot.data != null
                      ? _listNewsByCategory(  snapshot.data as List<Article> , context)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(child: CircularProgressIndicator()),
                          ],
                        ));
            }).toList(),
          ),
        )
      ]),
    );
  }

  Widget _listNewsByCategory(List<Article> articles, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 10
            ),
            child: itemHorizontal(context, articles[index]),
          );
        },
      ),
    );
  }
}
