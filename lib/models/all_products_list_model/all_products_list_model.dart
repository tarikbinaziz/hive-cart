import 'dart:convert';

import 'data.dart';

class AllProductsListModel {
  String? message;
  Data? data;

  AllProductsListModel({this.message, this.data});

  factory AllProductsListModel.fromMap(Map<String, dynamic> data) {
    return AllProductsListModel(
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AllProductsListModel].
  factory AllProductsListModel.fromJson(String data) {
    return AllProductsListModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllProductsListModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
