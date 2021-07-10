import 'package:flutter/material.dart';
import '../helpers/size_config.dart';

class BackgroundOneWidget extends StatelessWidget {
  final bool inverted;
  final List<Color> featureColors;
  final List<Color> containerColors;
  BackgroundOneWidget({
    this.featureColors = const [],
    this.containerColors = const [],
    this.inverted = false,
  });

  List<Color> _getDefaultColors(BuildContext context) {
    List<Color> defaultColors = [
      Theme.of(context).primaryColor,
      Theme.of(context).highlightColor,
    ];

    return defaultColors;
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomLeft,
              colors: containerColors.length < 2
                  ? _getDefaultColors(context)
                  : this.containerColors,
            ),
          ),
        ),
        ClipPath(
          clipper: WaveClipper(isInverted: inverted),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: featureColors.length < 2
                    ? _getDefaultColors(context)
                    : this.featureColors,
              ),
            ),
            height: sizeConfig.safeBlockVertical * 80.0,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  bool _isInverted = false;

  WaveClipper({
    bool isInverted = false,
  }) {
    this._isInverted = isInverted;
  }

  @override
  Path getClip(Size size) {
    var path = Path();

    var firstStart;
    var firstEnd;
    var secondStart;
    var secondEnd;

    if (!_isInverted) {
      path.lineTo(0.0, size.height * 0.375);

      var firstStart = Offset(size.width / 3.0, size.height * 0.3125);
      var firstEnd = Offset(size.width * 0.5, size.height * 0.6875);

      var secondStart = Offset(
          size.width - size.width / 3.0, size.height + size.height * 0.03125);
      var secondEnd = Offset(size.width, size.height * 0.96875);

      path.quadraticBezierTo(
          firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

      path.quadraticBezierTo(
          secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

      path.lineTo(size.width, 0.0);
    } else {
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width, size.height * 0.375);

      var firstStart =
          Offset(size.width - size.width / 3.0, size.height * 0.3125);
      var firstEnd = Offset(size.width * 0.5, size.height * 0.6875);

      var secondStart =
          Offset(size.width / 3.0, size.height + size.height * 0.03125);
      var secondEnd = Offset(0.0, size.height * 0.96875);

      path.quadraticBezierTo(
          firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
      path.quadraticBezierTo(
          secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

      path.lineTo(0.0, size.height);
    }

    //path.lineTo(size.width, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
