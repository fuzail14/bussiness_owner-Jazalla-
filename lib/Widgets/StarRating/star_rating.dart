import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  //final RatingChangeCallback onRatingChanged;
  final Color color;

  const StarRating(
      {super.key,
      this.starCount = 5,
      this.rating = .0,
      //required this.onRatingChanged,
      required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: HexColor('#E3E1E4'),
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(Icons.star_half, color: color);
    } else {
      icon = Icon(Icons.star, color: color);
    }
    return InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
