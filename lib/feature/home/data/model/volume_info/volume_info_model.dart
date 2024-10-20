import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../image_links/image_links_model.dart';
import '../industry_identifier/industry_identifier_model.dart';
import '../panelization_summary/panelization_summary_model.dart';
import '../reading_modes/reading_modes_model.dart';
part 'volume_info_model.g.dart';

@HiveType(typeId: 1)
class VolumeInfo extends Equatable {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final List<String>? authors;
  @HiveField(2)
  final String? publisher;
  @HiveField(3)
  final String? publishedDate;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final int? pageCount;
  @HiveField(6)
  final List<IndustryIdentifier>? industryIdentifiers;
  @HiveField(7)
  final num? averageRating;
  @HiveField(8)
  final int? ratingsCount;
  @HiveField(9)
  final String? language;
  @HiveField(10)
  final String? previewLink;
  @HiveField(11)
  final String? infoLink;
  @HiveField(12)
  final ImageLinks? imageLinks;
  @HiveField(13)
  final List<String>? categories;
  @HiveField(14)
  final ReadingModes? readingModes; // Existing field
  @HiveField(15)
  final PanelizationSummary? panelizationSummary; // Existing field

  const VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.industryIdentifiers,
    this.averageRating,
    this.ratingsCount,
    this.language,
    this.previewLink,
    this.infoLink,
    this.imageLinks,
    this.categories, // Add this to the constructor
    this.readingModes,
    this.panelizationSummary,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      title: json['title'],
      authors:
          json['authors'] != null ? List<String>.from(json['authors']) : null,
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      pageCount: json['pageCount'],
      industryIdentifiers: json['industryIdentifiers'] != null
          ? (json['industryIdentifiers'] as List)
              .map((i) => IndustryIdentifier.fromJson(i))
              .toList()
          : null,
      averageRating: json['averageRating']?.toDouble(),
      ratingsCount: json['ratingsCount'],
      language: json['language'],
      previewLink: json['previewLink'],
      infoLink: json['infoLink'],
      imageLinks: json['imageLinks'] != null
          ? ImageLinks.fromJson(json['imageLinks'])
          : null,

      // categories: (json['categories'] as List<dynamic>?)?.cast<String>(),

      categories: json['categories'] != null
          ? List<String>.from(json['categories']) // Parse categories
          : null,
      readingModes: json['readingModes'] != null
          ? ReadingModes.fromJson(json['readingModes'])
          : null,
      panelizationSummary: json['panelizationSummary'] != null
          ? PanelizationSummary.fromJson(json['panelizationSummary'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        authors,
        publisher,
        publishedDate,
        description,
        pageCount,
        industryIdentifiers,
        averageRating,
        ratingsCount,
        language,
        previewLink,
        infoLink,
        imageLinks,
        categories, // Add to props
        readingModes,
        panelizationSummary,
      ];
}
