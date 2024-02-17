import 'package:flutter/material.dart';

List<Map<String, dynamic>> sortList = [
  {'id': '1', 'name': 'Newest', 'isChecked': false},
  {'id': '2', 'name': 'Oldest', 'isChecked': false},
  {'id': '3', 'name': 'From Z-A', 'isChecked': false},
  {'id': '3', 'name': 'From A-Z', 'isChecked': false},
];

List<Map<String, dynamic>> businessSectors = [
  {
    'id': '1',
    'main_activity_name': 'Agriculture Forestry And Fishing',
    'isChecked': false
  },
  {'id': '16', 'main_activity_name': 'Education', 'isChecked': false},
  {'id': '6', 'main_activity_name': 'Construction', 'isChecked': false},
  {
    'id': '11',
    'main_activity_name': 'Financial and insurance activities',
    'isChecked': false
  },
  {
    'id': '8',
    'main_activity_name': 'Transportation and storage',
    'isChecked': false
  },
  {'id': '3', 'main_activity_name': 'Manufacturing', 'isChecked': false},
  {
    'id': '12',
    'main_activity_name': 'Real estate activities',
    'isChecked': false
  },
  {
    'id': '7',
    'main_activity_name': 'Wholesale retail trade repair of vehicles',
    'isChecked': false
  },
  {
    'id': '14',
    'main_activity_name': 'Administrative and support service activities',
    'isChecked': false
  },
  {'id': '2', 'main_activity_name': 'Mining And Quarrying', 'isChecked': false},
  {
    'id': '19',
    'main_activity_name': 'Other service activities',
    'isChecked': false
  },
  {
    'id': '10',
    'main_activity_name': 'Information and Communication',
    'isChecked': false
  },
  {
    'id': '18',
    'main_activity_name': 'Arts entertainment and recreation',
    'isChecked': false
  },
  {
    'id': '5',
    'main_activity_name': 'Water supply sewerage waste management',
    'isChecked': false
  },
  {
    'id': '17',
    'main_activity_name': 'Human health and social work activities',
    'isChecked': false
  },
  {
    'id': '9',
    'main_activity_name': 'Accommodation and food services activities',
    'isChecked': false
  },
  {
    'id': '13',
    'main_activity_name': 'Professional scientific and technical activities',
    'isChecked': false
  },
  {
    'id': '4',
    'main_activity_name': 'Electricity gas steam and air conditioning supply',
    'isChecked': false
  },
  {
    'id': '15',
    'main_activity_name': 'Public administration defense and social security',
    'isChecked': false
  },
];

List<Map<String, dynamic>> industriesFilter = [
  {'id': '1', 'name': 'Energy', 'isChecked': false},
  {'id': '2', 'name': 'Commerce', 'isChecked': false},
  {'id': '3', 'name': 'Technology Services', 'isChecked': false},
  {'id': '4', 'name': 'Financial Services', 'isChecked': false},
  {'id': '5', 'name': 'Construction', 'isChecked': false},
  {'id': '6', 'name': 'Transportation', 'isChecked': false},
  {'id': '7', 'name': 'Manufacturing', 'isChecked': false},
  {'id': '8', 'name': 'Food & Beverages', 'isChecked': false},
  {'id': '9', 'name': 'Education Services', 'isChecked': false},
  {'id': '10', 'name': 'Healthcare Services', 'isChecked': false},
  {'id': '11', 'name': 'Hospitality', 'isChecked': false},
];
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
