import 'package:flutter/material.dart';

enum MenuChoice {home, recipes, shoppinglist}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MenuChoice _selectedMenuChoice = MenuChoice.home;
  String _appBarTitle = 'Home';
  //Widget _homeScreenWidget = TODO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: _buildContent(),
    );
  }

  _buildContent() {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 200.0,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero, 
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                selected: _selectedMenuChoice == MenuChoice.home,
                onTap: () {
                  _onItemTapped(MenuChoice.home);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.layers_outlined),
                title: const Text('Recipes'),
                selected: _selectedMenuChoice == MenuChoice.recipes,
                onTap: () {
                  _onItemTapped(MenuChoice.recipes);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.list_alt),
                title: const Text('Shopping List'),
                selected: _selectedMenuChoice == MenuChoice.shoppinglist,
                onTap: () {
                  _onItemTapped(MenuChoice.shoppinglist);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _onItemTapped(MenuChoice choice) {
    setState(() {
      _selectedMenuChoice = choice;
      switch (choice) {
        case MenuChoice.home:
          _appBarTitle = 'Home';
        case MenuChoice.recipes:
          _appBarTitle = 'Recipes';
        case MenuChoice.shoppinglist:
          _appBarTitle = 'Shopping List';
        break;
      }
    });
  }
}