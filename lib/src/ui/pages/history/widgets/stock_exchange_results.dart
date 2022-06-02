import 'package:code_challenge/src/data/models/stock_exchange.dart';
import 'package:code_challenge/src/data/services/remote/yahoo_finance_service.dart';
import 'package:flutter/material.dart';

class StockExchangeResults extends StatefulWidget {
  const StockExchangeResults({Key? key, required this.symbol})
      : super(key: key);

  final String symbol;

  @override
  State<StockExchangeResults> createState() => _StockExchangeResultsState();
}

class _StockExchangeResultsState extends State<StockExchangeResults>
    with AutomaticKeepAliveClientMixin {
  final yFinanceService = YahooFinanceService();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Map<int, String> months = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec',
    };
    final Map<String, String> names = {
      '^NDX': 'NASDAQ',
      '^GDAXI': 'DAX',
      '^N225': 'Nikkei 225',
    };

    final stock = yFinanceService.getStocks(widget.symbol);
    return FutureBuilder(
      future: stock,
      builder: (BuildContext context, AsyncSnapshot<StockExchange> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final stockExchange = snapshot.data;

              final newIndex = stockExchange!.timestamp.length - index - 1;

              final DateTime date = DateTime.fromMillisecondsSinceEpoch(
                  stockExchange.timestamp[newIndex] * 1000);
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                trailing: Text(
                  '${months[date.month]} ${date.day}, ${date.year} ',
                  style: const TextStyle(fontSize: 12),
                ),
                title: Text(stockExchange.close[newIndex].toString()),
                subtitle: Text(
                  names[stockExchange.symbol]!,
                  style: const TextStyle(fontSize: 11),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: 10,
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error Fetching Data'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
