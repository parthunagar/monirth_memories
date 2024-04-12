
import 'package:monirth_memories/core/services/shared_preferences_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [],
  dependencies: [
    
    // LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: NavigationService),
    Singleton(classType: DialogService),
    Singleton(classType: SnackbarService),
    Singleton(classType: BottomSheetService),
    // Presolve(classType: LocationService,presolveUsing: LocationService.getInstance),
    // LazySingleton(classType: AlgoliaService, resolveUsing: AlgoliaService.getInstance),
    Presolve(
        classType: SharedPreferencesService,
        presolveUsing: SharedPreferencesService.getInstance),
  ],
  logger: StackedLogger(),
)
class $App {
  /** Serves no purpose besides having an annotation attached to it */
}
