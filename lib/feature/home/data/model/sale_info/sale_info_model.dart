import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'sale_info_model.g.dart';

@HiveType(typeId: 2)
class SaleInfo extends Equatable {
  @HiveField(0)
  final String? country;
  @HiveField(1)
  final String? saleability;
  @HiveField(2)
  final bool? isEbook;

  const SaleInfo({this.country, this.saleability, this.isEbook});

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      country: json['country'],
      saleability: json['saleability'],
      isEbook: json['isEbook'],
    );
  }

  @override
  List<Object?> get props => [country, saleability, isEbook];
}
