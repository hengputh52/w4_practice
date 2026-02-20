import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Home()),
    ),
  );
}

enum CardType { red, blue }

class ColorService extends ChangeNotifier {
  int redCount = 0;
  int blueCount = 0;

  int get _redCount => redCount;
  int get _blueCount => blueCount;

  void onRedTap() {
    redCount++;
    notifyListeners();
  }

  void onBlueTap() {
    blueCount++;
    notifyListeners();
  }
}

ColorService colorService = ColorService();

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ListenableBuilder(
              listenable: colorService,
              builder: (context, child) => Column(
                children: [
                  TextButton(
                    onPressed: colorService.onRedTap,
                    child: Text(colorService._redCount.toString()),
                  ),
                  TextButton(
                    onPressed: colorService.onBlueTap,
                    child: Text(colorService._blueCount.toString()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ?  ColorTapsScreen()
            
          : StatisticsScreen(),
            
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {


  const ColorTapsScreen({
    super.key,

  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: CardType.red),

          ColorTap(type: CardType.blue),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;


  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorService,
      builder: (context, child) => GestureDetector(
        onTap: type == CardType.blue
            ? colorService.onBlueTap
            : colorService.onRedTap,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: 100,
          child: Center(
            child: type == CardType.blue
                ? Text(
                    "Taps : ${colorService._blueCount.toString()}",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )
                : Text("Taps : ${colorService._redCount.toString()}",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {


  const StatisticsScreen({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Red Taps: ${colorService._redCount}', style: TextStyle(fontSize: 24)),
            Text('Blue Taps: ${colorService._blueCount}', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
