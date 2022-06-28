import 'package:flutter/material.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/beranda_pembeli_page.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/beranda_penjual_page.dart';

class LandingPage extends StatefulWidget {
  LoginEntity? entity;
  LandingPage({Key? key, this.entity}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetPenjual = [
    BerandaPenjualPage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  List<Widget> _widgetPembeli = [
    BerandaPembeliPage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.entity!.userKategori.toString() == "1" ?
        [
          BerandaPenjualPage(
            entity: widget.entity!,
          ),
          Text(
            'Index 1: Business',
            style: optionStyle,
          ),
          Text(
            'Index 2: School',
            style: optionStyle,
          ),
        ].elementAt(_selectedIndex)
        :
        [
          BerandaPembeliPage(
            entity: widget.entity!,
          ),
          Text(
            'Index 1: Business',
            style: optionStyle,
          ),
          Text(
            'Index 2: School',
            style: optionStyle,
          ),
        ].elementAt(_selectedIndex)
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ListColor().baseColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}