import 'dart:convert';

StockExchange stockExchangeFromJson(String str) =>
    StockExchange.fromJson(json.decode(str));

String stockExchangeToJson(StockExchange data) => json.encode(data.toJson());

class StockExchange {
  StockExchange({
    required this.symbol,
    required this.timestamp,
    this.dataGranularity,
    this.end,
    this.start,
    required this.close,
    this.previousClose,
    this.chartPreviousClose,
  });

  String symbol;
  List<int> timestamp;
  int? dataGranularity;
  dynamic end;
  dynamic start;
  List<double> close;
  List<double>? previousClose;
  double? chartPreviousClose;

  factory StockExchange.fromJson(Map<String, dynamic> json) => StockExchange(
        symbol: json["symbol"],
        timestamp: List<int>.from(json["timestamp"].map((x) => x)),
        dataGranularity: json["dataGranularity"],
        end: json["end"],
        start: json["start"],
        close: List<double>.from(json["close"].map((x) => x.toDouble())),
        previousClose: json["previousClose"],
        chartPreviousClose: json["chartPreviousClose"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "timestamp": List<dynamic>.from(timestamp.map((x) => x)),
        "dataGranularity": dataGranularity,
        "end": end,
        "start": start,
        "close": List<dynamic>.from(close.map((x) => x)),
        "previousClose": previousClose,
        "chartPreviousClose": chartPreviousClose,
      };
}
