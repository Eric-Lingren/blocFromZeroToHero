import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubits/counter_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: BlocListener<CounterCubit, CounterState>(
        // listener: (context, state) {
        //   if(state.wasIncremented){
        //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incremented')));
        //   } else {
        //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Decremented')));
        //   }
        // },
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              SizedBox(height: 12),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if(state.wasIncremented){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 200), content: Text('Incremented')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 200), content: Text('Decremented')));
                  }
                },
                builder: (context, state) {
                  if (state.counterValue % 2 == 0) {
                    return Text(
                      'Its Even: ${state.counterValue.toString()}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      'Its Odd: ${state.counterValue.toString()}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      // ),
    );
  }
}
