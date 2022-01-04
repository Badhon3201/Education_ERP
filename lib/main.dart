import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_system/feature_app/Auth/view_model/sign_in_view_model.dart';
import 'package:student_management_system/feature_app/splash_screen.dart';

import 'feature_app/Auth/view/login_screen.dart';
import 'feature_app/Auth/view_model/access_token_view_model.dart';

import 'feature_app/student/profile/view_model/fees_list_view_model.dart';
import 'feature_app/student/profile/view_model/profile_get_all_data_view_model.dart';
import 'feature_app/teacher/teacher_dashboard/view_model/class_list_viwe_model.dart';
import 'feature_app/teacher/teacher_dashboard/view_model/student_list_view_model.dart';
import 'main_app/app_navigator.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AccessTokenProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthViewWrapper(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SignInViewModel()),
          ChangeNotifierProvider(
              create: (context) => StudentProfileDataViewModel()),
          ChangeNotifierProvider(create: (context) => StudentFeesViewModel()),
          ChangeNotifierProvider(create: (context) => StudentListViewModel()),
          ChangeNotifierProvider(create: (context) => ClassListViewModel()),
        ],
        child: MaterialApp(
          navigatorKey: appNavigator.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // builder: BotToastInit(),
          // navigatorObservers: [BotToastNavigatorObserver()],
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const SplashScreens(),
        ),
      ),
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
