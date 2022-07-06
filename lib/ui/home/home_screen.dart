import 'package:flutter/material.dart';
import 'package:paw_record/ui/activities/activities_screen.dart';
import 'package:paw_record/ui/dashboard/dashboard_screen.dart';
import 'package:paw_record/ui/detailviews/detailview_screen.dart';
import 'package:paw_record/ui/profile/profile_screen.dart';
import 'package:paw_record/ui/register/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int pageIndex = 0;

    final pages = [
      const DashboardScreen(),

      const DetailViewScreen(),

      const ProfileScreen()
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor:  Colors.white,

        body: pages[pageIndex],
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                  Icons.home_filled,
                  color: Color(0xFF8017DA),
                  size: 25,
                )
                    : const Icon(
                  Icons.home_outlined,
                  color: Color(0xFF656566),
                  size: 25,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                  Icons.pets,
                  color: Color(0xFF8017DA),

                  size: 25,
                )
                    : const Icon(
                  Icons.pets,
                  color:Color(0xFF656566),
                  size: 25,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                  Icons.person,
                  color: Color(0xFF8017DA),
                  size: 25,
                )
                    : const Icon(
                  Icons.person_outline,
                  color: Color(0xFF656566),
                  size: 25,
                ),
              ),

            ],
          ),
        ),
      );
  /*  return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.white,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );*/
  }
}
