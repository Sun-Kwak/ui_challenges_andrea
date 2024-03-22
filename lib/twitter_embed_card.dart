import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_challenges_andrea/content.dart';
import 'package:ui_challenges_andrea/profile.dart';
import 'package:ui_challenges_andrea/svg_icon.dart';

import 'svg_asset.dart';

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage profileImage = const AssetImage("assets/andrea-avatar.png");
    AssetImage contentImage = const AssetImage("assets/media-query-banner.jpg");
    DateTime date = DateTime(2023, 6, 20, 10, 21);
    String name = "Andrea Bizzotto";
    String content = "Did you know?\n\nWhen you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.\n\nBut there's a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇";
    int likes = 997;
    int replies = 12;

    List<SvgIcon> badges = [
      const SvgIcon(
        asset: SvgAsset.heartBlue,
        width: 18,
      ),
      const SvgIcon(
        asset: SvgAsset.verified,
        width: 20,
      ),
    ];
    String handle = "@biz84";
    FollowStatus followStatus = FollowStatus.unfollowed;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        if (maxWidth > 600) {
          maxWidth = 600;
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              Profile(
                maxWidth: maxWidth,
                image: profileImage,
                name: name,
                badges: badges,
                handle: handle,
                followStatus: followStatus,
              ),
              Content(
                maxWidth: maxWidth,
                likes: likes,
                content: content,
                replies: replies,
                image: contentImage,
                date: date,
              ),
            ],
          ),
        );
      },
    );
  }
}
