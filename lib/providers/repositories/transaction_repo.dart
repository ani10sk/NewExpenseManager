import 'package:flutter/material.dart';
import '../models/normal_transaction.dart';
import '../models/benefactor_transaction.dart';

class TransactionRepo extends ChangeNotifier {
  List<NormalTransaction> normalTransactions = [];
  List<BenefactorTransaction> benefactorTransactions = [];
}
