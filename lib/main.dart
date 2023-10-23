import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_workshop/beer/beer.dart';
import 'package:flutter_workshop/beer/beer_service.dart';
import 'package:flutter_workshop/theming/sizes.dart';
import 'package:flutter_workshop/theming/workshop_theme.dart';
import 'package:flutter_workshop/widgets/your_own_widget.dart';

void main() {
  runApp(const FlutterWorkshop(
    beerService: BeerService(),
  ));
}

class FlutterWorkshop extends StatelessWidget {
  const FlutterWorkshop({super.key, this.beerService = const BeerService()});

  final BeerService beerService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workshop',
      theme: WorkshopTheme.theme,
      home: MyHomePage(
        title: 'Flutter Workshop',
        beerService: beerService,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.beerService = const BeerService()});

  final String title;
  final BeerService beerService;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Beer> beers = [];
  //Step 5: remove this comment te create the controller:  late ConfettiController controller;

  @override
  void initState() {
    super.initState();
    loadBeers();

    //Step 5: remove this comment te initialize the controller:  controller = ConfettiController(duration: const Duration(seconds: 1));
  }

  void loadBeers() async {
    List<Beer> reponse = await widget.beerService.fetchBeers();
    setState(() => beers = reponse);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    //Step 5: remove this comment te create the controller:  controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            // Step 2: Change the logo to your own logo here!
            Image.asset('assets/dcc_logo.png', height: Sizes.xl),
            const SizedBox(width: Sizes.m),
            Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
      body: beers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Sizes.m),
                  child: ListView(
                    children: <Widget>[
                      Text(
                        'Amount of beers you have tapped: $_counter',
                      ),
                      ...List.generate(min(_counter, beers.length), (index) => YourOwnWidget(beer: beers[index])),
                    ],
                  ),
                ),
                //Step 5: Add the ConfettiWidget here:
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
