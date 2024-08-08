

import '../../utilities/imports/general_import.dart';


class MockProductService implements IProductService {
  @override
  Future<List<Product>> fetchProducts() async {
    return [
      Product(
        id: '1',
        name: 'Mock Product 1',
        description: 'Description for Mock Product 1',
        price: 19.99,
        imageUrl: 'http://example.com/mock_product_1.jpg',
      ),
      Product(
        id: '2',
        name: 'Mock Product 2',
        description: 'Description for Mock Product 2',
        price: 29.99,
        imageUrl: 'http://example.com/mock_product_2.jpg',
      ),
    ];
  }

  @override
  Future<Product> getProductDetails(String productId) async {
    return Product(
      id: productId,
      name: 'Mock Product',
      description: 'Description for Mock Product',
      price: 19.99,
      imageUrl: 'http://example.com/mock_product.jpg',
    );
  }

  @override
  Future<void> addProduct(Product product) async {
    // Mock add product logic
  }

  @override
  Future<Product> updateProduct(Product product) async {
    return product; // Return the same product as mock updated product
  }

  @override
  Future<void> deleteProduct(String productId) async {
    // Mock delete product logic
  }
}

