import 'dart:convert';

import 'package:code_challenge/src/data/models/stock_exchange.dart';
import 'package:http/http.dart' as http;

class YahooFinanceService {
  Future<StockExchange> getStocks(String symbol) async {
    const url = 'yfapi.net';
    const apiStr = '/v8/finance/spark';
    final headers = {'x-api-key': "P6eOoArf0Z8RScxLTsfjl6uZL9TXOZ9i67q5LN9N"};
    var params = {
      'interval': '1d',
      'range': '1mo',
      'symbols': symbol,
    };

    final uri = Uri.https(url, apiStr, params);

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);

      return StockExchange.fromJson(decodedData[symbol]);
    } else {
      throw Exception('Failed to load results.');
    }
  }
}
