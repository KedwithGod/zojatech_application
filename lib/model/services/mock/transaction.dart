import '../../utilities/imports/general_import.dart';

class MockTransactionService implements ITransactionService {
  @override
  Future<List<Transaction>> fetchTransactionList(String userId) async {
    return [
      Transaction(
          id: 'mock1',
          userId: userId,
          amount: 50.0,
          description: 'Mock Transaction',
          date: DateTime.now())
    ];
  }

  @override
  Future<Transaction> getTransactionDetail(String transactionId) async {
    return Transaction(
        id: transactionId,
        userId: 'mockUser',
        amount: 50.0,
        description: 'Mock Transaction Detail',
        date: DateTime.now());
  }

  @override
  Future<void> disputeTransaction(String transactionId, String reason) async {
    // Mock dispute logic
  }

  @override
  Future<Transaction> postTransaction(Transaction transaction) async {
    return Transaction(
        id: 'mock2',
        userId: transaction.userId,
        amount: transaction.amount,
        description: transaction.description,
        date: DateTime.now());
  }
}
