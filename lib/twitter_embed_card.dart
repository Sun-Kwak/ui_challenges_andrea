import 'package:flutter/material.dart';

class TwitterEmbed extends StatelessWidget {
  const TwitterEmbed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double maxWidth = constraints.maxWidth;
          if (maxWidth > 640) {
            maxWidth = 640;
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
      ),
    );
  }

  Widget _buildTop(double maxWidth) {
    return Container(
      width: maxWidth * 0.95,
      height: 60,
      color: Colors.red,
    );
  }
  Widget _buildContent(double maxWidth) {
    return Container(
      width: maxWidth * 0.95,
      height: 530,
      color: Colors.green,
    );
  }
  Widget _buildInf(double maxWidth) {
    return Container(
      width: maxWidth * 0.95,
      height: 30,
      color: Colors.blue,
    );
  }
  Widget _buildBottom(double maxWidth) {
    return Container(
      width: maxWidth * 0.95,
      height: 80,
      color: Colors.amber,
    );
  }
}
