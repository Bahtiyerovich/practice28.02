import 'package:flutter/material.dart';
import 'package:prac28/core/constants/consts.dart';
import 'package:prac28/core/constants/font_const.dart';
import 'package:prac28/core/constants/p_m_const.dart';
import 'package:prac28/core/constants/radius_const.dart';
import 'package:prac28/models/news_model.dart';

class IndividualPage extends StatefulWidget {
  Article? data;
  IndividualPage({Key? key, this.data}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          mySliverAppBar(context),
          SliverPadding(
            padding: PMConst.kExtraSmallPM,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, __) {
                  return SizedBox(
                    height: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 14, left: 20, right: 20, bottom: 10),
                          child: Text(
                            widget.data!.title!,
                            style: TextStyle(
                              fontSize: FontConst.kLargeFont,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 20, right: 20, bottom: 10),
                          child: Text(
                            widget.data!.description!,
                            style: TextStyle(
                              fontSize: FontConst.kMediumFont,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 14, left: 20, right: 20, bottom: 10),
                          child: Text(
                            'by ' + widget.data!.author!,
                            style: TextStyle(
                                fontSize: FontConst.kSmallFont,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.kPrimaryColorGrey),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          child: Text(widget.data!.publishedAt!.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          child: Text(widget.data!.content!,style: TextStyle(
                              fontSize: FontConst.kMediumFont,
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          child: Text(widget.data!.source!.name!,style: TextStyle(
                              fontSize: FontConst.kSmallFont,
                            ),),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  SliverAppBar mySliverAppBar(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      iconTheme: IconThemeData(color: ColorConst.kPrimaryBlack),
      title: Text(
        widget.data!.author!,
      ),
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height * 0.35,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            RadiusConst.kExtraLargeRadius,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              // imageUrl:
              widget.data!.urlToImage.toString(),
            ),
          ),
        ),
      )),
    );
  }
}
