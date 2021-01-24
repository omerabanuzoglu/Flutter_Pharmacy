import 'package:flutter/material.dart';
import '../by_city.dart';

AppBar myAppBar(BuildContext context) {
  return AppBar(
    title: Text("Pharmacy"),
    backgroundColor: Colors.red,
    actions: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ByCity()),
          );
        },
        child: Icon(
          Icons.map,
          size: 28,
        ),
      ),
      SizedBox(
        width: 20,
      ),
    ],
  );
}
