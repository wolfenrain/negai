import 'package:deposit/deposit.dart';
import 'package:wish_deposit/wish_deposit.dart';

/// {@template wish_deposit}
/// A deposit that talks to the wishes data backend.
/// {@endtemplate}
class WishDeposit extends Deposit<WishEntity, int> {
  /// {@macro wish_deposit}
  WishDeposit({
    required DepositAdapter<int> adapter,
  }) : super('wishes', WishEntity.fromJSON, adapter: adapter);
}
