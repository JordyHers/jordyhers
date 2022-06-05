import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../services/url_launcher.dart';
import '../../utils/config.dart';
import '../../utils/constants.dart';

class PortfolioContentMobile extends StatelessWidget {
  const PortfolioContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric( vertical: 20),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: getHeight(context) * 0.30,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: getHeight(context) * 0.10,
                      mainAxisSpacing: getHeight(context) * 0.02),
                  itemCount: 4,
                  itemBuilder: (BuildContext ctx, index) {
                    return portfolioHeaderSection(ctx,apps[index]);
                  }),


            ),
          ],
        ),
      ),
    );
  }

  Widget portfolioHeaderSection (BuildContext context, Map<String,dynamic> app){
    final repository = Provider.of<WebService>(context, listen: false);
    return  Container(
        height: getHeight(context) * 0.60,
        width: getWidth(context) * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      app['title'],style: TextStyle(fontSize: getWidth(context) * 0.035,fontWeight: FontWeight.bold),),
                    Text(
                      app['description'],maxLines: 2, textAlign: TextAlign.center,style: TextStyle(height: 1.5, fontSize: getWidth(context) * 0.020,fontWeight: FontWeight.w700),),
                    InkWell(
                      onTap: () => repository.launchUrl(app['url']),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: getHeight(context) * 0.21,
                        width: getWidth(context) * 0.32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            image: DecorationImage(image: AssetImage(app['image'],),fit: BoxFit.cover)

                        ),
                        //child: Image.asset(app['image'],fit: BoxFit.fitWidth,),
                      ),
                    ),


                  ],
                )
            ),


          ],
        )
    );
  }
}