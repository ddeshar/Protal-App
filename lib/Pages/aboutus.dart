import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              height: 380,
              foregroundDecoration:
                  BoxDecoration(color: Colors.green.withOpacity(0.8)),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              const SizedBox(height: 90),
              _buildAvatar('https://picsum.photos/800/600'),
              const SizedBox(height: 10.0),
              const Text(
                "News ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Update you everyday",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Card(
                color: Colors.white,
                elevation: 0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "28k",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Like",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "2k",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Share",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "3k",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Subscription",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      "About Us",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "A news app is a mobile application designed to deliver news content to users in a convenient and accessible way. These apps serve as a digital platform for users to stay informed about current events, breaking news, and various topics of interest. Here are some key features and components commonly found in news apps:",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  CircleAvatar _buildAvatar(String image, {double radius = 80}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 2,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
