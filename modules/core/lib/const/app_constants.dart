import 'package:flutter/material.dart';

@immutable
final class AppConstants {
  const AppConstants._();
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/';
  static const sendTimeout = 60;
  static const connectTimeout = 60;
  static const receiveTimeout = 60;
}

const kZero = 0;
