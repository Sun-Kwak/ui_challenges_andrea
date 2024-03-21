import 'package:flutter/material.dart';
import 'package:ui_challenges_andrea/svg_asset.dart';
import 'package:ui_challenges_andrea/svg_icon.dart';

class Profile extends StatelessWidget {
  final double maxWidth;
  final AssetImage image;
  final String name;
  final List<SvgIcon> badges;
  final String handle;
  final FollowStatus followStatus;

  const Profile({
    required this.maxWidth,
    required this.image,
    required this.name,
    required this.badges,
    required this.handle,
    required this.followStatus,
    super.key});

  @override
  Widget build(BuildContext context) {
    double gap = 5;
    return SizedBox(
        width: maxWidth,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: image,
            ),
            Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                    children: [
                    Text(name, style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(width: gap),
                for (int i = 0; i < badges.length; i++)
            Row(
              children: [
                badges[i],
                SizedBox(width: gap),
              ],
            ),
          ],
        ),
        const SizedBox(height: 3),
        Row(
            children: [
            Text(handle,
            style:  TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.8))),
        SizedBox(width: gap),
        Container(
          width: 1,
          height: 1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black, // 원형 점의 색상 설정
          ),
        ),
        SizedBox(width: gap),
        followStatus == FollowStatus.following ?
        const Text('UnFllow') : const Text('Follow',
            style: TextStyle(color: Color(0xFF3A76D2), fontWeight: FontWeight.bold)),
    ]
    )
    ]
    ),
    ),
    const Spacer(),
    const Padding(
    padding: EdgeInsets.only(top: 3),
    child: SvgIcon(
    asset: SvgAsset.x,
    height: 23,
    ),
    ),

    ],
    )
    );
    }
}

enum FollowStatus {
  following,
  unfollowed,
}
