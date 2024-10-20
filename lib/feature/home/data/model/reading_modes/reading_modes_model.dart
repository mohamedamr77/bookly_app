import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'reading_modes_model.g.dart';

@HiveType(typeId: 3)
class ReadingModes extends Equatable {
  @HiveField(0)
  final bool? text;
  @HiveField(1)
  final bool? image;

  const ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) {
    return ReadingModes(
      text: json['text'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [text, image];
}
