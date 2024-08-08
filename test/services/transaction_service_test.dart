import 'package:flutter_test/flutter_test.dart';
import 'package:zojatech_app/model/utilities/imports/general_import.dart';


void main() {
  late ITransactionService transactionService;

  setUp(() {
    transactionService = MockTransactionService();
  });

  test('Fetch transaction list', () async {
    // Act
    List<Transaction> transactions =
        await transactionService.fetchTransactionList('mockUserId');

    // Assert
    expect(transactions.isNotEmpty, true);
    expect(transactions.first.userId, 'mockUserId');
    expect(transactions.first.amount, 50.0);
  });

  test('Fetch transaction detail', () async {
    // Act
    Transaction transaction =
        await transactionService.getTransactionDetail('mockTransactionId');

    // Assert
    expect(transaction.id, 'mockTransactionId');
    expect(transaction.amount, 50.0);
  });

  test('Post transaction', () async {
    // Arrange
    Transaction newTransaction = Transaction(
      id: 'mockTransactionId',
      userId: 'mockUserId',
      amount: 99.99,
      description: 'Mock Transaction',
      date: DateTime.now(),
    );

    // Act
    Transaction postedTransaction =
        await transactionService.postTransaction(newTransaction);

    // Assert
    expect(postedTransaction.id,
        'mock2'); // ID is 'mock2' as per the mock implementation
    expect(postedTransaction.userId, 'mockUserId');
    expect(postedTransaction.amount, 99.99);
  });
}
