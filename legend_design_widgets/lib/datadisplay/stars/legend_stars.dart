import 'package:flutter/material.dart';

typedef void RatingChangeCallback(int rating);

// ignore: must_be_immutable
class StarRating extends StatefulWidget {
  final void Function(int i) onRatingChanged;
  late int rating;
  Color color;
  double size;
  double spacing;
  int amount;

  StarRating({
    required this.onRatingChanged,
    this.rating = 3,
    this.color = Colors.yellow,
    this.size = 35,
    this.spacing = 4,
    this.amount = 5,
  });
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: widget.spacing,
      children: List.generate(
        widget.amount,
        (index) => buildStar(context, index),
      ),
    ));
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= widget.rating) {
      icon = new Icon(
        Icons.star_border,
        color: widget.color,
        size: widget.size,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: widget.color,
        size: widget.size,
      );
    }
    return new GestureDetector(
      onTap: () {
        setState(() {
          widget.rating = index + 1;
        });
        widget.onRatingChanged(index + 1);
      },
      child: icon,
    );
  }
}
