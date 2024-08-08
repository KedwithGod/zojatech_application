import '../utilities/imports/general_import.dart';

abstract class ITransactionService {
  Future<List<Transaction>> fetchTransactionList(String userId);
  Future<Transaction> getTransactionDetail(String transactionId);
  Future<void> disputeTransaction(String transactionId, String reason);
  Future<Transaction> postTransaction(Transaction transaction);
}
