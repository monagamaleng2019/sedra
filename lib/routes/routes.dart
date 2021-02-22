import 'package:flutter/widgets.dart';
import 'package:sedra/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:sedra/views/about_company/about_company_view.dart';
import 'package:sedra/views/contact_us/contact_us_view.dart';
import 'package:sedra/views/home/home_view.dart';
import 'package:sedra/views/last_news/last_news_view.dart';
import 'package:sedra/views/news_Details/news_details_view.dart';
import 'package:sedra/views/our_projects/our_projects_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case home:
      return MaterialPageRoute(builder: (context) => HomeView());

    case lastNews:
      return MaterialPageRoute(builder: (context) => LastNewsView());

    case newsDetails:
      return MaterialPageRoute(builder: (context) => NewsDetailsView());

    case contactUs:
      return MaterialPageRoute(builder: (context) => ContactUsView());

    case ourProjects:
      return MaterialPageRoute(builder: (context) => OurProjectsView());

    case aboutCompany:
      return MaterialPageRoute(builder: (context) => AboutCompanyView());

    default:
      MaterialPageRoute(builder: (context) => HomeView());
  }
}
