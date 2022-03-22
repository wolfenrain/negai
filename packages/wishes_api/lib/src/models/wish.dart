import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:wishes_api/wishes_api.dart';

part 'wish.g.dart';

/// {@template wish}
/// A single wish item.
///
/// Contains a [title], [description] and [id], in addition to a [isFulfilled]
/// flag.
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
///
/// [Wish]s are immutable and can be copied using [copyWith], in addition to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Wish extends Equatable {
  /// {@macro wish}
  Wish({
    String? id,
    required this.title,
    this.description = '',
    this.isFulfilled = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  /// The unique identifier of the wish.
  ///
  /// Cannot be empty.
  final String id;

  /// The title of the wish.
  ///
  /// Note that the title may be empty.
  final String title;

  /// The description of the wish.
  ///
  /// Defaults to an empty string.
  final String description;

  /// Whether the wish is fulfilled.
  ///
  /// Defaults to `false`.
  final bool isFulfilled;

  /// Returns a copy of this wish with the given values updated.
  ///
  /// {@macro wish}
  Wish copyWith({
    String? id,
    String? title,
    String? description,
    bool? isFulfilled,
  }) {
    return Wish(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isFulfilled: isFulfilled ?? this.isFulfilled,
    );
  }

  /// Deserializes the given [JsonMap] into a [Wish].
  static Wish fromJson(JsonMap json) => _$WishFromJson(json);

  /// Converts this [Wish] into a [JsonMap].
  JsonMap toJson() => _$WishToJson(this);

  @override
  List<Object> get props => [id, title, description, isFulfilled];
}
