import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future futureCall() async {
    int counter = 5;
    await Future.delayed(const Duration(seconds: 5));
    return counter * counter;
  }

  Stream streamCall() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 5));
      yield counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: futureCall(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 31),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            SizedBox(height: 11),
            StreamBuilder(
              stream: streamCall(),
              builder: (context, AsyncSnapshot snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 31),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
