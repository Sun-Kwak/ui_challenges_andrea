import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_challenges_andrea/svg_asset.dart';
import 'package:ui_challenges_andrea/svg_icon.dart';

class Content extends StatelessWidget {
  final double maxWidth;
  final String content;
  final AssetImage image;
  final DateTime date;
  final int likes;
  final int replies;
  const Content({
    required this.likes,
    required this.replies,
    required this.content,
    required this.image,
    required this.date,
    required this.maxWidth,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Column(
        children: [
          _buildContent(maxWidth),
          _buildInf(maxWidth),
        ],
      ),
    );
  }
  Widget _buildContent(double maxWidth) {
    String formattedDate = DateFormat('h:mm a MMM dd, yyyy').format(date);
    return Container(
      width: maxWidth,
      height: 535,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 9),
            child: SelectionArea(child: Align(alignment: Alignment.topCenter, child: Text(content,style: const TextStyle(height: 1.3, fontSize: 18,fontWeight: FontWeight.w400,)))),
          )),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(image: image, fit: BoxFit.cover,),
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formattedDate, style:  TextStyle(color: Colors.black.withOpacity(0.8))),
                const SvgIcon(
                  asset: SvgAsset.info,
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInf(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 70,
      color: Colors.blue,
    );
  }
}
