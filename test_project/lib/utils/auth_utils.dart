import 'package:hive/hive.dart';

String? getToken() {
  var hive = Hive.box('shop');
  var token = hive.get('token', defaultValue: null);
  return token;
}
