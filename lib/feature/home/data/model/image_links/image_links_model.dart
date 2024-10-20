import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'image_links_model.g.dart';

@HiveType(typeId: 7)
class ImageLinks extends Equatable {
  @HiveField(0)
  final String? smallThumbnail;
  @HiveField(1)
  final String? thumbnail;

  const ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
    );
  }

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
