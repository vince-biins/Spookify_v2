import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:flutter/material.dart';

class TrackParam {
  final String? id;
  final String? imageUrl;
  final String? artist;
  final String title;
  final TrackType type;
  final Color? color;

  TrackParam({
    required this.id,
    required this.imageUrl,
    required this.artist,
    required this.title,
    required this.type,
    required this.color,
  });
}
