import 'package:flutter/material.dart';

import 'feature_app/Auth/view/login_screen.dart';
import 'feature_app/dashboard/view/dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: appNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // builder: BotToastInit(),
      // navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: DashboardScreen(),
      home: SplashScreens(),
      // home: NewsScreen(),
      // routes: {
      //   DetailsPage.routeName: (context)=>DetailsPage(),
      //   CartScreen.routeName: (context)=>CartScreen(),
      // },
    );
    // return AuthViewWrapper(
    //   child: MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(create: (context) => ProductViewModel()),
    //       ChangeNotifierProvider(create: (context) => ProductCatViewModel()),
    //       ChangeNotifierProvider(
    //           create: (context) => CustomerSignInViewModel()),
    //       ChangeNotifierProvider(
    //           create: (context) => CustomerSignUpViewModel()),
    //       ChangeNotifierProvider(create: (context) => ResetPasswordViewModel()),
    //       ChangeNotifierProvider(create: (context) => ProfileViewModel()),
    //       ChangeNotifierProvider(create: (context) => WishListViweModel()),
    //       ChangeNotifierProvider(create: (context) => CartViewModel()),
    //       ChangeNotifierProvider(create: (context) => AuthViewModel()),
    //       ChangeNotifierProvider(create: (context) => CartResponseViewModel()),
    //       ChangeNotifierProvider(create: (context) => LogOutViewModel()),
    //       ChangeNotifierProvider(create: (context) => HotProductViewModel()),
    //       ChangeNotifierProvider(create: (context) => RefreshViewModel()),
    //       ChangeNotifierProvider(create: (context) => AboutUsViewModel()),
    //       ChangeNotifierProvider(
    //           create: (context) => ShippingAddressViewModel()),
    //       ChangeNotifierProvider(
    //           create: (context) => CarouselSliderViewModel()),
    //       ChangeNotifierProvider(create: (context) => PrivacyPolicyViewModel()),
    //       ChangeNotifierProvider(
    //           create: (context) => ChangePasswordViewModel()),
    //       ChangeNotifierProvider(
    //           create: (context) => TermsAndConditionsViewModel()),
    //       ChangeNotifierProvider(create: (context) => UpdateProfileViewModel()),
    //       ChangeNotifierProvider(create: (context) => CheckoutViewModel()),
    //       ChangeNotifierProvider(create: (context) => PlaceOrderViewModel()),
    //       ChangeNotifierProvider(
    //           create: (context) => BillingAddressViewModel()),
    //     ],
    //     child: MaterialApp(
    //       navigatorKey: appNavigator.navigatorKey,
    //       debugShowCheckedModeBanner: false,
    //       title: 'Flutter Demo',
    //       builder: BotToastInit(),
    //       navigatorObservers: [BotToastNavigatorObserver()],
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //         visualDensity: VisualDensity.adaptivePlatformDensity,
    //       ),
    //       // home: DashboardScreen(),
    //       home: SplashScreens(),
    //       // home: NewsScreen(),
    //       // routes: {
    //       //   DetailsPage.routeName: (context)=>DetailsPage(),
    //       //   CartScreen.routeName: (context)=>CartScreen(),
    //       // },
    //     ),
    //   ),
    // );
  }
}

class SplashScreens extends StatelessWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardPage()));
              },
              child: Text('Login'))),
    );
  }
}
