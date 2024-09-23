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
      volumeInfo: json['volumeInfo'] != null
          ? VolumeInfo.fromJson(json['volumeInfo'])
          : null,
      saleInfo:
          json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null,
      accessInfo: json['accessInfo'] != null
          ? AccessInfo.fromJson(json['accessInfo'])
          : null,
    );
  }

  @override
  List<Object?> get props =>
      [kind, id, etag, selfLink, volumeInfo, saleInfo, accessInfo];
  @override
  String toString() {
    // TODO: implement toString
    return "id :$id";
  }
}

class VolumeInfo extends Equatable {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<IndustryIdentifier>? industryIdentifiers;
  final num? averageRating;
  final int? ratingsCount;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final ImageLinks? imageLinks;
  final List<String>? categories; // Add categories field
  final ReadingModes? readingModes; // Existing field
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
  final Epub? epub; // Add this field
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

class Epub extends Equatable {
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

class Pdf extends Equatable {
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

class ReadingModes extends Equatable {
  final bool? text;
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

class PanelizationSummary extends Equatable {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  const PanelizationSummary(
      {this.containsEpubBubbles, this.containsImageBubbles});

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
    return PanelizationSummary(
      containsEpubBubbles: json['containsEpubBubbles'],
      containsImageBubbles: json['containsImageBubbles'],
    );
  }

  @override
  List<Object?> get props => [containsEpubBubbles, containsImageBubbles];
}
