import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_project/pages/auth/login.dart';
import 'package:test_project/core/constants.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/core/routing.dart';
import 'package:test_project/pages/widget/button.dart';
import 'package:test_project/services/product.service.dart';
import 'package:test_project/utils/auth_utils.dart';

class ProductDetails extends StatefulWidget {
  int id;

  ProductDetails(this.id);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool loading = false;
  Map? product;
  @override
  void initState() {
    super.initState();
    getDetailsProduct().then((value) {
      setState(() {});
    });
  }

  Future<void> getDetailsProduct() async {
    Map<String, String> header = {'lang': 'en'};

    var url = Uri.parse(
      base_url + 'api/v1/shop/product/' + widget.id.toString(),
    );
    http.Response res = await http.get(url, headers: header);
    Map response = jsonDecode(res.body);
    print(response);
    product = response['result'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                if (product != null)
                  CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .4,
                    fit: BoxFit.fill,
                    imageUrl: base_download_image +
                        'product/' +
                        product!['product_attribute']['product_info']['images']
                            [0]['imageName'],
                  ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (product != null)
                      for (var item in product!['product_attribute']
                          ['product_info']['images'])
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CachedNetworkImage(
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                            imageUrl: base_download_image +
                                'product/' +
                                item['imageName'],
                          ),
                        ),
                  ],
                ),
              ]),
            ),
          ),
          ButtonWidget(
              callback: () async {
                var token = getToken();
                if (token == null) {
                  Routing.push(context, LoginPage());
                } else {
                  setState(() {
                    loading = true;
                  });
                  final service = ProductService();
                  var res = await service.addToCart(widget.id, 1);
                  setState(() {
                    loading = false;
                  });
                  if (res['result_code'] == 200) {
                    // ignore: use_build_context_synchronously
                    CherryToast.success(
                      title: const Text("Cart"),
                      action: Text(res['result_message']),
                      actionHandler: () {
                        print("Action button pressed");
                      },
                    ).show(context);
                  }else{
                     // ignore: use_build_context_synchronously
                     CherryToast.error(
                      title: const Text("Cart"),
                      action: Text(res['result_message']),
                      actionHandler: () {
                        print("Action button pressed");
                      },
                    ).show(context);
                  }
                }
              },
              title: 'Add To Cart',
              loading: loading)
        ],
      ),
    );
  }
}
