import 'package:deposit/deposit.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'wish_entity.g.dart';

/// {@template wish}
/// A single wish item.
///
/// Contains a [title], [description] and [id], in addition to a [isFulfilled]
/// flag.
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
///
/// [WishEntity]s are immutable and can be copied using [copyWith], in addition
/// to being serialized and deserialized using [toJSON] and [fromJSON]
/// respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class WishEntity extends Equatable implements Entity {
  /// {@macro wish}
  const WishEntity({
    this.id,
    required this.title,
    this.description = '',
    this.isFulfilled = false,
  }) : assert(id == null || id > 0, 'id should be greater than 0');

  /// The unique identifier of the wish.
  final int? id;

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
  WishEntity copyWith({
    String? title,
    String? description,
    bool? isFulfilled,
  }) {
    return WishEntity(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isFulfilled: isFulfilled ?? this.isFulfilled,
    );
  }

  /// Deserializes the given [json] into a [WishEntity].
  static WishEntity fromJSON(Map<String, dynamic> json) =>
      _$WishEntityFromJson(json);

  @override
  Map<String, dynamic> toJSON() => _$WishEntityToJson(this);

  @override
  List<Object?> get props => [id, title, description, isFulfilled];
}
