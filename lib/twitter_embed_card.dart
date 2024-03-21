import 'package:flutter/material.dart';

class TwitterEmbed extends StatelessWidget {
  const TwitterEmbed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double maxWidth = constraints.maxWidth;
              if (maxWidth > 640) {
                maxWidth = 640;
              } else {
                maxWidth = constraints.maxWidth;
              }
              return _buildTop(maxWidth);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTop(double maxWidth) {
    return Container(
      width: maxWidth*0.95,
      color: Colors.red,
    );
  }
}
