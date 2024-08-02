import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ekranYuksekligi / 10),
        child: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: "Delivery"),
              Tab(text: "Pickup"),
              Tab(text: "Dine-in"),
            ],
            unselectedLabelColor: Colors.black87,
            labelColor: Colors.black87,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.black87,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: "Browse"),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(color: Colors.black87, applyTextScaling: true),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildPage(context, ekranGenisligi, ekranYuksekligi),
          buildPage(context, ekranGenisligi, ekranYuksekligi),
          buildPage(context, ekranGenisligi, ekranYuksekligi),
        ],
      ),
    );
  }

  SingleChildScrollView buildPage(BuildContext context, double ekranGenisligi, double ekranYuksekligi) {
    return SingleChildScrollView(
          child: Column(
            children: [
              buildLocation(context),
              buildNavbar1(ekranGenisligi, ekranYuksekligi, context),
              SizedBox(height: ekranGenisligi / 50),
              buildNavbar2(ekranGenisligi, ekranYuksekligi, context),
              buildCards(ekranYuksekligi, ekranGenisligi),
            ],
          ),
        );
  }

  Row buildNavbar2(double ekranGenisligi, double ekranYuksekligi, BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: ekranGenisligi / 3.06,
                  height: ekranYuksekligi / 7,
                  child: Card(
                    color: Color.fromARGB(255, 252, 252, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: ekranGenisligi / 5,
                            child: Image.asset("images/convenience.png"),
                          ),
                        ),
                        Text(
                          "Convenience",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: ekranGenisligi / 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: ekranGenisligi / 3.06,
                  height: ekranYuksekligi / 7,
                  child: Card(
                    color: Color.fromARGB(255, 252, 252, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: ekranGenisligi / 6,
                            child: Image.asset("images/alcohol.png"),
                          ),
                        ),
                        Text(
                          "Alcohol",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: ekranGenisligi / 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: ekranGenisligi / 3.06,
                  height: ekranYuksekligi / 7,
                  child: Card(
                    color: Color.fromARGB(255, 252, 252, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: ekranGenisligi / 4,
                            child: Image.asset("images/ride.png"),
                          ),
                        ),
                        Text(
                          "Ride",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: ekranGenisligi / 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
  }

  Row buildNavbar1(double ekranGenisligi, double ekranYuksekligi, BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: ekranGenisligi / 2.06,
                  height: ekranYuksekligi / 7,
                  child: Card(
                    color: Color.fromARGB(255, 252, 252, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Restaurants",
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: ekranGenisligi / 19,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            width: ekranGenisligi / 4,
                            child: Image.asset("images/restaurant_icon.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: ekranGenisligi / 2.06,
                  height: ekranYuksekligi / 7,
                  child: Card(
                    color: Color.fromARGB(255, 252, 252, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Grocery",
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: ekranGenisligi / 19,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: ekranGenisligi / 7,
                          child: Image.asset("images/grocery.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
  }

  Row buildLocation(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Now - Pemberton Walk",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.account_tree_outlined,
                    color: Colors.black87,
                  ),
                ),
              ],
            );
  }

  SizedBox buildCards(double ekranYuksekligi, double ekranGenisligi) {
    return SizedBox(
                height: ekranYuksekligi * 0.5,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: ekranGenisligi / 50,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              SizedBox(
                                width: ekranGenisligi / 1.1,
                                child: Image.asset("images/pizza.png"),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                    child: Text(
                                      'DOMINOS PIZZA , Bury St Edmunds',
                                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ekranGenisligi / 30,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Text(
                                      '4.6',
                                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ekranGenisligi / 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0, bottom: 8),
                                    child: Text(
                                      "Sponsored",
                                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w300,
                                        fontSize: ekranGenisligi / 30,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      " * £2.29 Delivery Fee * 21-26 min",
                                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: ekranGenisligi / 30,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
  }
}
