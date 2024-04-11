import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/auth/auth.dart';

import '../constants/colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Custom data for descriptions
  final descriptions = [
    'John Doe',
    'johndoe@example.com',
    '+1 123-456-7890',
    '123 Main Street, Anytown, USA'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AuthPage());
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.grey[00],
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Update User Profile',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.manage_accounts,
                                  size: 60,
                                ),
                                radius: 50,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: ListView.builder(
                                itemCount: descriptions.length,
                                itemBuilder: (context, index) {
                                  return DataDisplayCard(
                                    labelText: profileDetailsLabels[index],
                                    detailtext: descriptions[index],
                                    edit: 'Edit',
                                    onTapEdit: () {
                                      // Handle edit field logic here
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> profileDetailsLabels = [
  'Full Name',
  'Email',
  'Mobile Number',
  'Address',
];

class DataDisplayCard extends StatelessWidget {
  const DataDisplayCard({
    super.key,
    required this.labelText,
    required this.detailtext,
    this.height,
    this.edit,
    this.onTapEdit,
  });
  final String labelText;
  final String detailtext;
  final String? edit;
  final VoidCallback? onTapEdit;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        width: 300,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      labelText,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 213, 213, 213),
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                        onTap: onTapEdit,
                        child: Text(
                          edit ?? '',
                          style: TextStyle(
                              fontSize: 15,
                              color: mains,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                  child: Text(
                    maxLines: 2,
                    detailtext,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
