// ignore_for_file: constant_identifier_names

// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

// A Navigator observer that notifies RouteAwares of changes to state of their Route
final routeObserver = RouteObserver<PageRoute>();

mixin RouteAwareAnalytics<T extends StatefulWidget> on State<T>
    implements RouteAware {
  AnalyticsRoute get route;

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {}

  @override
  void didPopNext() {
    // Called when the top route has been popped off,
    // and the current route shows up.
    // _setCurrentScreen(route);
  }

  @override
  void didPush() {
    // Called when the current route has been pushed.
    // _setCurrentScreen(route);
  }

  @override
  void didPushNext() {}

  // Future<void> _setCurrentScreen(AnalyticsRoute analyticsRoute) {
  //   return FirebaseAnalytics.instance.setCurrentScreen(
  //     screenName: screenName(analyticsRoute),
  //     screenClassOverride: screenClass(analyticsRoute),
  //   );
  // }
}

enum AnalyticsRoute {
  Splash,
  Login,
  Home,
  AddVisit,
  UpdateVisit,
  ApplyLeave,
  UpdateLeave,
  CreateExpense,
  UpdateExpense,
  Devices,
  Vehicles,
  VehicleDetails,
  LiveTracking,
  Policies,
  PolicyDetails,
  Scoreboard,
  Agents,
  AddAgent,
  AgentDetails,
  EditAgentDetails,
  AvailableDevices,
  AllDevices,
  DeviceDetails,
  AssignedDevices,
  SafeDrivers,
  LowMileUsers,
  AddPolicy,
  UpdateProfile,
  ForgotPassword,
  BranchManager,
  BranchManagerDetails,
  EditBranchManagerDetails,
  ChangePassword,
  Notifications,
  AddBranchManager,
  AddVehicle
}

String screenClass(AnalyticsRoute route) {
  switch (route) {
    case AnalyticsRoute.Splash:
      return 'SplashScreen';
    case AnalyticsRoute.Login:
      return 'LoginScreen';
    case AnalyticsRoute.Home:
      return 'DashboardScreen';
    case AnalyticsRoute.AddVisit:
      return 'UploadVisitedLocation';
    case AnalyticsRoute.UpdateVisit:
      return 'UpdateVisitedLocation';
    case AnalyticsRoute.ApplyLeave:
      return 'ApplyLeave';
    case AnalyticsRoute.UpdateLeave:
      return 'UpdateEmployeeLeave';
    case AnalyticsRoute.CreateExpense:
      return 'CreateExpense';
    case AnalyticsRoute.UpdateExpense:
      return 'UpdateExpense';
    case AnalyticsRoute.Devices:
      return 'DevicesScreen';
    case AnalyticsRoute.AvailableDevices:
      return 'AvailableDevicesScreen';
    case AnalyticsRoute.AllDevices:
      return 'AllDevicesScreen';
    case AnalyticsRoute.DeviceDetails:
      return 'DeviceDetailsScreen';
    case AnalyticsRoute.AssignedDevices:
      return 'AssignedDevicesScreen';
    case AnalyticsRoute.Vehicles:
      return 'VehiclesScreen';
    case AnalyticsRoute.VehicleDetails:
      return 'VehicleDetailsScreen';
    case AnalyticsRoute.LiveTracking:
      return 'LiveTrackingScreen';
    case AnalyticsRoute.Policies:
      return 'PoliciesListScreen';
    case AnalyticsRoute.AddPolicy:
      return 'AddPolicyScreen';
    case AnalyticsRoute.PolicyDetails:
      return 'PolicyDetailsScreen';
    case AnalyticsRoute.SafeDrivers:
      return 'SafeDriversScreen';
    case AnalyticsRoute.LowMileUsers:
      return 'LowmileUsersScreen';
    case AnalyticsRoute.Agents:
      return 'AgentsListScreen';
    case AnalyticsRoute.AddAgent:
      return 'AddAgentScreen';
    case AnalyticsRoute.AgentDetails:
      return 'AgentDetailsScreen';
    case AnalyticsRoute.EditAgentDetails:
      return 'EditAgentDetailsScreen';
    case AnalyticsRoute.Scoreboard:
      return 'ScoreboardScreen';
    case AnalyticsRoute.ForgotPassword:
      return 'ForgotPasswordScreen';
    case AnalyticsRoute.ChangePassword:
      return 'ChangePasswordScreen';
    case AnalyticsRoute.BranchManager:
      return 'BranchManagersScreen';
    case AnalyticsRoute.BranchManagerDetails:
      return 'BranchManagerDetails';
    case AnalyticsRoute.EditBranchManagerDetails:
      return 'EditBranchManagerDetails';
    case AnalyticsRoute.AddBranchManager:
      return 'AddBranchManagerScreen';
    case AnalyticsRoute.AddVehicle:
      return 'AddVehicleScreen';
    case AnalyticsRoute.Notifications:
      return 'Notifications';
    default:
      return '';
  }
  // throw ArgumentError.notNull('route');
}

