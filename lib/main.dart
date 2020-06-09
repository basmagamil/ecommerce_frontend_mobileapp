import 'package:ecommerce/pages/home/home_bloc.dart';
import 'package:ecommerce/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Janna",
          buttonColor: Colors.black,
          accentColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        locale: Locale('ar'),
        supportedLocales: [
          const Locale('ar'), // Arabic
          const Locale('en'), // English
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        // home: Home()
        home: BlocProvider<HomeBloc>(
          create: (context) =>
              HomeBloc()..add(HomeEvent(type: HomeEventType.loadAllProducts)),
          child: Home(),
        ));
  }
}
