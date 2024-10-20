import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'pdf_model.g.dart';

@HiveType(typeId: 4)
class Pdf extends Equatable {
  @HiveField(0)
  final bool? isAvailable;
  const Pdf({this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) {
    return Pdf(
      isAvailable: json['isAvailable'],
    );
  }

  @override
  List<Object?> get props => [isAvailable];
}
