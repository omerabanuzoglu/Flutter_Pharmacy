/// [https://app.quicktype.io/]
// To parse this JSON data, do
//
//     final pharmacy = pharmacyFromJson(jsonString);

import 'dart:convert';

Pharmacy pharmacyFromJson(String str) => Pharmacy.fromJson(json.decode(str));

String pharmacyToJson(Pharmacy data) => json.encode(data.toJson());

class Pharmacy {
  Pharmacy({
    this.success,
    this.status,
    this.data,
  });

  bool success;
  String status;
  List<Data> data;

  factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        success: json['success'],
        status: json['status'],
        data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'status': status,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.pharmacyName,
    this.pharmacyDitrict,
    this.pharmacyAddress,
    this.pharmacyPhone,
    this.pharmacyCity,
  });

  String id;
  String pharmacyName;
  String pharmacyDitrict;
  String pharmacyAddress;
  String pharmacyPhone;
  String pharmacyCity;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        pharmacyName: json['eczane_adi'],
        pharmacyDitrict: json['eczane_ilce'],
        pharmacyAddress: json['eczane_adres'],
        pharmacyPhone: json['eczane_telefon'],
        pharmacyCity: json['eczane_il'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'eczane_adi': pharmacyName,
        'eczane_ilce': pharmacyDitrict,
        'eczane_adres': pharmacyAddress,
        'eczane_telefon': pharmacyPhone,
        'eczane_il': pharmacyCity,
      };
}
