import 'package:flutter/material.dart';
import 'package:tenders/services/tender_service.dart';
import 'package:tenders/models/page.dart' as TenderPage;

import 'tender_details.dart';

class PolishTenders extends StatefulWidget {
  const PolishTenders({super.key});

  @override
  State<StatefulWidget> createState() {
    return PolishTendersState();
  }

}

class PolishTendersState extends State<PolishTenders> {
  TenderPage.Page? _page;
  bool _isError = false;
  int _currentNumberPage = 1;
  int _maxPage = 1;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final currentPage = await TenderService().getTenders(_currentNumberPage);
    setState(() {
      _page = currentPage;
      if (_page == null ) {
        _isError = true;
      } else {
        _maxPage = _page!.pageCount;
      }
    });
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = _page!.data.elementAt(index);
    final backgroundColorOfDeadline = DateTime.now().isAfter(item.deadlineDate) ? Colors.green : Colors.red;

    return Card(
        child: ListTile(
          title: Text(item.title),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    item.category.toString().replaceAll("Category.", "").toLowerCase(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: backgroundColorOfDeadline,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    DateTime.now().isAfter(item.deadlineDate) ? 'passed' : 'not passed',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                ),
                )
              ],
            ),
          ),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TenderDetails(item))),
        )
    );
  }

  void changeNumberPage(bool toIncrement, bool toFirstPage, bool toLastPage) {
    setState(() {
      _page = null;
    });
    if (toFirstPage) {
      _currentNumberPage = 1;
    } else if (toLastPage) {
      _currentNumberPage = _maxPage - 1;
    } else if (toIncrement) {
      _currentNumberPage++;
    } else {
      _currentNumberPage--;
    }
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    // TO-DO: Add an error about nog ability getting data
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polish tenders'),
        backgroundColor: Colors.red,
      ),
      body: Column(
            children: [
              Expanded(
                child: _page == null
                    ? const Center(
                      child: CircularProgressIndicator(),
                    )
                    : _isError ? const Text('Sorry, we cannot get tenders.') : ListView.builder(
                    itemCount: _page!.data.length,
                    itemBuilder: (context, index) => itemBuilder(context, index)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: _currentNumberPage == 1 ? null : () => changeNumberPage(false, false, false),
                      icon: const Icon(Icons.arrow_back),
                  ),
                  Text('${_currentNumberPage.toString()} of $_maxPage'),
                  IconButton(
                      onPressed: _currentNumberPage == _maxPage ? null : () => changeNumberPage(true, false, false),
                      icon: const Icon(Icons.arrow_forward)
                  ),
                  IconButton(
                      onPressed: () => changeNumberPage(false, false, true),
                      icon: const Icon(Icons.double_arrow)
                  )
                ],
              )
            ],
      ),
    );
  }
  
  
}