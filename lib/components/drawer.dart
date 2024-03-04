import 'package:flutter/material.dart';
import 'package:protal_app/Pages/aboutus.dart';
import 'package:protal_app/Pages/loginScreen.dart';
import 'package:protal_app/Pages/suggestion.dart';
import 'package:protal_app/utils/shared_preference.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late Future<Map<String, String>> userDetails = Future.value({});

  @override
  void initState() {
    super.initState();
    userDetails = getUserDetails();
  }

  Future<Map<String, String>> getUserDetails() async {
    String? email = await SharedPreferenced().getEmail();
    String? username = await SharedPreferenced().getName();

    return {'email': email ?? '', 'username': username ?? ''};
  }

  final divider = const Divider(
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<Map<String, String>>(
        future: userDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final Map<String, String> userMap = snapshot.data ?? {};
            final String username = userMap['username'] ?? '';
            final String email = userMap['email'] ?? '';

            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/user.png',
                        height: 100,
                      ),
                      Text(
                        username,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        email,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                divider,
                ListTile(
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutUs()),
                    );
                  },
                ),
                divider,
                ListTile(
                  title: const Text('Suggestion'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Suggestion()),
                    );
                  },
                ),
                divider,
                ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                    SharedPreferenced().removeEmail();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
