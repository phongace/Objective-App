import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String get token => _token;

  String _token;

  bool get isLogged => _isLogged;

  bool _isLogged = false;
}
