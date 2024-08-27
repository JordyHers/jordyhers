import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:provider/provider.dart';

class CommunitySection extends StatelessWidget {
  final PlatformView platformView;

  CommunitySection(
    this.platformView, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<WebService>(context);
    final List<Widget> logos = List.generate(
        6,
        (i) => Image.asset(
              'assets/png/pngegg-$i.png',
              scale: 0.8,
              height: switch (platformView) {
                PlatformView.mobile => 30,
                PlatformView.web => 60,
              },
            )).toList();
    final EdgeInsets padding = switch (platformView) {
      PlatformView.mobile => const EdgeInsets.symmetric(
          horizontal: 60.0,
        ),
      PlatformView.web => EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 70,
        ),
    };

    return Padding(
      padding: padding,
      child: Container(
        height: ScreenConfig.getHeightPercentage(context, 75),
        width: ScreenConfig.getWidthPercentage(context, 20),
        child: Column(
          children: [
            SelectableText(
              'Join Our Community',
              style: GoogleFonts.lora(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w700,
                  fontSize: switch (platformView) {
                    PlatformView.mobile => 20,
                    PlatformView.web => 35,
                  }),
            ),
            SizedBox(height: 20),
            SelectableText(
              'Discover our large community of developers on Discord. Join Hackatons,\n'
              'HacktoberFest under JordyHers. Develop Apps for both Android and iOS.',
              style: GoogleFonts.lora(
                fontSize: switch (platformView) {
                  PlatformView.mobile => 14,
                  PlatformView.web => 17,
                },
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
                height: 1.8,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => repository.launchURL(discordLink),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Text(
                  'Join Our Discord',
                  style: GoogleFonts.lora(
                    fontSize: ScreenConfig.getHeightPercentage(context, 1.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              itemCount: logos.length,
              padding: EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (BuildContext ctx, index) {
                return logos[index];
              },
            ),
          ],
        ),
      ),
    );
  }
}
