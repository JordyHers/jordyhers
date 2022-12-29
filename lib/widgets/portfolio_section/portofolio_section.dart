import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:provider/provider.dart';

class PortfolioSection extends StatelessWidget {
  bool isMobile;
   PortfolioSection({Key? key,required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getWidth(context) * 0.20,),
      color: Colors.indigoAccent.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Padding(
            padding: isMobile
                ?  EdgeInsets.symmetric(horizontal: getWidth(context) * 0.10, vertical: getHeight(context) * 0.02)
                :  EdgeInsets.symmetric(horizontal: getWidth(context) * 0.20, vertical: 20),
            child: SelectableText(
              'Portfolio',
              style: GoogleFonts.inter(
                  fontSize:  40,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryTextTheme.caption!.color),
            ),
          ),
          SizedBox(
            height: getHeight(context) * 40/100,
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                semanticChildCount: 2,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: getHeight(context) * 0.02,
                    childAspectRatio: 10 / 12,
                    crossAxisSpacing: getHeight(context) * 0.42,
                    mainAxisSpacing: 0),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return portfolioHeaderSection(ctx,apps[index]);
                }),


          ),
        ],
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
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(context)* 0.05 ),
              child: Align(
                  alignment: Alignment.center,
                  child: Column(

                    children: [
                      Container(
                        width: getWidth(context) * 25/100,
                        child: Flexible(
                          child: Text(
                            app['title'],style: TextStyle(fontSize: getWidth(context) * 0.035,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: getHeight(context) * 0.010,),
                      Container(
                        width: getWidth(context) * 25/100,
                        child: Text(
                          app['description'],maxLines: 2, textAlign: TextAlign.center,style: TextStyle(height: 1.5, fontSize: getWidth(context) * 0.020,fontWeight: FontWeight.w700),),
                      ),
                      SizedBox(height: getHeight(context) * 0.010,),
                      InkWell(
                        onTap: () => repository.launchUrl(app['url']),
                        child: Container(
                          height: getHeight(context) * 0.21,
                          width: getWidth(context) * 0.42,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(image: AssetImage(app['image'],),fit: BoxFit.cover)

                          ),
                          //child: Image.asset(app['image'],fit: BoxFit.fitWidth,),
                        ),
                      ),


                    ],
                  )
              ),
            ),


          ],
        )
    );
  }
}
