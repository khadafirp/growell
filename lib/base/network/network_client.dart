import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  NetworkClient._internal();

  Dio? dio;

  // ignore: sort_constructors_first, sort_unnamed_constructors_first
  NetworkClient() {
    dio = Dio(BaseOptions(headers: {}));
  }

  bool canAliceEnabled() {
    return true;
  }

  Dio getClient() {
    return dio!;
  }
}
