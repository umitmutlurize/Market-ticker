// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.success,
    this.fluctuation,
    this.startDate,
    this.endDate,
    this.base,
    this.rates,
  });

  bool? success;
  bool? fluctuation;
  DateTime? startDate;
  DateTime? endDate;
  String? base;
  Map<String, Rate>? rates;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    success: json["success"],
    fluctuation: json["fluctuation"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    base: json["base"],
    rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, Rate>(k, Rate.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "fluctuation": fluctuation,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "base": base,
    "rates": Map.from(rates!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Rate {
  Rate({
    this.startRate,
    this.endRate,
    this.change,
    this.changePct,
  });

  double? startRate;
  double? endRate;
  double? change;
  double? changePct;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    startRate: json["start_rate"].toDouble(),
    endRate: json["end_rate"].toDouble(),
    change: json["change"].toDouble(),
    changePct: json["change_pct"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "start_rate": startRate,
    "end_rate": endRate,
    "change": change,
    "change_pct": changePct,
  };
}
