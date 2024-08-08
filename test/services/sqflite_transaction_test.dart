import 'package:flutter_test/flutter_test.dart';

import 'package:zojatech_app/model/utilities/imports/general_import.dart';
// Adjust the import path as needed

void main() {
 late ITransactionDatabase transactionDatabase;

  setUpAll(() {
    // Initialize sqflite for testing
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() {
    transactionDatabase = TransactionDatabase();
  });

  test('Save and retrieve transactions', () async {
    // Arrange
    final transaction = Transaction(
      id: 'test1',
      userId: 'user1',
      amount: 100.0,
      description: 'Test Transaction',
      date: DateTime.now(),
    );

    // Act
    await transactionDatabase.saveTransaction(transaction);
    final transactions = await transactionDatabase.getTransactions();

    // Assert
    expect(transactions, isNotEmpty);
    expect(transactions[0].id, 'test1');
    expect(transactions[0].amount, 100.0);
    expect(transactions[0].description, 'Test Transaction');
  });
}
