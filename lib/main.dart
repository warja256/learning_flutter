import 'package:flutter/material.dart';
import 'package:learning_flutter/adaptive.dart';
import 'package:learning_flutter/chooseImg.dart';
import 'package:learning_flutter/favourite.dart';
import 'package:learning_flutter/pat.dart';

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
        useMaterial3: false, // Отключаем использование Material 3
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
    const FavouritePets(title: 'Favourite Pets'),
    const Pat(title: 'Pat Your Pet')
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
          currentIndex: _currentIndex, // Текущий индекс вкладки
          onTap: _onItemTapped, // Обработчик нажатия на вкладку
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor, // Фон навигации
          selectedItemColor:
              Theme.of(context).colorScheme.primary, // Цвет для активной иконки
          unselectedItemColor: Theme.of(context)
              .colorScheme
              .onSurface
              .withOpacity(0.6), // Цвет для неактивных иконок
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
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: 'Погладить',
            ),
          ],
        ));
  }
}
