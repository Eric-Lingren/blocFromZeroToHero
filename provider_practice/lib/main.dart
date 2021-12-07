// import 'dart:io';

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_practice/logic/cubits/counter_cubit.dart';
import 'package:provider_practice/logic/cubits/internet_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_practice/presentation/router/app_router.dart';
// import 'package:provider_practice/presentation/screens/home_screen.dart';
// import 'package:provider_practice/presentation/screens/second_screen.dart';
// import 'package:provider_practice/presentation/screens/third_screen.dart';
// import 'logic/cubits/counter_cubit.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatefulWidget {
final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({
    Key? key, 
    required this.appRouter, 
    required this.connectivity
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final CounterCubit _counterCubit = CounterCubit();
  // late final InternetCubit internetCubit;
  // late final StreamSubscription internetStreamSubscription;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<InternetCubit>(
        create: (context) => InternetCubit(connectivity: widget.connectivity)),
      BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(internetCubit: context.read<InternetCubit>())
      )
    ], 

    // // Wrap this for global bloc provider through whole project
    // return BlocProvider<CounterCubit>(
      // create: (context) => CounterCubit(internetStreamSubscription: internetStreamSubscription, internetCubit: internetCubit),
      // create: (context) => CounterCubit(internetCubit: context.read<InternetCubit>(), internetStreamSubscription: context.read<CounterCubit>()),
      // create: (context) => CounterCubit(internetCubit: context.read<InternetCubit>(), internetStreamSubscription: context.read<CounterCubit>()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Generated Routing Example:
        onGenerateRoute: widget.appRouter.onGenerateRoute,
        // Name Routing Example:
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //       value: _counterCubit,
        //       child: HomeScreen(title: 'Home Screen', color: Colors.blueAccent)),
        //   '/second': (context) => BlocProvider.value(
        //       value: _counterCubit,
        //       child: HomeScreen(title: 'Second Screen', color: Colors.redAccent)),
        //   '/third': (context) => BlocProvider.value(
        //       value: _counterCubit,
        //       child:
        //           HomeScreen(title: 'Third Screen', color: Colors.greenAccent)),
        // },
        // Annynomous Routing Example:
        // home: BlocProvider<CounterCubit>(
        //   create: (context) => CounterCubit(),
        //   child: HomeScreen(title: 'First Screen', color: Colors.blueAccent),
        // ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // _counterCubit.close();
  //   _appRouter.dispose();
  //   super.dispose();
  // }
}
