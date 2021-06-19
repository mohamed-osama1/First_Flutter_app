import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_locations/data/locations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  QueryDocumentSnapshot<Object> document;
  Details(QueryDocumentSnapshot<Object> document) {
    this.document = document;
  }

  void _launchURL() async => await canLaunch(document['locationUrl'])
      ? await launch(document['locationUrl'])
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
            child: Text(document['name']),
          ),
          Image(image: NetworkImage(document['imageUrl'])),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(document['description']),
          )
        ],
      ),
    );
  }
}
