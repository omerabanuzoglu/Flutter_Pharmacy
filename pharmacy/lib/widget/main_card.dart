import 'package:flutter/material.dart';
import 'package:pharmacy/model/pharmacy.dart';

ListView buildListView(AsyncSnapshot<Pharmacy> snapshot) {
  final list = snapshot.data.data;
  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: list.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Text("ID: " + list[index].id),
          title: Text("Pharmacy Name: " + list[index].pharmacyName),
          subtitle: Text("Pharmacy Address: " + list[index].pharmacyAddress),
        ),
      );
    },
  );
}
