import 'package:auto_route/auto_route.dart';
import 'package:monirth_memories/core/logger.dart';
import 'package:monirth_memories/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  // final FirebaseAuthenticationService auth = locator<FirebaseAuthenticationService>();
  final log = getLogger('AuthGuard');

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool(Globals.isLoggedIn);
    isLoggedIn ??= false;
    router.replaceNamed('/home');
    // router.pushNamed('/home');

    return;
  }
}

class NotAuthGuard extends AutoRouteGuard {
  // final FirebaseAuthenticationService auth = locator<FirebaseAuthenticationService>();

  final log = getLogger('NotAuthGuard');

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool(Globals.isLoggedIn);

    isLoggedIn ??= false;

    router.replaceNamed('/home');
    // router.pushNamed('/home');
    return;
  }
}


/*
class NotAuthGuard extends AutoRouteGuard {
  final FirebaseAuthenticationService auth =
      locator<FirebaseAuthenticationService>();

  final log = getLogger('NotAuthGuard');

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    bool isAuthenticated = auth.hasUser;

    log.v('Is Not Auth: $isAuthenticated');
    if (isAuthenticated) {
      var userData = await locator<UserService>().user.first;
      if (userData != null) {
        var form = UserEditable.fromModel(userData);
        var profileFieldSet = form.fieldsets[AppString.profile]!;
        // profileFieldSet.removeLast();
        log.v('Is Not profileFieldSet: $profileFieldSet');

        if (!form.fullName.hasValue || !form.email.hasValue) {
          router.replaceNamed('/name-verification');
        } else if (profileFieldSet.contains(false) == true) {
          // router.replaceNamed('/welcome');
          router.replaceNamed('/profile-builder');
        } else if (form.profileBuilderPage != null) {
         
          router.replaceNamed('/profile-builder');
        } else if (locator<SharedPreferencesService>().getFromDisk(
                '${FirebaseAuth.instance.currentUser?.uid}_introduction') !=
            true) {
          router.replaceNamed('/introduction');
        } else {
          router.replaceNamed('/home');
        }
      }
      return;
    }
    resolver.next(!isAuthenticated);
    return;
  }
}
*/
