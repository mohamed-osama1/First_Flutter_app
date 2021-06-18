import 'package:flutter/material.dart';

import 'package:my_locations/models/Location.dart';
import 'package:my_locations/data/locations.dart';

class MyForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController theme = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  TextEditingController locationUrl = TextEditingController();

  locations y = new locations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Location name'),
                controller: name,

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Theme'),
                controller: theme,

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Full description'),
                controller: description,

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Image URL'),
                controller: imageUrl,

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Location URL'),
                controller: locationUrl,

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: ElevatedButton(
                onPressed: () {
                  print(y.listobj.length + 1);
                  print(name.text.toString());
                  print(description.text.toString());
                  print(theme.text.toString());
                  print(imageUrl.text.toString());
                  print(locationUrl.text.toString());

                  Location newloc = new Location(
                    id: y.listobj.length + 1,
                    name: name.text.toString(),
                    description: description.text.toString(),
                    theme: theme.text.toString(),
                    imageUrl: imageUrl.text.toString(),
                    locationUrl: locationUrl.text.toString(),
                  );

                  Navigator.pop(context, newloc);

                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
