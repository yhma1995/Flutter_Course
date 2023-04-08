import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/constants.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/core/routing.dart';
import 'package:test_project/core/text_theme.dart';
import 'package:test_project/pages/product/details.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List products = [];

  @override
  void initState() {
    super.initState();
    getProducts().then((value) {
      setState(() {});
    });
  }

  Future<void> getProducts() async {
    Map<String, String> header = {'lang': 'en'};

    Map<String, String> query = {
      'page': '1',
      'limit': '20',
      'sort_by': 'new',
      'inventory': '1'
    };

    var url = Uri.parse(
      base_url + 'api/v1/shop/product',
    ).replace(queryParameters: query);
    http.Response res = await http.get(url, headers: header);
    Map response = jsonDecode(res.body);
    products = response['result'];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () =>
              CustomRouting.push(context, ProductDetails(products[index]['id'])),
          child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      /*
               Image.network(base_download_image+'product/'+products[index]['product_attribute']['product_info']['images'][0]['imageName'],
                   width: MediaQuery.of(context).size.width,height: 200,fit: BoxFit.cover,),

                  */

                      CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: base_download_image +
                            'product/' +
                            products[index]['product_attribute']['product_info']
                                ['images'][0]['imageName'],
                      ),
                      if (products[index]['discount'] != null)
                        Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 23,
                            child: Center(
                              child: Text(
                                  '%' + products[index]['discount'].toString(),
                                  style: CustomTextStyle.header
                                      .copyWith(color: Colors.red)),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        products[index]['product_attribute']['product_info']
                            ['name'],
                        style: CustomTextStyle.header),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        products[index]['product_attribute']['product_info']
                            ['description'],
                        style: CustomTextStyle.subtitle),
                  ),
                  Text(
                    products[index]['price'].toString(),
                    style: CustomTextStyle.header
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ],
              )),
        );
      },
    );
  }
}
