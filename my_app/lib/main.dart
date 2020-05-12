import 'package:flutter/material.dart';
import 'package:my_app/pages/index_page.dart';
import 'package:my_app/provide/counter.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import './routers/application.dart';
import './routers/routers.dart';

// void main() => runApp(MyApp());

void main() {
  final router = Router();



  runApp(ChangeNotifierProvider<Counter>.value(
    child: MyApp(),
    value: Counter(1),
  ));
}

class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Applicaiton.router = router;


    return MaterialApp(
      onGenerateRoute: Applicaiton.router.generator,
      title: 'Flutter Tutorial',
      home: IndexPage(),
      theme: ThemeData(
          highlightColor: Colors.transparent, splashColor: Colors.transparent),
    );
  }
}
