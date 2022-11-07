import 'tender_models.dart';

class Page {
  Page({
    required this.pageCount,
    required this.pageNumber,
    required this.pageSize,
    required this.total,
    required this.data,
  });

  int pageCount;
  int pageNumber;
  int pageSize;
  int total;
  List<Datum> data;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    pageCount: json["page_count"],
    pageNumber: json["page_number"],
    pageSize: json["page_size"],
    total: json["total"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page_count": pageCount,
    "page_number": pageNumber,
    "page_size": pageSize,
    "total": total,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}