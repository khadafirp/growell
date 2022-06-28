import 'package:flutter/material.dart';

class AddUserModel {
  AddUserEntity? entity;
  AddUserModel({
    this.entity
  });

  factory AddUserModel.fromJson(dynamic json){
    return AddUserModel(
      entity: AddUserEntity(
        statusCode: json["statusCode"],
        message: json['message'],
        data: json['data']
      )
    ); 
  }
}

class AddUserEntity {
  int? statusCode;
  String? message;
  dynamic data;

  AddUserEntity(
    {
      this.statusCode,
      this.message,
      this.data
    }
  );
}