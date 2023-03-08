import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentStateNotifierProvider =
    StateNotifierProvider<PaymentStateNotifier, String>(
        (ref) => PaymentStateNotifier());

class PaymentStateNotifier extends StateNotifier<String> {
  PaymentStateNotifier() : super("");

  void updateBankAccount(String account) {
    state = account;
  }
}
