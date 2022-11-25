import 'package:flutter/material.dart';

import '../models/tender_models.dart';

class TenderDetails extends StatelessWidget {
  late Datum _currentTender;

  TenderDetails(Datum setCurrentTender, {super.key}) {
    _currentTender = setCurrentTender;
    // TO-DO: break steps 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polish tenders'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            alignment: Alignment.center,
            child: Text(
                _currentTender.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              children: [
                const Text(
                    'Description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    _currentTender.description,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
          Text('Date creation: ${_currentTender.date}'),
          Text('Deadline: ${_currentTender.deadlineDate}'),
          Text('Awarded value: ${_currentTender.awardedValue}'),
          Text('Awarded value in EUR: ${_currentTender.awardedValueEur}')
        ],
      ),
    );
  }

}