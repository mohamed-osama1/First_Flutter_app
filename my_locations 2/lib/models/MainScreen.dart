import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_locations/models/Details.dart';
import 'package:my_locations/models/MyForm.dart';

class MainScreen extends StatefulWidget {
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Locations")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('locations').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.docs.map((document) {
              return Container(
                child: Card(
                  child: Wrap(
                    children: <Widget>[
                      Image(image: NetworkImage(document['imageUrl'])),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Details(document),
                            ),
                          );
                        },
                        title: Text(document['name']),
                        subtitle: Text(document['theme']),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic> result = await Navigator.push(
              context, new MaterialPageRoute(builder: (context) => MyForm()));

          setState(() {
            FirebaseFirestore.instance.collection('locations').add(result);
          });
        },
      ),
    );
  }
}
