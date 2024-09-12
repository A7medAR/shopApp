import 'package:flutter/material.dart';

class User_Moudel{
  final int id;
  final String name;
  final String phone;
  User_Moudel({
    required this.id,
    required this.name,
    required this.phone,
  });

}

class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel({required this.body,
    required this.image,
    required this.title,
  });
}