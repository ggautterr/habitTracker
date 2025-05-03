import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List pages = [
    Home(),
    Center(child: Text('Activity')),
    Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcff),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png'),
            activeIcon: Image.asset('assets/images/home_a.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/activity.png'),
            activeIcon: Image.asset('assets/images/activity_a.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/settings.png'),
            activeIcon: Image.asset('assets/images/settings_a.png'),
            label: '',
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Sun, 1 March 2022",
                style: TextStyle(
                  color: Color(0xff2f2f2f),
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            spacing: 5,
            children: [
              Text(
                "Hello,",
                style: TextStyle(
                  color: Color(0xff2f2f2f),
                  fontFamily: 'Nunito',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Susy!",
                style: TextStyle(
                  color: Color(0xffff5C00),
                  fontFamily: 'Nunito',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 190,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/home_page/bg_home.png'),
                  ),
                ),
                child: Column(children: []),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
