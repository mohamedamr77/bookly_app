import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'industry_identifier_model.g.dart';

@HiveType(typeId: 6)
class IndustryIdentifier extends Equatable {
  @HiveField(0)
  final String? type;
  @HiveField(1)
  final String? identifier;

  const IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifier(
      type: json['type'],
      identifier: json['identifier'],
    );
  }

  @override
  List<Object?> get props => [type, identifier];
}
