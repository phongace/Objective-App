import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:objective/screens/dashboard/dashboard.dart';
import 'package:objective/screens/profile/user-profile.dart';
import 'package:objective/styles/component.dart';

class DashboardHomePage extends StatefulWidget {
  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  int _selectedIndex = 0;

  List listPage = [DashboardScreen(), UserProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: CommonStyle.bgColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0),
              topLeft: Radius.circular(25.0),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: buildIcon('images/ic_dashboard_disable.svg'),
                  activeIcon: buildIcon('images/ic_dashboard_active.svg', isActive: true),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: buildIcon('images/ic_profile_disable.svg'),
                  activeIcon: buildIcon('images/ic_profile_active.svg', isActive: true),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).accentColor,
              unselectedItemColor: Theme.of(context).disabledColor,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              showUnselectedLabels: true,
              selectedFontSize: 10,
              unselectedFontSize: 10,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: CommonStyle.primaryColor,
        onPressed: () {
          _addBottomSheet(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _addBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      // isScrollControlled: true,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(20.0),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Text('dadsd'),
                    Container(
                      height: 200,
                      color: Colors.red,
                    ),
                    Container(
                      height: 200,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 200,
                      color: Colors.black,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildIcon(String path, {bool isActive = false}) {
    return SizedBox(
      width: 24,
      height: 24,
      child: SvgPicture.asset(
        path,
        color: isActive ? Theme.of(context).accentColor : Theme.of(context).disabledColor,
        fit: BoxFit.contain,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
