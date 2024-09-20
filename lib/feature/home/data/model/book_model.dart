import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;

  const BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  });

  // Factory constructor to create a Book object from JSON
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: json['volumeInfo'] != null ? VolumeInfo.fromJson(json['volumeInfo']) : null,
      saleInfo: json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null,
      accessInfo: json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null,
    );
  }

  @override
  List<Object?> get props => [kind, id, etag, selfLink, volumeInfo, saleInfo, accessInfo];
}

class VolumeInfo extends Equatable {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<IndustryIdentifier>? industryIdentifiers;
  final double? averageRating;
  final int? ratingsCount;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final ImageLinks? imageLinks;

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
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    var authorsFromJson = json['authors'] != null
        ? List<String>.from(json['authors'])
        : null;
    var industryIdentifiersFromJson = json['industryIdentifiers'] != null
        ? (json['industryIdentifiers'] as List)
        .map((i) => IndustryIdentifier.fromJson(i))
        .toList()
        : null;

    return VolumeInfo(
      title: json['title'],
      authors: authorsFromJson,
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      pageCount: json['pageCount'],
      industryIdentifiers: industryIdentifiersFromJson,
      averageRating: json['averageRating']?.toDouble(),
      ratingsCount: json['ratingsCount'],
      language: json['language'],
      previewLink: json['previewLink'],
      infoLink: json['infoLink'],
      imageLinks: json['imageLinks'] != null ? ImageLinks.fromJson(json['imageLinks']) : null,
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
  ];
}

class IndustryIdentifier extends Equatable {
  final String? type;
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

class ImageLinks extends Equatable {
  final String? smallThumbnail;
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

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
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

class AccessInfo extends Equatable {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? webReaderLink;

  const AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.webReaderLink,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(
      country: json['country'],
      viewability: json['viewability'],
      embeddable: json['embeddable'],
      publicDomain: json['publicDomain'],
      webReaderLink: json['webReaderLink'],
    );
  }

  @override
  List<Object?> get props => [country, viewability, embeddable, publicDomain, webReaderLink];
}
