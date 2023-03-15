import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_project/core/constants.dart';
import 'package:test_project/utils/auth_utils.dart';
class ProductService{
  Future<Map> addToCart(int productId,int quantity)async{
    Map<String,String> header={
      'lang':'en',
      'authorization':'Bearer '+getToken()!
    };
    Map body={
        "shop_productId":productId.toString(),
        "quantity":quantity.toString()
    };
 http.Response response=await http.post(Uri.parse(baseApiUrl+'user/cart'),body: body,
                  headers: header);
                   var res=jsonDecode(response.body);
                   print(res);
                    return res;
                         
  }
  }