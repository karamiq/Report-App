import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class ProfilePageHead extends StatelessWidget {
  final String name;
  final String email;
  final String registrationDate;
  final String profileImageUrl;

  const ProfilePageHead({
    super.key,
    required this.name,
    required this.email,
    required this.registrationDate,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      alignment: Alignment.center,
      padding: Insets.mediumAll,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontsTheme.bigWeight,
                  fontSize: FontsTheme.mediumSize,
                  color: Colors.white,
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                  fontSize: FontsTheme.smallSize,
                  color: Colors.white,
                ),
              ),
              Text(
                'Registered Since $registrationDate',
                style: const TextStyle(
                  fontSize: FontsTheme.smallSize,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(width: Insets.medium), // Use SizedBox for spacing
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.surface.withOpacity(.8),
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 35),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Color.fromARGB(69, 255, 255, 255),
                  ),
                  BoxShadow(
                    offset: Offset(10, 35),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Color.fromARGB(70, 255, 255, 255),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: BorderSize.extraLarge - 5,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
