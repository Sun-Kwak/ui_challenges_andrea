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

  const Content(
      {required this.likes,
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
    double ratio = 0.227; //30/132
    double height = (((maxWidth)-600) * ratio)+560;
    print(maxWidth);
    print(height);
    return SizedBox(
      width: maxWidth,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 9,right: 16),
            child: SelectionArea(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(content,
                        style: const TextStyle(
                          height: 1.3,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        )))),
          )),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(formattedDate,
                    style: TextStyle(color: Colors.black.withOpacity(0.8))),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          children: [
            const SvgIcon(
              asset: SvgAsset.heartRed,
              width: 20,
            ),
            const SizedBox(width: 8),
            Text(likes.toString(),style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black.withOpacity(0.8), fontSize: 14,),),
            const SizedBox(width: 22),
            const SvgIcon(
              asset: SvgAsset.comment,
              width: 20,
            ),
            const SizedBox(width: 8),
            Text("Reply",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black.withOpacity(0.7), fontSize: 14,),),
            const SizedBox(width: 22),
            const SvgIcon(
              asset: SvgAsset.link,
              width: 20,
            ),
            const SizedBox(width: 8),
            Text("Copy link",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black.withOpacity(0.7), fontSize: 14,),),
          ],
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(maxWidth, 30),
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              side:  BorderSide(color: Colors.black.withOpacity(0.7)), // 테두리 색상
              borderRadius: BorderRadius.circular(16), // 선택적으로 테두리 모양 지정
            ),
          ),
          onPressed: () {},
          child: Text(
            "Read $replies replies",
            style: const TextStyle(fontWeight: FontWeight.w600,color: Color(0xFF3A76D2), fontSize: 14,),
          ),
        ),
      ],
    );
  }
}
