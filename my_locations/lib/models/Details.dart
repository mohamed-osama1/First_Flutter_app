import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_locations/models/MainScreen.dart';
import 'package:my_locations/data/locations.dart';

import 'Location.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  int i;
  locations y;
  Details(int i, locations y) {
    this.i = i;
    this.y = y;
  }

  void _launchURL() async => await canLaunch(y.listobj[i].locationUrl)
      ? await launch(y.listobj[i].locationUrl)
      : throw 'Could not launch $locations[i].locationUrl';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURL,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(y.listobj[i].name),
          ),
          Image(image: NetworkImage(y.listobj[i].imageUrl)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(y.listobj[i].description),
          )
        ],
      ),
    );
  }
}
