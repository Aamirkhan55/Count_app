import 'package:count_app/count_data.dart';
import 'package:count_app/screen/screen_one.dart';
import 'package:count_app/screen/screen_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey, // foreground (text) color
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late int _startCount;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _startCount = CountData.count.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _changePage(index);
                },
                children:  [
                  const ScreenOne(),
                  ScreenTwo(),
                ],
              ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  void _changePage (int index) {
   setState(() {
     selectedIndex = index;
   });
  }

  BottomNavigationBar bottomNavBar () {
    return BottomNavigationBar(
      items:[
        BottomNavigationBarItem(
           label: "File",
            icon: ValueListenableBuilder(
                valueListenable: CountData.count,
                builder: (context, subCount, child) {
                  return Stack(
                    children: [
                      const Icon(Icons.file_copy),
                      if(subCount > _startCount)
                        Container(
                          color: Colors.green,
                          child: Text(
                              "+${CountData.count.value - _startCount}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      if(subCount < _startCount)
                        Container(
                          color: Colors.red,
                          child: Text(
                            "-${_startCount - CountData.count.value}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  );
                })
        ),
        const BottomNavigationBarItem(
          label: 'Save',
            icon: Icon(Icons.save,
            ), )
      ],
      currentIndex: selectedIndex,
      backgroundColor: Colors.blueGrey,
      selectedItemColor: Colors.white,
      onTap: _onBottomNavBarItemTapped,
    );
  }

  void _onBottomNavBarItemTapped (int index) {
    setState(() {
      selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }
}

