import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_widgets/datadisplay/card/legend_card.dart';
import 'package:legend_design_widgets/datadisplay/stars/legend_stars.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    return LegendRouteBody(
      builder: (context, s) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StarRating(
                  onRatingChanged: (i) => print(i),
                  amount: 5,
                  color: theme.colors.primary,
                  size: 35,
                  spacing: 4,
                ),
                StarRating(
                  onRatingChanged: (i) => print(i),
                  amount: 3,
                  color: Colors.amber,
                  size: 35,
                  spacing: 10,
                ),
                LegendCard(
                  children: [
                    StarRating(
                      onRatingChanged: (i) => print(i),
                      amount: 10,
                      color: Colors.red,
                      size: 35,
                      spacing: 4,
                    )
                  ],
                )
              ],
            )
          ],
        );
      },
    );
  }
}
