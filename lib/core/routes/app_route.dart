import 'package:get/get.dart';
import 'package:outkast/core/binding/main/main_binding.dart';
import 'package:outkast/views/pages/auth/create_account_page.dart';
import 'package:outkast/views/pages/auth/create_new_password_page.dart';
import 'package:outkast/views/pages/auth/forgot_password_page.dart';
import 'package:outkast/views/pages/auth/onboard_page.dart';
import 'package:outkast/views/pages/auth/password_changed_page.dart';
import 'package:outkast/views/pages/auth/sign_in_page.dart';
import 'package:outkast/views/pages/main/class_detail.dart';
import 'package:outkast/views/pages/main/main_page.dart';
import 'package:outkast/views/pages/main/profile_setting.dart';
import 'package:outkast/views/pages/main/search_activity_page.dart';

class AppRoute {
  //Authentication Routes
  static const String initial = '/';
  static const String signIn = '/sign-in';
  static const String createAccount = '/create-account';
  static const String forgotPassword = '/forgot-password';
  static const String createNewPassword = '/create-new-password';
  static const String passwordChanged = '/password-changed';

  //Main Routes
  static const String main = '/main';
  static const String home = '/home';
  static const String reservations = '/reservations';
  static const String profile = '/profile';
  static const String searchActivity = '/search-activity';
  static const String profileSetting = '/profile-setting';
  static const String classDetail = '/class-detail';

  // Authentication Getters
  static String getInitial() => initial;
  static String getSignIn() => signIn;
  static String getCreateAccount() => createAccount;
  static String getForgotPassword() => forgotPassword;
  static String getCreateNewPassword() => createNewPassword;
  static String getPasswordChanged() => passwordChanged;

  // Main Getters
  static String getMain() => main;
  static String getSearchActivity() => searchActivity;
  static String getProfileSetting() => profileSetting;
  static String getClassDetail() => classDetail;

  //Pages
  static List<GetPage> pages = [
    //Authentication Pages
    GetPage(name: initial, page: () => OnboardPage()),
    GetPage(name: signIn, page: () => SignInPage()),
    GetPage(name: createAccount, page: () => CreateAccountPage()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordPage()),
    GetPage(name: createNewPassword, page: () => CreateNewPassword()),
    GetPage(name: passwordChanged, page: () => PasswordChangedPage()),

    //Main Pages
    GetPage(name: main, page: () => const MainPage(), binding: MainBinding()),
    GetPage(name: searchActivity, page: () => const SearchActivityPage()),
    GetPage(name: profileSetting, page: () => const ProfileSetting()),
    GetPage(name: classDetail, page: () => const ClassDetail()),
  ];
}
