import 'package:test/test.dart';
import 'package:wishes_api/wishes_api.dart';

void main() {
  group('Wish', () {
    Wish testWish({
      String id = '1',
      String title = 'title',
      String description = 'description',
      bool isFulfilled = true,
    }) {
      return Wish(
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

      test('throws AssertionError when id is an empty string', () {
        expect(
          () => testWish(id: ''),
          throwsA(isA<AssertionError>()),
        );
      });

      test('sets id if none is provided', () {
        expect(testWish().id, isNotEmpty);
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
          '1', // id
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
            id: null,
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
            id: '2',
            title: 'new title',
            description: 'new description',
            isFulfilled: false,
          ),
          equals(
            testWish(
              id: '2',
              title: 'new title',
              description: 'new description',
              isFulfilled: false,
            ),
          ),
        );
      });
    });

    group('fromJson', () {
      test('works correctly', () {
        expect(
          Wish.fromJson(<String, dynamic>{
            'id': '1',
            'title': 'title',
            'description': 'description',
            'isFulfilled': true,
          }),
          equals(testWish()),
        );
      });

      test('ignores all "extra" fields', () {
        expect(
          Wish.fromJson(<String, dynamic>{
            'id': '1',
            'title': 'title',
            'description': 'description',
            'isFulfilled': true,
            'someOther': 'field',
          }),
          equals(testWish()),
        );
      });
    });

    group('toJson', () {
      test('works correctly', () {
        expect(
          testWish().toJson(),
          equals(<String, dynamic>{
            'id': '1',
            'title': 'title',
            'description': 'description',
            'isFulfilled': true,
          }),
        );
      });
    });
  });
}
