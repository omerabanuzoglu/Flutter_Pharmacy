import 'package:flutter/material.dart';
import 'package:pharmacy/model/cities.dart';
import 'package:pharmacy/model/pharmacy.dart';

Widget byCity(AsyncSnapshot<Pharmacy> snapshot, String plaque, List city) {
  final list = snapshot.data.data;
  Cities(city: plaque);

  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: list.length,
    itemBuilder: (context, index) {
      if (list[index].pharmacyCity == plaque) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: Text("ID: " + list[index].id),
            title: Text("Pharmacy Name: " + list[index].pharmacyName),
            subtitle: Text(
              "Pharmacy Address: " + list[index].pharmacyAddress,
            ),
          ),
        );
      } else{
        return Container();
      }
    },
  );
}
