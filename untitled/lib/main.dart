import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async {
  runApp(new MaterialApp(
    title: 'quakes',
    home: new Quakes(),

  ));

}