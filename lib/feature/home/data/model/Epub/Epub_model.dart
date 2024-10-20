import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'Epub_model.g.dart';

@HiveType(typeId: 8)
class Epub extends Equatable {
  @HiveField(0)
  final bool? isAvailable;

  const Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) {
    return Epub(
      isAvailable: json['isAvailable'],
    );
  }

  @override
  List<Object?> get props => [isAvailable];
}
