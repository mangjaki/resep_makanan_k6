import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resep Makanan',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.deepPurple
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: HomeScreen(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO: 1. Deklarasi Variable
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    //const SearchScreen(),
    //const FavoriteScreen(),
    //const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat Properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // TODO: 3. Buat Properti bottomNavigationBar dengan nilai theme
      bottomNavigationBar: Theme(
        // TODO: 4. Buat data dan child dari Theme
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple,),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face, color: Colors.deepPurple,),
              label: 'Profile',
            )
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}

