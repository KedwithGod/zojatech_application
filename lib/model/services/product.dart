import '../utilities/imports/general_import.dart';

class ProductService implements IProductService {
  @override
  Future<List<Product>> fetchProducts() async {
    GeneralResponse response = await networkService.getRequest(
      fetchProductUrl,
      (data) => data,
    );

    // response.data is a List of Maps representing each product
    List productList =response.data[0];
    List<Product> products = productList.map<Product>((item) {
      return Product.fromJson(item);
    }).toList();

    return products;
  }

  @override
  Future<Product> getProductDetails(String productId) async {
    GeneralResponse response = await networkService.getRequest(
      "$getProductDetailsUrl/$productId",
      (data) => (data),
    );
    Product $product = Product.fromJson(response.data[0]);
    return $product;
  }

  @override
  Future<void> addProduct(Product product) async {
    await networkService.postRequest(
      loginUrl,
      product.toJson(),
      (data) => (data),
    );
  }

  @override
  Future<Product> updateProduct(Product product) async {
     GeneralResponse response = await networkService.postRequest(
      loginUrl,
      product.toJson(),
      (data) => (data),
    );
    Product $product = Product.fromJson(response.data[0]);
    return $product;
  }

  @override
  Future<void> deleteProduct(String productId) async {
    await networkService.deleteRequest(
      "$deleteProductUrl/$productId",
      (data) => (data),
    );
  
  }
}
