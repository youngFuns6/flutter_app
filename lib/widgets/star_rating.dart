import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int count;
  final double rating;
  final int maxRating;
  final double size;
  final Color color;
  final Color solidColor;
  final Widget imageIcon;
  final Widget solidImageIcon;

  StarRating({
    this.count = 5,
    required this.rating,
    required this.maxRating,
    required this.size,
    this.color = const Color(0xffbbbbbb),
    this.solidColor = const Color(0xffff8800),
    Widget? imageIcon,
    Widget? solidImageIcon,
  }): imageIcon = imageIcon ?? Icon(
    Icons.star_border,
    color: color,
    size: size,
  ),solidImageIcon = solidImageIcon ?? Icon(
    Icons.star,
    color: solidColor,
    size: size,
  );

  @override
  State<StarRating> createState() => _StartsState();
}

class _StartsState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BuildStarRating(
        count: widget.count,
        rating: widget.rating,
        maxRating: widget.maxRating,
        size: widget.size,
        color: widget.color,
        solidColor: widget.solidColor,
        imageIcon: widget.imageIcon,
        solidImageIcon: widget.solidImageIcon,
      ),
    );
  }
}

class BuildStarRating extends StatelessWidget {
  // const BuildUnSelectStar({Key? key}) : super(key: key);
  final bool solid;
  final int count;
  final double rating;
  final int maxRating;
  final double size;
  final Color color;
  final Color solidColor;
  final Widget imageIcon;
  final Widget solidImageIcon;

  const BuildStarRating(
      {this.solid = false,
        required this.count,
        required this.rating,
        required this.maxRating,
        required this.size,
        required this.color,
        required this.solidColor,
        required this.imageIcon,
        required this.solidImageIcon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(count, (index) {
            return imageIcon;
          }),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: getSolidStars(),
        )
      ],
    );
  }

  getSolidStars() {
    final List<Widget> stars = [];
    final Widget star = solidImageIcon;
    double oneValue = maxRating / count;
    int entireCount = (rating / oneValue).floor();
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    final double clipValue = (rating / oneValue - entireCount) * size;

    final halfStar = ClipRect(
      clipper: StarClip(clipValue),
      child: star,
    );
    stars.add(halfStar);

    if(stars.length > count){
      return stars.sublist(0, count);
    }
    return stars;
  }
}

class StarClip extends CustomClipper<Rect> {
  double width;

  StarClip(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(StarClip oldClipper) {
    return oldClipper.width != width;
  }
}