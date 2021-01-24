import 'package:flutter/material.dart';
import 'package:pharmacy/model/cities.dart';
import 'package:pharmacy/model/pharmacy.dart';
import 'package:pharmacy/service/service.dart';
import 'widget/selected_ListView.dart';

// ignore: must_be_immutable
class SelectedCity extends StatefulWidget {
  String city;
  String plaque;
  List<Cities> toCity;
  SelectedCity({
    this.city,
    this.plaque,
    this.toCity,
  });

  @override
  _SelectedCityState createState() => _SelectedCityState();
}

class _SelectedCityState extends State<SelectedCity> {
  final PharmacyService _service = PharmacyService();
  Future<Pharmacy> _future;

  @override
  void initState() {
    _future = _service.getPharmacy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: FutureBuilder<Pharmacy>(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot<Pharmacy> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: FutureBuilder<Pharmacy>(
                  future: _future,
                  builder:
                      (BuildContext context, AsyncSnapshot<Pharmacy> snapshot) {
                    if (snapshot.hasData) {
                      return byCity(
                        snapshot,
                        widget.plaque,
                        widget.toCity,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
