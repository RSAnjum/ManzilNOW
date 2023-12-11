
import 'package:flutter/material.dart';
import 'package:manzilnow/history.dart';
import 'package:manzilnow/updateprf.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  String userName = 'John'; // Replace 'John' with the user's name
  String userProfilePhoto =
      'assets/driver_photo.png'; // Replace 'assets/profile_photo.png' with the path to the user's profile photo

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      drawer: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(-200 * (1 - _animation.value), 0),
            child: child,
          );
        },
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Good morning, $userName!'),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(userProfilePhoto),
                ),
              ),
              ListTile(
                title: const Text('View history'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HistoryPage()));
                },
              ),
              ListTile(
                title: const Text('Update profile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProfilePage()));
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
             
