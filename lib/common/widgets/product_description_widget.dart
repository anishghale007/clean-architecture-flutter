import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../color_util.dart';
import 'button_widget.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin, padding;
  final Image leadingImage;
  final Color backgroundColor;
  final String title;
  final Color titleColor;
  final String subTitle1;
  final Color subtitleColor;
  final String subTitle2;
  final String previousPrice;
  final String currentPrice;
  final double buttonRadius;

  const ProductDescriptionWidget({
    Key? key,
    required this.margin,
    required this.padding,
    required this.leadingImage,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
    required this.previousPrice,
    required this.currentPrice,
    required this.backgroundColor,
    required this.buttonRadius,
    required this.titleColor,
    required this.subtitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 310,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: leadingImage,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  subTitle1,
                  style: TextStyle(color: subtitleColor),
                ),
                const SizedBox(height: 5),
                Text(
                  subTitle2,
                  style: TextStyle(color: subtitleColor),
                ),
                const SizedBox(height: 5),
                RatingBar.builder(
                  initialRating: 3,
                  itemSize: 20,
                  minRating: 1,
                  unratedColor: subtitleColor.withOpacity(0.5),
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: .0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
                child: ButtonWidget(
                  buttonText: "Add to cart",
                  backgroundColor: Colors.white,
                  textColor: ColorUtil.kPrimaryColor,
                  radius: buttonRadius,
                  onPress: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 110,
                child: ButtonWidget(
                  buttonText: "Buy",
                  backgroundColor: ColorUtil.kPrimaryColor,
                  textColor: Colors.white,
                  radius: buttonRadius,
                  onPress: () {},
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    previousPrice,
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    currentPrice,
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
