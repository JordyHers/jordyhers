import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  final bool isMobile;

  LogoSection({Key? key, required this.isMobile}) : super(key: key);

  final List<Widget> logos =
      List.generate(12, (i) => Image.asset('assets/png/pngegg-$i.png'))
          .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMobile
          ? const EdgeInsets.symmetric(
              horizontal: 60.0,
            )
          : const EdgeInsets.symmetric(horizontal: 300.0, vertical: 50),
      child: SizedBox(
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: logos.length,
            itemBuilder: (BuildContext ctx, index) {
              return logos[index];
            }),
      ),
    );
  }
}
