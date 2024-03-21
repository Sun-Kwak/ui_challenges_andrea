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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTop(maxWidth),
            _buildContent(maxWidth),
            _buildInf(maxWidth),
            _buildBottom(maxWidth),
          ],
        ); _buildTop(maxWidth);
      },
    );
  }

  Widget _buildTop(double maxWidth) {
    return Container(
      width: maxWidth,
      height: 50,
      color: Colors.red,
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
      child: Row(
        children: [
        ],
      ),
    );
  }
}
