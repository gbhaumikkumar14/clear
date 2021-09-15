
import 'package:flutter/material.dart';

class PageModel {
  RichText title;
  RichText? desc;
  String? image;

  PageModel({required this.title, this.desc, this.image});

  RichText getTitle() {
    return title;
  }

  RichText? getDesc() {
    return desc;
  }

  String? getImage(){
    return image;
  }
}