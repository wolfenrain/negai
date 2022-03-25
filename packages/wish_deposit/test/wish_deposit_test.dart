// ignore_for_file: prefer_const_constructors
import 'package:deposit/deposit.dart';
import 'package:test/test.dart';
import 'package:wish_deposit/wish_deposit.dart';

void main() {
  group('WishDeposit', () {
    test('can be instantiated', () {
      expect(WishDeposit(adapter: MemoryDepositAdapter()), isNotNull);
    });
  });
}
