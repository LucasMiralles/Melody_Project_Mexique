import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_functions.dart';

class AuthServices {
  static Future<bool> signupUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirestoreServices.saveUser(email, userCredential.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro con éxito', textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
          backgroundColor: Colors.black
        ),
      );
      return true; // Inscription réussie
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('La contraseña es demasiado débil', textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
            backgroundColor: Colors.black,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('El correo electrónico indicado ya existe', textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
            backgroundColor: Colors.black,
          ),
        );
      }
      return false; // Inscription échouée
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
      return false; // Inscription échouée
    }
  }

  static Future<bool> signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Está conectado', textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
          backgroundColor: Colors.black,
        ),
      );
      return true; // Connexion réussie
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No se ha encontrado ningún usuario con este correo electrónico',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            backgroundColor: Colors.black,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Contraseña incorrecta',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            backgroundColor: Colors.black,
          ),
        );
      } else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Correo electrónico o contraseña no válidos. Compruebe sus credenciales',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            backgroundColor: Colors.black,
          ),
        );
      } else {
        // Autres exceptions liées à l'authentification Firebase
        print('Firebase Auth Exception: ${e.code}');
      }
      return false; // Connexion échouée
    }
    catch (e) {
      // Gérer d'autres exceptions non liées à FirebaseAuthException
      print('Non-Firebase Exception: $e');
      return false; // Connexion échouée
    }
  }
 static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
 static Future<User?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } else {
      print(result.message);
      return null;
    }
  }

  static Future<void> signOutFacebook() async {
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }
}
