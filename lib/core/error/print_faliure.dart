import 'package:flutter/cupertino.dart';

class PrintFailure{

 static errorMessage({required String? message}){
    debugPrint(message);
  }
}