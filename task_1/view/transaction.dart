import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../model/transaction.dart';
import '../view_model/transaction.dart';
import 'shared/generalText.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionViewModel>.reactive(
        viewModelBuilder: () => TransactionViewModel(),
        onViewModelReady: (viewmodel) {},
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const GeneralTextDisplay('Transactions'),
              ),
              body: FutureBuilder<List<Transaction>>(
                future: model.fetchTransactions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: GeneralTextDisplay('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: GeneralTextDisplay('No transactions found.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final transaction = snapshot.data![index];
                        return ListTile(
                          title: GeneralTextDisplay(transaction.description),
                          subtitle: GeneralTextDisplay(transaction.date),
                          trailing: GeneralTextDisplay('\$${transaction.amount}'),
                        );
                      },
                    );
                  }
                },
              ),
            ));
  }
}
