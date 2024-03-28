// ignore: file_names
import 'package:flutter/material.dart';

class MapImage extends StatelessWidget {
  const MapImage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double w = 640.0;
    double h = 360.0;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image(
                image: const AssetImage('assets/Images/mapimage.jpg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
