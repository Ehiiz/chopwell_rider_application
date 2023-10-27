import 'dart:async';

import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/authentication/user-utils.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/homePage.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/ordersPage.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/profilePage.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/signUpPage.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:alarm/alarm.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool isTokenExpired(String? token) {
  if (token != null) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    bool isTokenExpired = JwtDecoder.isExpired(token);
    return isTokenExpired;
  }
  return false;
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MaterialApp(home: MyApp(navigatorKey))));
  await Alarm.init();

  await dotenv.load(fileName: ".env");

  String appID = dotenv.get('ONE_SIGNAL_APP_ID');

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.Debug.setAlertLevel(OSLogLevel.none);
  OneSignal.consentGiven(true);
  OneSignal.initialize(appID);

  OneSignal.Notifications.clearAll();

  OneSignal.User.pushSubscription.addObserver((state) {
    OneSignal.User.pushSubscription.optedIn;
    OneSignal.User.pushSubscription.id;
    OneSignal.User.pushSubscription.token;
   state.current.jsonRepresentation();
  });

  OneSignal.Notifications.requestPermission(true).then((value) {
    print("this is permissions vale $value");
    if (value) {
      OneSignal.User.pushSubscription.optIn();
    }
  });



  OneSignal.Notifications.addForegroundWillDisplayListener((event) {
    print(
        'NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');
    final notification = event.notification;

    /// Display Notification, preventDefault to not display
    event.preventDefault();

    /// Do async work

    /// notification.display() to display after preventing default
    event.notification.display();
    if (notification.body == "Successfully paid order") {
      _showPaymentMadeDialog(navigatorKey.currentState!.overlay!.context);

      event.notification.display();
    } else if (notification.title == "Payment Made") {
      _showPaymentMadeDialog(navigatorKey.currentState!.overlay!.context);
      event.notification.display();
    } else {
      event.notification.display();
    }
  });

  OneSignal.InAppMessages.addWillDisplayListener((event) {
    print("ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}");
  });

  OneSignal.InAppMessages.paused(false);
}

void _showPaymentMadeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Payment Made"),
        content: Text("You have made a payment."),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              pushNewScreen(
                context,
                screen: BottomNavBar(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
              ;
            },
          ),
        ],
      );
    },
  );
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp(this.navigatorKey);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<String?> _token;
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    //  getConnectivity();
    super.initState();
    setState(() {
      _token = AuthToken.getAuthToken();
    });
  }

  // getConnectivity() {
  //   subscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) async {
  //     isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //     print(isDeviceConnected);
  //     if (!isDeviceConnected && isAlertSet == false) {
  //       showDialogBox();
  //       setState(() {
  //         isAlertSet = true;
  //       });
  //     }
  //   });
  // }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  showDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("No Connection"),
        content: Text("Please check your internet connection"),
        actions: [
          TextButton(
              onPressed: () async {
                Navigator.pop(context, "Cancel");
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: Text("OK"))
        ],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Chopwell Rider',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Montserrat",
          primaryTextTheme: TextTheme(
            titleLarge: TextStyle(
              fontFamily: "Questrial",
              fontSize: 30.0,
              color: KConstants.baseDarkColor,
            ),
            titleMedium: TextStyle(
              color: KConstants.baseDarkColor,
              fontFamily: "Montserrat",
              fontSize: 25.0,
            ),
          ),
          textTheme: TextTheme(
            bodySmall: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: KConstants.baseThreeDarkColor,
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: KConstants.baseTwoRedColor,
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            disabledColor: KConstants.baseThreeDarkColor,
            splashColor: KConstants.baseFourRedColor,
          )),
      home: FutureBuilder<String?>(
        future: _token,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while we wait for the token to be retrieved
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            // If the token is not present, redirect to the login page
            if (snapshot.data == null) {
              return LoginPage();
            } else {
              if (isTokenExpired(snapshot.data)) {
                // Redirect to the login page if the token has expired
                return LoginPage();
              } else {
                // Redirect to the home page if the token is still valid
                return BottomNavBar();
              }
            }
          }
        },
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late IO.Socket socket;
  Timer? locationTimer;

  String userEmail = "";

  List<Widget> _buildScreens() {
    return [
      const MyHomePage(),
      const MyOrders(),
      const NewProfilePage(),
    ];
  }

  _connectSocket() {
    socket.onConnect((data) => print("Connection established"));
    socket.onConnectError(
        (data) => print("Socket.IO server disconnected : $data"));
    socket.onConnectTimeout((data) => print("Socket.io server timeout $data"));
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house),
        title: "Home",
        textStyle: const TextStyle(
          fontFamily: "Questrial",
        ),
        activeColorPrimary: KConstants.baseRedColor,
        inactiveColorPrimary: KConstants.baseFourDarkColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.square_stack_3d_up),
        title: "Orders",
        textStyle: const TextStyle(fontFamily: "Questrial"),
        activeColorPrimary: KConstants.baseRedColor,
        inactiveColorPrimary: KConstants.baseFourDarkColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: "Profile",
        // ignore: prefer_const_constructors
        textStyle: TextStyle(fontFamily: "Questrial"),
        activeColorPrimary: KConstants.baseRedColor,
        inactiveColorPrimary: KConstants.baseFourDarkColor,
      ),
    ];
  }

  int currentIndex = 0;

  // ignore: prefer_final_fields
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
    // Initialize the Socket.io client and connect to the server
    // Replace 'your_socket_server_url' with the actual URL of your Socket.io server
    socket = IO.io("https://api.chopwell.ng",
        IO.OptionBuilder().setTransports(["websocket"]).build());
    _connectSocket();

    // Start the periodic location update timer
    startLocationUpdateTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startLocationUpdateTimer() {
    const updateInterval =
        Duration(minutes: 3); // Update interval of 10 minutes
    locationTimer = Timer.periodic(updateInterval, (Timer timer) {
      // Call the method to send the location data over the socket
      getUserLocation();
    });
  }

  // Method to send user location data over the socket
  void sendUserLocationData(double latitude, double longitude) {
    if (socket.connected) {
      // Send the location data as a JSON object to the server
      socket.emit('userLocation', {
        'userEmail': userEmail,
        'latitude': latitude,
        'longitude': longitude,
      });
    }
  }

  // Example method to get user location data (you may use a location plugin for this)
  void getUserLocation() async {
    // Call the method to send the location data over the socket
    final position = await getCurrentLocation();
    final user = await UserInfo.getUserInfo();
    final _user = user as Map<String, dynamic>;

    setState(() {
      userEmail = user?["phone_number"];
    });

    sendUserLocationData(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Visibility(
            visible: currentIndex != 2,
            child: PersistentTabView(
              context,
              controller: _controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
              confineInSafeArea: true,
              backgroundColor: Colors.white, // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows:
                  true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: Colors.white,
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties(
                // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.elasticIn,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle
                  .style1, // Choose the nav bar style with this property.
            )),
        onWillPop: () async {
          return false;
        });
  }
}
