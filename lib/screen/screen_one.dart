import 'package:count_app/count_data.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen One'),
      ),
      body: Center(
        child: Container(
          height: 220,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              const Text('Number of Count :',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 25,
                color: Colors.white,
              ),
              ),
              ValueListenableBuilder(
                  valueListenable: CountData.count,
                  builder: (context, subCount, child) {
                  return Text('${CountData.count.value}',
                  style: const TextStyle(
                    fontSize: 24.5,
                    color: Colors.white,
                  ),);

                  })
            ],
          ),
        ),
      ),
    );
  }
}
