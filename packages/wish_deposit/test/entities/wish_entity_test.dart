import 'package:test/test.dart';
import 'package:wish_deposit/wish_deposit.dart';

void main() {
  group('WishEntity', () {
    WishEntity testWish({
      int id = 1,
      String title = 'title',
      String description = 'description',
      bool isFulfilled = true,
    }) {
      return WishEntity(
        id: id,
        title: title,
        description: description,
        isFulfilled: isFulfilled,
      );
    }

    group('constructor', () {
      test('can be instantiated', () {
        expect(testWish(), isNotNull);
      });

      test('throws AssertionError when id is less than or equal to zero', () {
        expect(
          () => testWish(id: 0),
          throwsA(isA<AssertionError>()),
        );
        expect(
          () => testWish(id: -1),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    test('wishes are equal with same values', () {
      expect(
        testWish(),
        equals(testWish()),
      );
    });

    test('props are correctly set', () {
      expect(
        testWish().props,
        equals([
          1, // id
          'title', // title
          'description', // description
          true, // isCompleted
        ]),
      );
    });

    group('copyWith', () {
      test('retains the old value for every parameter if null is provided', () {
        // Expliclity ignoring redundant argument values to show case this test
        // better. Otherwise it would have been an empty `copyWith`.
        expect(
          testWish().copyWith(
            // ignore: avoid_redundant_argument_values
            title: null,
            // ignore: avoid_redundant_argument_values
            description: null,
            // ignore: avoid_redundant_argument_values
            isFulfilled: null,
          ),
          equals(testWish()),
        );
      });

      test(
          'replaces the old value with the new value for every parameter that '
          'is provided', () {
        expect(
          testWish().copyWith(
            title: 'new title',
            description: 'new description',
            isFulfilled: false,
          ),
          equals(
            testWish(
              title: 'new title',
              description: 'new description',
              isFulfilled: false,
            ),
          ),
        );
      });
    });

    group('fromJSON', () {
      test('works correctly', () {
        expect(
          WishEntity.fromJSON(<String, dynamic>{
            'id': 1,
            'title': 'title',
            'description': 'description',
            'isFulfilled': true,
          }),
          equals(testWish()),
        );
      });

      test('ignores all "extra" fields', () {
        expect(
          WishEntity.fromJSON(<String, dynamic>{
            'id': 1,
            'title': 'title',
            'description': 'description',
            'isFulfilled': true,
            'someOther': 'field',
          }),
          equals(testWish()),
        );
      });
    });

    group('toJSON', () {
      test('works correctly', () {
        expect(
          testWish().toJSON(),
          equals(<String, dynamic>{
            'id': 1,
            'title': 'title',
            'description': 'description',
            'isFulfilled': true,
          }),
        );
      });
    });
  });
}
