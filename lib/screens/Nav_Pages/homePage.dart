import 'package:chopwell_rider_application/screens/Nav_Pages/ordersPage.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_progress_bar.dart';
import 'package:chopwell_rider_application/screens/subPages/orderProgressPage.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_rider_application/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int _currentIndex = 0;
final List<Widget> _children = [];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Store Summary',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'today',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // DropdownMenu(dropdownMenuEntries: [
                    //   DropdownMenuEntry(value: "today", label: "today"),
                    //   DropdownMenuEntry(value: "this week", label: "this week"),
                    // ])
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                balanceBox(
                  label: "balance",
                  figure: '\$3000',
                  bgColor: KConstants.baseGreenColor,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight * 0.3,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    balanceBox(
                        bgColor: KConstants.baseOrangeColor,
                        label: "orders",
                        figure: "200",
                        screenWidth: screenWidth * 0.45,
                        screenHeight: screenHeight),
                    balanceBox(
                        label: "sales",
                        figure: "\$2300",
                        bgColor: KConstants.baseTwoRedColor,
                        screenWidth: screenWidth * 0.45,
                        screenHeight: screenHeight),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyOrders();
                    }));
                  },
                  child: OrderProgressBar(
                      KConstants.baseFourGreyColor,
                      Offset(5, 5),
                      "assets/Restaurant.svg",
                      "View Restaurant",
                      "see your menu",
                      "view",
                      KConstants.baseRedColor,
                      KConstants.baseGreyColor),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Top Sellers",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20.0,
                    color: KConstants.baseTwoGreyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: screenHeight * 0.7,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0)),
                            margin: EdgeInsets.all(5.0),
                            child:
                                Image.asset(KConstants.restaurantImages[index]),
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class balanceBox extends StatelessWidget {
  const balanceBox({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.figure,
    required this.label,
    required this.bgColor,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String figure;
  final String label;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 5.0),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              figure,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "Montserrat"),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: "Montserrat"),
            ),
          ],
        ),
      ),
    );
  }
}
