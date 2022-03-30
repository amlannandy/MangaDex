import 'package:fluro/fluro.dart';
import 'package:mangadex_mobile/routing/route_handler.dart';

class Routes {
  static const home = "/";

  // Auth
  static const login = "/login";
  static const register = "/register";

  static void configureRouter(FluroRouter router) {
    router.define(home, handler: homeHandler);

    // Auth
    router.define(
      login,
      handler: loginHandler,
      transitionType: TransitionType.native,
    );
  }
}
