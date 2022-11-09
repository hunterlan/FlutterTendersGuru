import 'package:flutter/material.dart';
import 'package:tenders/services/tender_service.dart';
import 'package:tenders/models/page.dart' as TenderPage;

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
    final _currentPage = await TenderService().getTenders(_currentNumberPage);
    setState(() {
      _page = _currentPage;
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
          onTap: null,
        )
    );
  }

  void resetPageValue() {
    setState(() {
      _page = null;
    });
  }

  void previousPage() {
    _currentNumberPage--;
    resetPageValue();
    _getData();
  }

  void nextPage() {
    _currentNumberPage++;
    resetPageValue();
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
                    : _isError ? const Text('Sorry, we cannot get a tenders.') : ListView.builder(
                    itemCount: _page!.data.length,
                    itemBuilder: (context, index) => itemBuilder(context, index)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: _currentNumberPage == 1 ? null : previousPage,
                      icon: const Icon(Icons.arrow_back),
                  ),
                  Text('${_currentNumberPage.toString()} of $_maxPage'),
                  IconButton(
                      onPressed: _currentNumberPage == _maxPage ? null : nextPage,
                      icon: const Icon(Icons.arrow_forward)
                  )
                ],
              )
            ],
      ),
    );
  }
  
  
}