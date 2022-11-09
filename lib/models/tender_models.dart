class Datum {
  Datum({
    required this.id,
    required this.date,
    required this.deadlineDate,
    required this.deadlineLengthDays,
    required this.deadlineLengthHours,
    required this.title,
    this.category,
    required this.description,
    required this.sid,
    required this.awardedValue,
    this.awardedCurrency,
    required this.awardedValueEur,
    required this.purchaser,
    this.type,
    required this.awarded,
    required this.indicators,
  });

  String id;
  DateTime date;
  DateTime deadlineDate;
  String deadlineLengthDays;
  String deadlineLengthHours;
  String title;
  Category? category;
  String description;
  String sid;
  String awardedValue;
  AwardedCurrency? awardedCurrency;
  String awardedValueEur;
  Purchaser purchaser;
  Type? type;
  List<Awarded> awarded;
  List<Indicator> indicators;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    deadlineDate: DateTime.parse(json["deadline_date"]),
    deadlineLengthDays: json["deadline_length_days"],
    deadlineLengthHours: json["deadline_length_hours"],
    title: json["title"],
    category: categoryValues.map[json["category"]],
    description: json["description"],
    sid: json["sid"],
    awardedValue: json["awarded_value"],
    awardedCurrency: awardedCurrencyValues.map[json["awarded_currency"]],
    awardedValueEur: json["awarded_value_eur"],
    purchaser: Purchaser.fromJson(json["purchaser"]),
    type: json["type"] == null ? null : Type.fromJson(json["type"]),
    awarded: List<Awarded>.from(json["awarded"].map((x) => Awarded.fromJson(x))),
    indicators: json["indicators"] == null ? [] : List<Indicator>.from(json["indicators"].map((x) => indicatorValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "deadline_date": "${deadlineDate.year.toString().padLeft(4, '0')}-${deadlineDate.month.toString().padLeft(2, '0')}-${deadlineDate.day.toString().padLeft(2, '0')}",
    "deadline_length_days": deadlineLengthDays,
    "deadline_length_hours": deadlineLengthHours,
    "title": title,
    "category": categoryValues.reverse[category],
    "description": description,
    "sid": sid,
    "awarded_value": awardedValue,
    "awarded_currency": awardedCurrencyValues.reverse[awardedCurrency],
    "awarded_value_eur": awardedValueEur,
    "purchaser": purchaser.toJson(),
    "type": type!.toJson(),
    "awarded": List<dynamic>.from(awarded.map((x) => x.toJson())),
    "indicators": List<dynamic>.from(indicators.map((x) => indicatorValues.reverse[x])),
  };
}

class Awarded {
  Awarded({
    required this.date,
    required this.valueForTwo,
    required this.valueForTwoEur,
    required this.suppliers,
    required this.valueMin,
    required this.valueForThree,
    required this.valueForOneEur,
    required this.count,
    required this.valueForOne,
    required this.offersDeclined,
    required this.valueForThreeEur,
    required this.suppliersId,
    required this.valueEur,
    required this.valueMax,
    required this.offersCount,
    required this.suppliersName,
    required this.value,
    required this.valueEstimated,
    required this.offersCountData,
    this.offersCountStatus,
  });

  DateTime date;
  double valueForTwo;
  double valueForTwoEur;
  List<Supplier> suppliers;
  String valueMin;
  double valueForThree;
  double valueForOneEur;
  String count;
  double valueForOne;
  List<int> offersDeclined;
  double valueForThreeEur;
  String suppliersId;
  double valueEur;
  String valueMax;
  List<int> offersCount;
  String suppliersName;
  String value;
  String valueEstimated;
  Map<String, OffersCountDatum> offersCountData;
  OffersCountStatus? offersCountStatus;

  factory Awarded.fromJson(Map<String, dynamic> json) => Awarded(
    date: DateTime.parse(json["date"]),
    valueForTwo: json["value_for_two"].toDouble(),
    valueForTwoEur: json["value_for_two_eur"].toDouble(),
    suppliers: List<Supplier>.from(json["suppliers"].map((x) => Supplier.fromJson(x))),
    valueMin: json["value_min"],
    valueForThree: json["value_for_three"].toDouble(),
    valueForOneEur: json["value_for_one_eur"].toDouble(),
    count: json["count"],
    valueForOne: json["value_for_one"].toDouble(),
    offersDeclined: json["offers_declined"] == null ? [] : List<int>.from(json["offers_declined"].map((x) => x)),
    valueForThreeEur: json["value_for_three_eur"].toDouble(),
    suppliersId: json["suppliers_id"],
    valueEur: json["value_eur"].toDouble(),
    valueMax: json["value_max"],
    offersCount: List<int>.from(json["offers_count"].map((x) => x)),
    suppliersName: json["suppliers_name"],
    value: json["value"],
    valueEstimated: json["value_estimated"] ?? "",
    offersCountData: Map.from(json["offers_count_data"]).map((k, v) => MapEntry<String, OffersCountDatum>(k, OffersCountDatum.fromJson(v))),
    offersCountStatus: json["offers_count_status"] == null ? null : offersCountStatusValues.map[json["offers_count_status"]],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "value_for_two": valueForTwo,
    "value_for_two_eur": valueForTwoEur,
    "suppliers": List<dynamic>.from(suppliers.map((x) => x.toJson())),
    "value_min": valueMin,
    "value_for_three": valueForThree,
    "value_for_one_eur": valueForOneEur,
    "count": count,
    "value_for_one": valueForOne,
    "offers_declined": List<dynamic>.from(offersDeclined.map((x) => x)),
    "value_for_three_eur": valueForThreeEur,
    "suppliers_id": suppliersId,
    "value_eur": valueEur,
    "value_max": valueMax,
    "offers_count": List<dynamic>.from(offersCount.map((x) => x)),
    "suppliers_name": suppliersName,
    "value": value,
    "value_estimated": valueEstimated,
    "offers_count_data": Map.from(offersCountData).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "offers_count_status": offersCountStatus == null ? null : offersCountStatusValues.reverse[offersCountStatus],
  };
}

class OffersCountDatum {
  OffersCountDatum({
    required this.valueEur,
    required this.count,
    required this.value,
  });

  double valueEur;
  String count;
  String value;

  factory OffersCountDatum.fromJson(Map<String, dynamic> json) => OffersCountDatum(
    valueEur: json["value_eur"].toDouble(),
    count: json["count"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "value_eur": valueEur,
    "count": count,
    "value": value,
  };
}

enum OffersCountStatus { ONLY_ONE, CONTAINS_ONLY_ONE }

final offersCountStatusValues = EnumValues({
  "contains_only_one": OffersCountStatus.CONTAINS_ONLY_ONE,
  "only_one": OffersCountStatus.ONLY_ONE
});

class Supplier {
  Supplier({
    required this.name,
    required this.id,
    required this.slug,
  });

  String name;
  int id;
  String slug;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
    name: json["name"],
    id: json["id"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "slug": slug,
  };
}

enum AwardedCurrency { PLN }

final awardedCurrencyValues = EnumValues({
  "PLN": AwardedCurrency.PLN
});

enum Category { CONSTRUCTIONS, SUPPLIES, SERVICES }

final categoryValues = EnumValues({
  "constructions": Category.CONSTRUCTIONS,
  "services": Category.SERVICES,
  "supplies": Category.SUPPLIES
});

enum Indicator { LOW_VALUE_AWARDED, HIGH_VALUE_AWARDED, DECLINED }

final indicatorValues = EnumValues({
  "declined": Indicator.DECLINED,
  "high_value_awarded": Indicator.HIGH_VALUE_AWARDED,
  "low_value_awarded": Indicator.LOW_VALUE_AWARDED
});

class Purchaser {
  Purchaser({
    required this.id,
    this.sid,
    this.name,
  });

  String id;
  dynamic sid;
  dynamic name;

  factory Purchaser.fromJson(Map<String, dynamic> json) => Purchaser(
    id: json["id"],
    sid: json["sid"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sid": sid,
    "name": name,
  };
}

class Type {
  Type({
    this.id,
    this.name,
    this.slug,
  });

  Id? id;
  Name? name;
  Id? slug;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: idValues.map[json["id"]],
    name: nameValues.map[json["name"]],
    slug: idValues.map[json["slug"]],
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "name": nameValues.reverse[name],
    "slug": idValues.reverse[slug],
  };
}

enum Id { ART_275_PKT_1_USTAWY, ART_275_PKT_2_USTAWY }

final idValues = EnumValues({
  "art-275-pkt-1-ustawy": Id.ART_275_PKT_1_USTAWY,
  "art-275-pkt-2-ustawy": Id.ART_275_PKT_2_USTAWY
});

enum Name { ART_275_PKT_1_USTAWY, ART_275_PKT_2_USTAWY }

final nameValues = EnumValues({
  "art. 275 pkt 1 ustawy": Name.ART_275_PKT_1_USTAWY,
  "art. 275 pkt 2 ustawy": Name.ART_275_PKT_2_USTAWY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}