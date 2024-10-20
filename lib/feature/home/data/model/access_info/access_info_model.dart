import 'package:equatable/equatable.dart';
import '../Epub/Epub_model.dart';
import '../Pdf/pdf_model.dart';
import 'package:hive/hive.dart';
part 'access_info_model.g.dart';

@HiveType(typeId: 9)
class AccessInfo extends Equatable {
  @HiveField(0)
  final String? country;
  @HiveField(1)
  final String? viewability;
  @HiveField(2)
  final bool? embeddable;
  @HiveField(3)
  final bool? publicDomain;
  @HiveField(4)
  final String? webReaderLink;
  @HiveField(5)
  final Epub? epub; // Add this field
  @HiveField(6)
  final Pdf? pdf; // Add this field

  const AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.webReaderLink,
    this.epub,
    this.pdf,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(
      country: json['country'],
      viewability: json['viewability'],
      embeddable: json['embeddable'],
      publicDomain: json['publicDomain'],
      webReaderLink: json['webReaderLink'],
      epub: json['epub'] != null
          ? Epub.fromJson(json['epub'])
          : null, // Parse epub
      pdf: json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null, // Parse pdf
    );
  }

  @override
  List<Object?> get props => [
        country,
        viewability,
        embeddable,
        publicDomain,
        webReaderLink,
        epub, // Add this field
        pdf, // Add this field
      ];
}
