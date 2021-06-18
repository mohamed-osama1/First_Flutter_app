import 'package:flutter/material.dart';

import 'package:my_locations/data/locations.dart';
import 'package:my_locations/models/Details.dart';
import 'package:my_locations/models/MyForm.dart';

import 'Location.dart';

class MainScreen extends StatefulWidget {
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  locations y = new locations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Locations")),
        body: ListView.builder(
            itemCount: y.listobj.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Card(
                  child: Wrap(
                    children: <Widget>[
                      Image(image: NetworkImage(y.listobj[index].imageUrl)),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Details(index, y),
                              //y.listobj.indexOf(y.listobj[index])
                            ),
                          );
                        },
                        title: Text(y.listobj[index].name),
                        subtitle: Text(y.listobj[index].theme),
                      ),
                    ],
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Location result = await Navigator.push(
                context, new MaterialPageRoute(builder: (context) => MyForm()));

            setState(() {
              y.listobj.add(result);
            });
          },
        ));
  }
}
