import '../utilities/imports/general_import.dart';

abstract class ITransactionDatabase {
  Future<void> saveTransaction(Transaction transaction);
  Future<List<Transaction>> getTransactions();
}
