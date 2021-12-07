import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_practice/logic/cubits/counter_cubit.dart';
import 'package:provider_practice/presentation/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  String title;
  Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState createState() => _HomeScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 12),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 200),
                      content: Text('Incremented')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 200),
                      content: Text('Decremented')));
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
            // const SizedBox(height: 24),
            // // Row(
            // //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // //   children: [
            // //     FloatingActionButton(
            // //       onPressed: () {
            // //         context.read<CounterCubit>().decrement();
            // //       },
            // //       heroTag: "btn1",
            // //       tooltip: 'Decrement',
            // //       child: const Icon(Icons.remove),
            // //     ),
            // //     FloatingActionButton(
            // //       onPressed: () {
            // //         context.read<CounterCubit>().increment();
            // //       },
            // //       heroTag: "btn2",
            // //       tooltip: 'Increment',
            // //       child: const Icon(Icons.add),
            // //     ),
            // //   ],
            // // ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              child: const Text('Go to Second Screen'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
                // MaterialPageRoute(
                //   builder: (_) => BlocProvider.value(
                //     value: context.read<CounterCubit>(),
                //     child: SecondScreen(title: 'Second Screen', color: Colors.redAccent)
                //   )
                // ));
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.greenAccent,
              textColor: Colors.white,
              child: const Text('Go to Third Screen'),
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
                // MaterialPageRoute(
                //   builder: (_) => BlocProvider.value(
                //       value: context.read<CounterCubit>(),
                //       child: SecondScreen(
                //           title: 'Third Screen',
                //           color: Colors.greenAccent))));
              },
            )
          ],
        ),
      ),
    );
  }
}
