import 'package:booklyapp/feature/home/data/model/sale_info/sale_info_model.dart';
import 'package:booklyapp/feature/home/data/model/volume_info/volume_info_model.dart';
import 'package:equatable/equatable.dart';
import 'access_info/access_info_model.dart';

import 'package:hive/hive.dart';
part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends Equatable {
  @HiveField(0)
  final String? kind;
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? etag;
  @HiveField(3)
  final String? selfLink;
  @HiveField(4)
  final VolumeInfo? volumeInfo;
  @HiveField(5)
  final SaleInfo? saleInfo;
  @HiveField(6)
  final AccessInfo? accessInfo;
  @HiveField(7)
  bool saveBook;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.saveBook = false,
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
      [kind, id, etag, selfLink, volumeInfo, saleInfo, accessInfo, saveBook];
  @override
  String toString() {
    // TODO: implement toString
    return "id :$id";
  }
}
