import 'package:coffee_app/core/constant/routes.dart';
import 'package:coffee_app/core/middleware/mymiddleware.dart';
import 'package:coffee_app/view/screen/address/add.dart';
import 'package:coffee_app/view/screen/address/adddetails.dart';
import 'package:coffee_app/view/screen/address/view.dart';
//import 'package:coffee_app/test_view.dart';

import 'package:coffee_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:coffee_app/view/screen/auth/forgetpassword/verifycodesignup.dart';
import 'package:coffee_app/view/screen/auth/login.dart';
import 'package:coffee_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:coffee_app/view/screen/auth/signup.dart';
import 'package:coffee_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:coffee_app/view/screen/auth/success_signup.dart';
import 'package:coffee_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:coffee_app/view/screen/checkout.dart';
import 'package:coffee_app/view/screen/homescreen.dart';
import 'package:coffee_app/view/screen/items.dart';
import 'package:coffee_app/view/screen/langauge.dart';
import 'package:coffee_app/view/screen/myfavorite.dart';

import 'package:coffee_app/view/screen/orders/archive.dart';
import 'package:coffee_app/view/screen/orders/details.dart';
import 'package:coffee_app/view/screen/orders/pending.dart';
import 'package:coffee_app/view/screen/productdetails.dart';
import 'package:coffee_app/view/widget/orders/tracking.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'view/screen/onbroading.dart';
import 'package:coffee_app/view/screen/cart.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.orderstracking, page: () => const OrdersTracking()),
  // GetPage(name: AppRoute.offers, page: () => const OffersView()),

  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
];
