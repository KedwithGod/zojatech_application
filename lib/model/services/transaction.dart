
import '../utilities/imports/general_import.dart';

class TransactionService implements ITransactionService {
  
  @override
  // Fetch transaction list for the logged-in user
  Future<List<Transaction>> fetchTransactionList(String userId) async {
    GeneralResponse response = await networkService.getRequest(
      '$transactionUrl/user/$userId',
      (data) => data,
    );

    // transaction list
    List transactionList =response.data;
    return transactionList.map<Transaction>((item) {
      return Transaction.fromJson(item);
    }).toList();
  }

  @override
  // Fetch transaction detail by transaction ID
  Future<Transaction> getTransactionDetail(String transactionId) async {
    GeneralResponse response = await networkService.getRequest(
      '$transactionUrl/$transactionId',
      (data) => data,
    );

    return Transaction.fromJson(response.data[0]);
  }

  @override
  // Dispute a transaction, or check transaction details
  Future<void> disputeTransaction(String transactionId, String reason) async {
    await networkService.postRequest(
      '$disputeUrl/$transactionId',
      {'reason': reason},
      (data) => data,
    );
  }

  @override
  // Post a new transaction
  Future<Transaction> postTransaction(Transaction transaction) async {
    GeneralResponse response = await networkService.postRequest(
      transactionUrl,
      transaction.toJson(),
      (data) => data,
    );

    return Transaction.fromJson(response.data[0]);
  }
}
