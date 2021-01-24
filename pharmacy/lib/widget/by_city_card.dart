import 'package:flutter/material.dart';
import 'package:pharmacy/selected_city.dart';

Widget byCityCard(String city, BuildContext context, String plaque) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectedCity(
            city: city,
            plaque: plaque,
          ),
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Text(
        city,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
