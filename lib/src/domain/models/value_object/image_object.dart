import 'package:equatable/equatable.dart';

class ImageObject extends Equatable {
  final String imageUrl;

  const ImageObject({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}
