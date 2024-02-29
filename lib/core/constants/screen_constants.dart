import 'package:flutter/material.dart';
import 'package:statszone/core/constants/color_constants.dart';

const int SERVER_OKAY = 200;
const int NO_CONTENT = 204;
const int TIME_OUT = 499;
const int INTERNAL_SERVER_ERROR = 500;

const String SERVER_DOWN = 'Server Down!';
const String PARSING_ERROR = 'Parsing Error, Try again';
const String DEVELOPER_ERROR = 'Developer Error';
const String SUCCESSFUL = 'Operation Successful';
const String UNKNOWN_USER = 'This user does not exist';
const String LOGGED_OUT_USER = 'Logged out';
const String LOGGED_IN_USER = 'Logged in';
const String EMPTY_FIELD = 'Field Cannot be empty';
const String INCOMPLETE_PASSWORD = 'Password must be more than 8 characters';
const String PASSWORD_CRITERIA_FAILED = 'Password needs to have a number';
const String PASSWORD_DOES_NOT_MATCH = 'Passwords do not match';
const String NEEDS_PASSWORD_CHANGE = 'needs_pwd_change';
const String CREDENTIALS_ARE_WRONG =
    'These credentials are wrong \nCheck and try again';

class AppStrings {
  static const String appTitle = "STATS ZONE";
  static const String teams = "Teams";
  static const String players = "Players";
  static const String stats = "Stats";
  static const String favourites = "Favourites";
}

const Widget divider = Divider(
  thickness: 2,
);

const Widget darkDivider = Divider(
  thickness: 2,
  color: kBlack,
);

const Widget yellowCard = SizedBox(
  height: 40,
  width: 30,
  child:   Card(
    color: kAmber,
  ),
);

const Widget redCard = SizedBox(
  height: 40,
  width: 30,
  child:   Card(
    color: kSecondary,
  ),
);