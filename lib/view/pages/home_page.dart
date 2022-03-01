import 'package:flutter/material.dart';
import 'package:prac28/core/constants/consts.dart';
import 'package:prac28/core/constants/p_m_const.dart';
import 'package:prac28/core/constants/radius_const.dart';
import 'package:prac28/models/news_model.dart';
import 'package:prac28/services/news_api_service.dart';
import 'package:prac28/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'NEWS',
        textColor: ColorConst.kPrimaryBlack,
      ),
      body: FutureBuilder(
        future: NewsApi.getData(),
        builder: (context, AsyncSnapshot<NewsModel> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("ERROR"),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 700,
                  width: 420,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: PMConst.kExtraSmallPM,
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  RadiusConst.kExtraSmallRadius,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    snapshot.data!.articles![index]
                                            .urlToImage ??
                                        "https://source.unsplash.com/random",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 240,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.articles![index].title
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'by ' +
                                        snapshot.data!.articles![index].author
                                            .toString(),
                                    style: TextStyle(
                                      color: ColorConst.kPrimaryGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    snapshot.data!.articles![index].publishedAt
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/page',
                              arguments: snapshot.data!.articles![index]);
                        },
                      );
                    },
                    itemCount: snapshot.data!.articles!.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
