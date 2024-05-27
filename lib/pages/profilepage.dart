import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skru/constants/color.dart';
import 'package:skru/models/user.modal.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<UserInitail> user = [];

  void _getUser() {
    user = UserInitail.getUser();
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              _buildAvatar(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Nicolas Adams',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const Text(
                'Nicolas.Adams@gmail.com',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return _buildNameCard(index);
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Stack _buildAvatar() {
    return Stack(
      children: <Widget>[
        const CircleAvatar(
          backgroundColor: Colors.black12,
          backgroundImage: AssetImage('assets/images/image5.png'),
          radius: 80,
        ),
        Positioned(
          bottom: 9,
          right: 10,
          child: GestureDetector(
            onTap: () => {print('Edit Profiles')},
            child: const CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 16,
              child: FaIcon(
                FontAwesomeIcons.pen,
                size: 15,
                color: Colors.black54,
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding _buildNameCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40),
      child: Container(
        height: 50,
        width: 295,
        decoration: BoxDecoration(
            color: kbaseIcon, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  user[index].icon,
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    user[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              user[index].name != 'Logout'
                  ? const FaIcon(
                      FontAwesomeIcons.pen,
                      size: 16,
                      color: Colors.black54,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