String screenName(AnalyticsRoute route) {
  switch (route) {
    case AnalyticsRoute.Splash:
      return '/splash';
    case AnalyticsRoute.Login:
      return '/login';
    case AnalyticsRoute.Home:
      return '/dashboard';
    case AnalyticsRoute.ApplyLeave:
      return '/applyLeave';
    case AnalyticsRoute.UpdateLeave:
      return '/updateemployeeleave';
    case AnalyticsRoute.CreateExpense:
      return '/createExpense';
    case AnalyticsRoute.UpdateExpense:
      return '/updateExpense';
    case AnalyticsRoute.Devices:
      return '/devices';
    case AnalyticsRoute.AvailableDevices:
      return '/availabledevices';
    case AnalyticsRoute.AllDevices:
      return '/alldevices';
    case AnalyticsRoute.DeviceDetails:
      return 'DeviceDetailsScreen';
    case AnalyticsRoute.AssignedDevices:
      return '/assigneddevices';
    case AnalyticsRoute.Vehicles:
      return '/vehicles';
    case AnalyticsRoute.VehicleDetails:
      return '/vehicledetails';
    case AnalyticsRoute.LiveTracking:
      return '/livetracking';
    case AnalyticsRoute.Agents:
      return '/agents';
    case AnalyticsRoute.AddAgent:
      return '/addagent';
    case AnalyticsRoute.AgentDetails:
      return '/agentdetails';
    case AnalyticsRoute.EditAgentDetails:
      return '/editagentdetails';
    case AnalyticsRoute.Policies:
      return '/policies';
    case AnalyticsRoute.AddPolicy:
      return '/addpolicy';
    case AnalyticsRoute.PolicyDetails:
      return '/policydetails';
    case AnalyticsRoute.SafeDrivers:
      return '/safedrivers';
    case AnalyticsRoute.LowMileUsers:
      return '/lowmileusers';
    case AnalyticsRoute.BranchManager:
      return '/branchmanagers';
    case AnalyticsRoute.BranchManagerDetails:
      return '/branchmanagerdetails';
    case AnalyticsRoute.EditBranchManagerDetails:
      return '/editbranchmanagerdetails';
    case AnalyticsRoute.UpdateProfile:
      return '/updateprofile';
    case AnalyticsRoute.Scoreboard:
      return '/scoreboard';
    case AnalyticsRoute.ForgotPassword:
      return '/forgotpassword';
    case AnalyticsRoute.ChangePassword:
      return '/changepassword';
    case AnalyticsRoute.AddBranchManager:
      return '/addbranchmanager';
    case AnalyticsRoute.AddVehicle:
      return 'AddVehicleScreen';
    case AnalyticsRoute.Notifications:
      return 'Notifications';
    default:
      return '';
  }
  // throw ArgumentError.notNull('route');
}
