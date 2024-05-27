import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInitail {
  String name;
  FaIcon icon;

  UserInitail({required this.name, required this.icon});

  static List<UserInitail> getUser() {
    List<UserInitail> user = [];

    user.add(UserInitail(
        name: 'Nicolas Adams',
        icon: const FaIcon(
          FontAwesomeIcons.user,
          color: Colors.black54,
          size: 20,
        )));
    user.add(UserInitail(
        name: 'Nicolas.Adams@gmail.com',
        icon: const FaIcon(
          FontAwesomeIcons.envelope,
          color: Colors.black54,
          size: 20,
        )));
    user.add(UserInitail(
        name: '086-xxxxxxx',
        icon: const FaIcon(
          FontAwesomeIcons.phone,
          color: Colors.black54,
          size: 20,
        )));
    user.add(UserInitail(
        name: '01/03/2001',
        icon: const FaIcon(
          FontAwesomeIcons.calendar,
          color: Colors.black54,
          size: 20,
        )));
    user.add(UserInitail(
        name: 'Logout',
        icon: const FaIcon(
          FontAwesomeIcons.arrowRightFromBracket,
          color: Colors.black54,
          size: 20,
        )));

    return user;
  }
}
