import '../model/transaction.dart';
import 'basemodel.dart';

class TransactionViewModel extends BaseModel {
  // fetch transaction list
  Future<List<Transaction>> fetchTransactions() async {
    // Simulate network call
    await Future.delayed(const Duration(seconds: 2));
    return [
      Transaction(description: 'Groceries', date: '2024-05-01', amount: 50.0),
      Transaction(description: 'Rent', date: '2024-05-01', amount: 1000.0),
      // More transactions...
    ];
  }
}
