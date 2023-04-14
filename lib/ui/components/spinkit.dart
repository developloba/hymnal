import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final spinkit = SpinKitThreeBounce(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: index.isEven ? Colors.grey : Colors.grey,
          shape: index.isEven ? BoxShape.circle : BoxShape.circle),
    );
  },
);
