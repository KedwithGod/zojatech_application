import '../utilities/imports/general_import.dart';

abstract class IProductService {
  Future<List<Product>> fetchProducts();
  Future<Product> getProductDetails(String productId);
  Future<void> addProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(String productId);
}
