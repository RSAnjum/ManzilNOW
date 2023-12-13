
import 'package:flutter/material.dart';
import 'package:manzilnow/feedback.dart';
import 'package:manzilnow/history.dart';
import 'package:manzilnow/login.dart';
import 'package:manzilnow/updateprf.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  String userName = ''; // Initialize userName as an empty string
  String userProfilePhoto =
      'assets/usr.png'; // Replace 'assets/profile_photo.png' with the path to the user's profile photo

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
    _loadUserData(); // Call the method to load user data
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String? firstName = prefs.getString('firstName');
      userName =
          firstName ?? ''; // Assign the first name value from SharedPreferences
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Homepage',
          style: TextStyle(
            fontFamily: 'sans',
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFF1F1B2F),
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        
        toolbarHeight: 90, 
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
          child: Container(
            color: Color(0xFF141120), 
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Good morning, $userName!',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'sans',
                    color: Colors.white, // Set header color as black
                  ),
                ),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(userProfilePhoto),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF1F1B2F), // Set drawer background color as 1F2B2F
                ),
              ),
              ListTile(
                title: const Text(
                  'View history',
                  style: TextStyle(
                    fontFamily: 'sans',
                    color: Colors.white // Set font family as 'sans'
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage()));
                },
              ),
              ListTile(
                title: const Text(
                  'Update profile',
                  style: TextStyle(
                    fontFamily: 'sans',color: Colors.white  // Set font family as 'sans'
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateProfile()));
                },
              ),
              ListTile(
                title: const Text(
                  'Feedback',
                  style: TextStyle(
                    fontFamily: 'sans',color: Colors.white  // Set font family as 'sans'
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()));
                },
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'sans',color: Colors.red  // Set font family as 'sans'
                  ),
                ),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear(); 
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Login()),
                  );
                },
              ),
            ],
          ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
