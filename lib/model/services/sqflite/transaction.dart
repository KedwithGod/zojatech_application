import '../../utilities/imports/general_import.dart';

class TransactionDatabase implements ITransactionDatabase {
  static final TransactionDatabase _instance = TransactionDatabase._internal();
  factory TransactionDatabase() => _instance;
  TransactionDatabase._internal();

  @override
  Future<void> saveTransaction(Transaction transaction) async {
    Database database =await databaseHelper.database;

    await database.insert(
      'transactions',
      transaction.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Transaction>> getTransactions() async {
      Database database = await databaseHelper.database;
  
    final List<Map<String, dynamic>> maps = await database.query('transactions');

    return List.generate(maps.length, (i) {
      return Transaction.fromJson(maps[i]);
    });
  }
}
