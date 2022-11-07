import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'views/polish_tenders.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _getVertical(BuildContext context) {
    String pathImages = 'assets/images';
    return Column(
      children: <Widget>[
        SvgPicture.asset('$pathImages/handshake.svg'),
        IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PolishTenders())
            ),
            icon: SvgPicture.asset('$pathImages/countries/poland.svg')
        ),
        IconButton(onPressed: null, icon: SvgPicture.asset('$pathImages/countries/ukraine.svg')),
        IconButton(onPressed: null, icon: SvgPicture.asset('$pathImages/countries/romania.svg')),
        IconButton(onPressed: null, icon: SvgPicture.asset('$pathImages/countries/spain.svg')),
        IconButton(onPressed: null, icon: SvgPicture.asset('$pathImages/countries/hungary.svg')),
      ],
    );
  }

  Widget _getRightLayout(BuildContext context, BoxConstraints constraints) {
    if (constraints.minWidth < 600) {
      return _getVertical(context);
    } else {
      throw Exception('Not implemented yet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => _getRightLayout(context, constraints),
        ),
      ),
    );
  }
}

