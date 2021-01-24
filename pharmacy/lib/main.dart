import 'package:flutter/material.dart';
import 'package:pharmacy/model/pharmacy.dart';
import 'package:pharmacy/service/service.dart';
import 'package:pharmacy/widget/main_card.dart';
import 'package:pharmacy/widget/my_app_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Pharmacy",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: myAppBar(context),
      body: Container(
        child: FutureBuilder<Pharmacy>(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot<Pharmacy> snapshot) {
            if (snapshot.hasData) {
              return buildListView(snapshot);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
