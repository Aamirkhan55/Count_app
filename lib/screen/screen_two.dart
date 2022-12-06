import 'package:count_app/count_data.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  final CountData _countData = CountData();

  ScreenTwo({super.key});
  //  ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen Two'),
      ),
      body:  Center(
        child: Container(
          height: 220,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _countData.addData();
                      },
                      child: const Icon(
                        Icons.add,
                        size: 40,
                      ),
                  ),
                  const  SizedBox(width:  10),
                  ElevatedButton(
                      onPressed: () {
                        _countData.subData();
                      },
                      child: const Icon(
                        Icons.remove,
                        size:  40,
                      ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
