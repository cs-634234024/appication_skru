import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserModel {
  String name;
  FaIcon icon;

  UserModel({required this.name, required this.icon});

  static List<UserModel> getUser() {
    List<UserModel> user = [];

    user.add(UserModel(
        name: 'Nicolas Adams',
        icon: const FaIcon(
          FontAwesomeIcons.user,
          color: Colors.black54,
          size: 20,
        )));
    user.add(UserModel(
        name: 'Nicolas.Adams@gmail.com',
        icon: const FaIcon(
          FontAwesomeIcons.envelope,
          color: Colors.black54,
          size: 20,
        )));
    user.add(UserModel(
        name: '086-xxxxxxx',
        icon: const FaIcon(
          FontAwesomeIcons.phone,
          color: Colors.black54,
          size: 20,
        )));
    user.add(UserModel(
        name: '01/03/2001',
        icon: const FaIcon(
          FontAwesomeIcons.calendar,
          color: Colors.black54,
          size: 20,
        )));
    user.add(UserModel(
        name: 'Logout',
        icon: const FaIcon(
          FontAwesomeIcons.arrowRightFromBracket,
          color: Colors.black54,
          size: 20,
        )));

    return user;
  }
}
