import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';

@immutable
class Downloads extends Equatable {
  final String trackId;
  final String title;
  final ImageObject? imageUrl;
  final String? artistName;
  final TrackType type;

  const Downloads({
    required this.trackId,
    required this.title,
    required this.imageUrl,
    required this.artistName,
    required this.type,
  });

  @override
  List<Object?> get props => [
        trackId,
      ];

  Downloads copyWith({
    String? trackId,
    String? title,
    ImageObject? imageUrl,
    String? artistName,
    TrackType? type,
  }) {
    return Downloads(
      trackId: trackId ?? this.trackId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      artistName: artistName ?? this.artistName,
      type: type ?? this.type,
    );
  }
}
