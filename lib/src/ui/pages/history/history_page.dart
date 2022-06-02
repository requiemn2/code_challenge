import 'package:code_challenge/src/data/models/stock_exchange.dart';
import 'package:code_challenge/src/data/services/remote/yahoo_finance_service.dart';
import 'package:code_challenge/src/ui/widgets/rounded_button.dart';

import 'package:flutter/material.dart';

import 'widgets/stock_exchange_results.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final yfinanceService = YahooFinanceService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: RoundedButton(
              label: 'Back', onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Stock Exchange history',
              style: TextStyle(color: Colors.black),
            ),
            leading: Container(),
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.teal.shade100),
              unselectedLabelColor: Colors.green,
              labelColor: Colors.green,
              tabs: [
                Container(
                  child: const Text('NASDAQ'),
                  padding: const EdgeInsets.all(8.0),
                ),
                Container(
                  child: const Text('DAX'),
                  padding: const EdgeInsets.all(8.0),
                ),
                Container(
                  child: const Text('Nikkei 225'),
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            StockExchangeResults(symbol: '^NDX'),
            StockExchangeResults(symbol: '^GDAXI'),
            StockExchangeResults(symbol: '^N225'),
          ]),
        ),
      ),
    );
  }
}

class HistoryList extends StatelessWidget {
  HistoryList({Key? key, required this.stockExchange}) : super(key: key);

  final StockExchange stockExchange;

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

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final newIndex = stockExchange.timestamp.length - index - 1;

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
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: 10);
  }
}
