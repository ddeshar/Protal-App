import 'package:get/get.dart';
import 'package:protal_app/Pages/splash_screen.dart';
import 'package:protal_app/modules/show_image/views/list_view_image.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreen;

  static final routes = [
    CustomGetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
    ),
    CustomGetPage(
      name: _Paths.listViewImage,
      page: () => const ListViewImage(),
    ),
  ];
}

class CustomGetPage extends GetPage {
  CustomGetPage({
    required super.name,
    required super.page,
    super.transition = Transition.leftToRightWithFade,
    super.transitionDuration = const Duration(milliseconds: 200),
    super.binding,
  });
}

abstract class Routes {
  Routes._();

  static const splashScreen = _Paths.splashScreen;
  static const listViewImage = _Paths.listViewImage;

}

abstract class _Paths {
  static const splashScreen = '/splashScreen';
  static const listViewImage = '/listViewImage';
}
