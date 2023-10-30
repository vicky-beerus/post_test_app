import 'package:flutter/material.dart';


import '../CONSTANTS/app_colors.dart';
import 'custom_text.dart';





class CustomAppBar extends StatelessWidget {
  String? txt;
  List<Widget>? act;
  Widget? lead;
  double? lW,txtSize;


  CustomAppBar({this.txt,this.act,this.lead,this.lW,this.txtSize});


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AppBar(
        leadingWidth:lW ,
     elevation: 0,

        centerTitle: true,
        // backgroundColor: AppColors.primaryColor,
        shape: Border(
          bottom: BorderSide(color: AppColors.textGery.withOpacity(0.5))
        ),

        leading: lead ?? InkWell(onTap: (){
          Navigator.pop(context);
        },child:   Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.arrow_back_ios,

              ),
            ),
          ),
        ),),
        title: CustomText(txt:txt ?? "", size:txtSize ,fontWeight: FontWeight.w600),
        actions: act ?? [

        ]


    );
  }



}
