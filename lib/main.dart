import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:ui_challenges_andrea/ui_001-twitter_card/svg_asset.dart';
import 'package:ui_challenges_andrea/ui_001-twitter_card/twitter_embed_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SvgAsset.preloadSVGs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 300,
              child: CountdownAndRestart(),
            )
          ),
        ),
      ),
    );
  }
}

/// Main demo UI (countdown + restart button)
class CountdownAndRestart extends StatefulWidget {
  const CountdownAndRestart({super.key});

  @override
  CountdownAndRestartState createState() => CountdownAndRestartState();
}

class CountdownAndRestartState extends State<CountdownAndRestart> with SingleTickerProviderStateMixin{
  static const maxWidth = 300.0;
  late Ticker _ticker;
  int _countdown = 10;

  @override
  void initState() {
    super.initState();
    _ticker = Ticker((elapsed) {
      setState(() {
        _countdown = 10 - elapsed.inSeconds;
        if (_countdown <= 0) {
          _ticker.stop(); // Stop ticker when countdown reaches 0
        }
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void startCountdown() {
    _ticker.stop();
    _ticker.start();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: maxWidth,
          height: maxWidth,
          child: CustomPaint(
            painter: CustomCounterPainter(
              countdown: _countdown,
            ),
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            startCountdown();
          }, // TODO: Implement
          child: const Text(
            'Restart',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class CustomCounterPainter extends CustomPainter {
  final int countdown;

  CustomCounterPainter({ required this.countdown});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final center = size.width / 2;
    final radius = center - paint.strokeWidth / 2;

    // Draw background circle
    paint.color = Colors.grey.withOpacity(0.3);
    canvas.drawCircle(Offset(center, center), radius, paint);

    // Draw countdown text
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '$countdown',
        style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.w500, color: Colors.deepPurple),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(center - textPainter.width / 2, center - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(CustomCounterPainter oldDelegate) {
    return true;
  }
}



