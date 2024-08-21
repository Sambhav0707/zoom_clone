import 'package:flutter/material.dart';
import 'package:zoom_clone/Utils/colors.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _page =0;

  onPageChanged(int page){
    setState(() {
      _page = page;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Meet & Chat'),
          elevation: 0,
          backgroundColor: backgroundColor,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          unselectedFontSize: 14,
          onTap: onPageChanged,
          currentIndex: _page,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank),
                label: 'Meet & Chat'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock),
                label: 'Meetings'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Contacts'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings'
            ),


          ],
        ),
      ),
    );
  }
}
