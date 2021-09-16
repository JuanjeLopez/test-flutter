import 'package:http/http.dart' as http;
import 'package:shopx/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client
        .get(Uri.parse('https://appshop.juanjelopezportfolio.es/api/products'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  
}
