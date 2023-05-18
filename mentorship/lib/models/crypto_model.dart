class CryptoModel {
  Time time;
  String disclaimer;
  String chartName;
  BPI bpi;

  CryptoModel({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory CryptoModel.fromJSON(Map<String, dynamic> json) {
    return CryptoModel(
      time: Time.fromJSON(json["time"]),
      disclaimer: json["disclaimer"],
      chartName: json["chartName"],
      bpi: BPI.fromJSON(json["bpi"]),
    );
  }
}

class Time {
  String updated;
  String updatedISO;
  String updateduk;

  Time({
    required this.updated,
    required this.updatedISO,
    required this.updateduk,
  });

  factory Time.fromJSON(Map<String, dynamic> json) {
    return Time(
      updated: json["updated"],
      updatedISO: json["updatedISO"],
      updateduk: json["updateduk"],
    );
  }
}

class BPI {
  Currency usd;
  Currency gbp;
  Currency eur;

  BPI({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory BPI.fromJSON(Map<String, dynamic> json) {
    return BPI(
      usd: Currency.fromJSON(json["USD"]),
      gbp: Currency.fromJSON(json["GBP"]),
      eur: Currency.fromJSON(json["EUR"]),
    );
  }
}

class Currency {
  String code;
  String symbol;
  String rate;
  String description;
  double rateFloat;

  Currency({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Currency.fromJSON(Map<String, dynamic> json) {
    return Currency(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"]);
  }
}
