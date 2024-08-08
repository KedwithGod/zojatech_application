import 'package:flutter_test/flutter_test.dart';
import 'package:zojatech_app/model/utilities/imports/general_import.dart';
// Adjust the import path as needed

void main() {
  late IProductService productService;

  setUp(() {
    productService = MockProductService();
  });

  test('Fetch products', () async {
 

    // Act
    List<Product> products = await productService.fetchProducts();

    // Assert
    expect(products, isNotEmpty);
    expect(products.length, 2);
    expect(products[0].name, 'Mock Product 1');
  });

  test('Get product details', () async {
    // Arrange
    String productId = '1';

    // Act
    Product product = await productService.getProductDetails(productId);

    // Assert
    expect(product.id, productId);
    expect(product.name, 'Mock Product');
  });

  test('Add product', () async {
    // Arrange
    Product newProduct = Product(
      id: '3',
      name: 'New Mock Product',
      description: 'Description for New Mock Product',
      price: 39.99,
      imageUrl: 'http://example.com/new_mock_product.jpg',
    );

    await productService.addProduct(newProduct);

    // Assert
    // No specific assertion for addProduct as it's mocked
  });

  test('Update product', () async {
    // Arrange
    Product updatedProduct = Product(
      id: '1',
      name: 'Updated Mock Product',
      description: 'Updated Description for Mock Product',
      price: 24.99,
      imageUrl: 'http://example.com/updated_mock_product.jpg',
    );

    Product product = await productService.updateProduct(updatedProduct);

    // Assert
    expect(product.name, 'Updated Mock Product');
    expect(product.price, 24.99);
  });

  test('Delete product', () async {
    // Arrange
    String productId = '1';
    await productService.deleteProduct(productId);

    // Assert
    // No specific assertion for deleteProduct as it's mocked
  });
}
