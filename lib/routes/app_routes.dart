import 'package:get/get.dart';
import 'package:x_well/screens/AppointmentsList/appointments_list.dart';
import 'package:x_well/screens/AppointmentsList/bindings/appointments_list_binding.dart';
import 'package:x_well/screens/booking/bindings/booking_binding.dart';
import 'package:x_well/screens/booking/booking_screen.dart';
import 'package:x_well/screens/doctors/bindings/doctors_binding.dart';
import 'package:x_well/screens/doctors/doctors_screen.dart';
import 'package:x_well/screens/get_details/bindings/get_details_binding.dart';
import 'package:x_well/screens/get_details/get_details.dart';
import 'package:x_well/screens/sign_in/sign_in_screen.dart';
import 'package:x_well/screens/tabs/bindings/tabs_binding.dart';
import 'package:x_well/screens/tabs/tabs_screen.dart';

import 'app_route_names.dart';


class AppRoutes{
  static final routes = [
    /// initial route Landing Page
    GetPage(
      name: AppRouteNames.INITIAL,
      page: () => SignInScreen(),
      //binding: LandingPageBinding(),
    ),

    /// details page route
    GetPage(
      name: AppRouteNames.GET_DETAILS_SCREEN,
      page: () => GetDetails(),
      binding: GetDetailsBinding()
    ),

    /// tabs page route
    GetPage(
        name: AppRouteNames.TABS_SCREEN,
        page: () => TabsScreen(),
        binding: TabsBinding()
    ),

    /// doctors page route
    GetPage(
        name: AppRouteNames.DOCTORS_SCREEN,
        page: () => DoctorsScreen(),
        binding: DoctorsBinding()
    ),

    /// booking page route
    GetPage(
        name: AppRouteNames.BOOKING_SCREEN,
        page: () => BookingScreen(),
        binding: BookingBinding()
    ),


    /// appointments page route
    GetPage(
        name: AppRouteNames.APPOINTMENTS_SCREEN,
        page: () => AppointmentsListScreen(),
        binding: AppointmentsListBinding()
    ),



  ];
}