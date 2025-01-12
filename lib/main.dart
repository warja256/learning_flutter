import 'package:flutter/material.dart';
import 'package:learning_flutter/adaptive.dart';
import 'package:learning_flutter/chooseImg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Текущий индекс вкладки

  final List<Widget> _screens = [
    const Adaptive(title: 'Adaptive'), // Основной экран
    const ChooseImg(title: 'Pick Your Image'),
    Center(child: Text('Экран 3')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Обновляем текущий индекс вкладки
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Отображаем текущий экран
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Устанавливаем текущий индекс вкладки
        onTap: _onItemTapped, // Обработчик нажатия на вкладку
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Адаптив',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Выбор',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
        ],
      ),
    );
  }
}
