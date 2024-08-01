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
          const SizedBox(width: Insets.medium),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFBFB5FF), width: 2)),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF3F2E9), width: 2)),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
