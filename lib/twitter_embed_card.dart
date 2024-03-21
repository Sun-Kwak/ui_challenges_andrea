import 'package:flutter/material.dart';

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        if (maxWidth > 600) {
          maxWidth = 600;
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTop(maxWidth),
                _buildContent(maxWidth),
                _buildInf(maxWidth),
                _buildBottom(maxWidth),
              ],
            ),
          ),
        ); _buildTop(maxWidth);
      },
    );
  }

  Widget _buildTop(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 60,
      color: Colors.red,
    );
  }
  Widget _buildContent(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 530,
      color: Colors.green,
    );
  }
  Widget _buildInf(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 30,
      color: Colors.blue,
    );
  }
  Widget _buildBottom(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 80,
      color: Colors.amber,
      child: Row(
        children: [
          Icon(Icons.favorite_rounded),
          Icon(Icons.info_outlined),
          Icon(Icons.verified),
          Icon(Icons.messenger_outline_sharp),
          Icon(Icons.insert_link_outlined),
        ],
      ),
    );
  }
}
