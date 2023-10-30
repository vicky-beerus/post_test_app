

import 'package:http/http.dart' as http;
import 'package:post_projects/CONSTANTS/base_url.dart';
import 'package:post_projects/HOME_PAGE/model/home_model.dart';
import 'dart:convert';

class HomeRepository {

  List<HomeModel> homeModelList = [];


  getPosts()async{
    var url = Uri.parse(BaseUrl.baseUrl);
    var result = await http.get(url);
    var decodeData = json.decode(result.body);
    decodeData.forEach((e){
      homeModelList.add(HomeModel.fromJson(e));
    });
    return homeModelList;
  }


}