import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../services/url_launcher.dart';


class PortfolioContentDesktop extends StatefulWidget {
  const PortfolioContentDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioContentDesktop> createState() => _PortfolioContentDesktopState();
}

class _PortfolioContentDesktopState extends State<PortfolioContentDesktop> {



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
                  padding: EdgeInsets.symmetric(horizontal: getHeight(context) * 0.45, vertical: 50),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: getHeight(context) * 0.55,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 100,
                        mainAxisSpacing: getHeight(context) * 0.35),
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
        width: getWidth(context) * 0.50,
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
                      app['title'],style: TextStyle(fontSize: getWidth(context) * 0.025,fontWeight: FontWeight.bold),),
                    Text(
                      app['description'],style: TextStyle(fontSize: getWidth(context) * 0.010,fontWeight: FontWeight.w700),),
                    InkWell(
                      onTap: () => repository.launchUrl(app['url']),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: getHeight(context) * 0.31,
                        width: getWidth(context) * 0.22,
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
