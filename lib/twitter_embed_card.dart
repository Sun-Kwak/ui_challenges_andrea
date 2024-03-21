import 'package:flutter/material.dart';
import 'package:ui_challenges_andrea/profile.dart';
import 'package:ui_challenges_andrea/svg_icon.dart';

import 'svg_asset.dart';

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage image = const AssetImage("assets/andrea-avatar.png");
    String name = "Andrea Bizzotto";
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Profile(
              maxWidth: maxWidth,
              image: image,
              name: name,
              badges: badges,
              handle: handle,
              followStatus: followStatus,
            ),
            _buildContent(maxWidth),
            _buildInf(maxWidth),
            _buildBottom(maxWidth),
          ],
        );
      },
    );
  }

  Widget _buildContent(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 500,
      color: Colors.green,
    );
  }

  Widget _buildInf(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 50,
      color: Colors.blue,
    );
  }

  Widget _buildBottom(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 55,
      color: Colors.amber,
      child: const Row(
        children: [],
      ),
    );
  }
}
