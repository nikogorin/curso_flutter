import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-666-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;
  final _storage = new FlutterSecureStorage();
  bool isLoading = true;
  bool isSaving = false;
  File? newPictureFile;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    try {
      final url = Uri.https(_baseUrl, 'products.json',
          {'auth': await _storage.read(key: 'token') ?? ''});
      final response = await http.get(url);
      final Map<String, dynamic> productsMap = json.decode(response.body);

      productsMap.forEach((key, value) {
        final tempProduct = Product.fromJson(value);
        tempProduct.id = key;
        products.add(tempProduct);
      });

      isLoading = false;
      notifyListeners();
      return products;
    } catch (e) {
      print(e);

      isLoading = false;
      return products;
    }
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      createProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json',
        {'auth': await _storage.read(key: 'token') ?? ''});
    final response = await http.put(url, body: product.toRawJson());

    final decodedData = response.body;

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id;
  }

  Future createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json',
        {'auth': await _storage.read(key: 'token') ?? ''});
    final response = await http.post(url, body: product.toRawJson());
    final decodedData = json.decode(response.body);

    product.id = decodedData['name'];

    products.add(product);
    notifyListeners();

    return product.id;
  }

  void updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/samuofthepp/image/upload?upload_preset=flutter-preset');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    if (response.statusCode != 200 && response.statusCode != 201) {
      print('Algo salio mal');
      print(response.body);
      return null;
    }

    newPictureFile = null;

    final decodedData = json.decode(response.body);
    return decodedData['secure_url'];
  }
}
