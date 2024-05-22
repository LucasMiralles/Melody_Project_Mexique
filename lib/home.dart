import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:melody_project_mexique/auth.dart';
import 'package:melody_project_mexique/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        _user = currentUser;
      });
    } else {
      // L'utilisateur n'est pas connecté
      // Gérer la redirection vers la page de connexion si nécessaire
    }
  }

  Future<void> _signOut() async {
    if (await AuthServices.isUserSignedInWithGoogle()) {
      await AuthServices.signOutGoogle(); // Déconnexion de Google
    } else if (await AuthServices.isUserSignedInWithFacebook()) {
      await AuthServices.signOutFacebook(); // Déconnexion de Facebook
    } else {
      await AuthServices.signOutAll(); // Déconnexion de toutes les plateformes
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Center(
        child: _user != null ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_user!.photoURL ?? 'https://via.placeholder.com/150'),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text('Name: ${_user!.displayName ?? 'Anonymous'}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: ${_user!.email ?? 'No Email'}', style: TextStyle(fontSize: 18)),
          ],
        ) : CircularProgressIndicator(),
      ),
    );
  }
}