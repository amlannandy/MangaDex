import 'package:fluro/fluro.dart';

import 'package:mangadex_mobile/routing/route_handler.dart';

class Routes {
  static const init = "/";

  // Auth
  static const login = "/login";
  static const register = "/register";

  static void configureRouter(FluroRouter router) {
    router.define(init, handler: initHandler);

    // Auth
    router.define(
      login,
      handler: loginHandler,
      transitionType: TransitionType.native,
    );
    router.define(
      register,
      handler: registerHandler,
      transitionType: TransitionType.native,
    );
  }
}
