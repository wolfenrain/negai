import 'package:wishes_api/wishes_api.dart';

/// {@template wishes_api}
/// The interface and models for an API providing access to wishes.
/// {@endtemplate}
abstract class WishesApi {
  /// {@macro wishes_api}
  const WishesApi();

  /// Provides a [Stream] of all wishes.
  Stream<List<Wish>> get();

  /// Saves a [wish].
  ///
  /// If a [wish] with the same id already exists, it will be replaced.
  Future<void> save(Wish wish);

  /// Deletes the wish with the given id.
  ///
  /// If no wish with the given id exists, a [WishNotFoundException] error is
  /// thrown.
  Future<void> delete(String id);

  /// Deletes all fulfilled wishes.
  ///
  /// Returns the number of deleted wishes.
  Future<int> clearFulfilled();

  /// Sets the `isFulfilled` state of all wishes to the given value.
  ///
  /// Returns the number of updated wishes.
  Future<int> fulfilllAll({required bool isFulfilled});
}

/// Error thrown when a [Wish] with a given id is not found.
class WishNotFoundException implements Exception {}
