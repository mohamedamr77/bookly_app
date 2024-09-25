import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl({required String url,required BuildContext context })async{
  final Uri parsedUrl  = Uri.parse(url);
 if (url!=null){
   if (await canLaunchUrl(parsedUrl)) {
     !await launchUrl(parsedUrl);
   }
   else{
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: GText(color: Colors.black,content: "The Url is not available", fontSize: 0.05))
     );
   }
 }
}