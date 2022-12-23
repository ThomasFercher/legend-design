import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_core/widgets/elevation/animated_card.dart';
import 'package:legend_design_core/widgets/elevation/elevated_card.dart';
import 'package:legend_design_widgets/datadisplay/card/image_card.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    return LegendRouteBody(
      builder: ((context, s) {
        return Container(
          child: Column(
            children: [
              LegendText(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                style: theme.typography.h1,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: ImageCard(
                  imagePath: "assets/photos/larrylegend.png",
                  title: "Test",
                  description: "tEst",
                  onClick: () {
                    print("Clicked");
                  },
                ),
              ),
              AnimatedCard(
                background: Colors.white,
                elevation: 1,
                padding: EdgeInsets.all(16),
                child: Text("test"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
