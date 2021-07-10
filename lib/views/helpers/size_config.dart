import 'package:flutter/widgets.dart';

class SizeConfig {
  MediaQueryData _mediaQueryData = MediaQueryData();
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  double _blockSizeHorizontal = 0.0;
  double _blockSizeVertical = 0.0;

  double _safeAreaHorizontal = 0.0;
  double _safeAreaVertical = 0.0;
  double _safeBlockHorizontal = 0.0;
  double _safeBlockVertical = 0.0;

  MediaQueryData get mediaQueryData {
    return _mediaQueryData;
  }

  double get screenWidth {
    return _screenWidth;
  }

  double get screenHeight {
    return _screenHeight;
  }

  double get blockSizeHorizontal {
    return _blockSizeHorizontal;
  }

  double get blockSizeVertical {
    return _blockSizeVertical;
  }

  double get safeAreaHorizontal {
    return _safeAreaHorizontal;
  }

  double get safeAreaVertical {
    return _safeAreaVertical;
  }

  double get safeBlockHorizontal {
    return _safeBlockHorizontal;
  }

  double get safeBlockVertical {
    return _safeBlockVertical;
  }

  SizeConfig(BuildContext context) {
    double mediaQueryPaddingHorizontal;
    double mediaQueryPaddingVertical;
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    mediaQueryPaddingHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    mediaQueryPaddingVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    _safeAreaHorizontal = _screenWidth - mediaQueryPaddingHorizontal;
    _safeAreaVertical = _screenHeight - mediaQueryPaddingVertical;

    _safeBlockHorizontal = (_screenWidth - mediaQueryPaddingHorizontal) / 100;
    _safeBlockVertical = (_screenHeight - mediaQueryPaddingVertical) / 100;

    print('_safeAreaHorizontal ' + _safeAreaHorizontal.toString());
    print('_safeAreaVertical ' + _safeAreaVertical.toString());
    print('safeBlockHorizontal ' + _safeBlockHorizontal.toString());
    print('safeBlockVertical ' + _safeBlockVertical.toString());
  }
}
