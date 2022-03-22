// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:wishes_api/wishes_api.dart';

class TestWishesApi extends WishesApi {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('WishesApi', () {
    test('can be instantiated', () {
      expect(TestWishesApi.new, returnsNormally);
    });
  });
}
