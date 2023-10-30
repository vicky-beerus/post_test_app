import 'package:post_projects/CONSTANTS/base_url.dart';

import 'package:http/http.dart'as http;
import 'package:post_projects/POST_DETAILS/model/post_detail_model.dart';
import 'dart:convert';

class ProductDetailsRepository {


  getPostDetails({id})async{

    var url = Uri.parse("${BaseUrl.baseUrl}/${id}");
    var result = await http.get(url);
    return PostDetailsModel.fromJson(json.decode(result.body));


  }


}