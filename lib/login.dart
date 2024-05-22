import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:melody_project_mexique/constantes.dart' as cons;
import 'package:melody_project_mexique/home.dart';
import 'auth.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'img/spotify.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Melody',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: cons.rose,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'INICIAR SESIÓN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: cons.rose,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      User? user = await AuthServices.signInWithFacebook(); // Modification de la variable ici
                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      }
                    } catch (e) {
                      print('Error al conectar con Facebook : $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Error al conectar con Facebook',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          backgroundColor: Colors.black,
                        ),
                      );
                    }
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: cons.bleu,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(size.width * 0.6, 45),
                ),
                child: const Text(
                  'Conectarse con Facebook',
                  style: TextStyle(
                    color: cons.blanc,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential = await AuthServices.signInWithGoogle();
                  if (userCredential.user != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  }
                } catch (e) {
                  print('Error al conectar con Google : $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Error al conectar con Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cons.blanc,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fixedSize: Size(size.width * 0.6, 45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'img/google.png',
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(width: 10),
                  const Text(
                    'Conectarse con Google',
                    style: TextStyle(
                      color: cons.noir,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
              Text(
                'or',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: cons.rose,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Conectarse con correo electrónico',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: cons.rose,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'EMAIL',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: cons.rose,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: email,
                        cursorColor: cons.noir,
                        decoration: InputDecoration(
                          hintText: 'Introduce su e-mail.',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: cons.rose,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                         validator: validateEmail,
                         autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'CONTRASEÑA',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: cons.rose,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: password,
                        obscureText: !passwordVisible,
                        cursorColor: cons.noir,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: passwordVisible ?
                            const Icon(Icons.visibility) :
                            const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          hintText: 'Introduce su contraseña.',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: cons.rose,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                         validator: validatePassword,
                         autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () async {
                        // Vérifiez si le formulaire est valide
                        if (_formKey.currentState!.validate()) {
                          // Si les emails correspondent, tentez de vous connecter
                          _formKey.currentState!.save();
                          bool isLoggedIn = await AuthServices.signinUser(email.text, password.text, context);

                          // Si la connexion a réussi, naviguez vers la page d'accueil
                          if (isLoggedIn) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cons.rose,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fixedSize: Size(size.width * 0.6, 45),
                      ),
                      child: const Text(
                        'INGRESAR',
                        style: TextStyle(
                          color: cons.noir,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Register()));
            },
                    child : Text(
                      'Todavía no tienes una cuenta?',
                      style: TextStyle(
                        color: cons.rose,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.0,
                        decorationColor: cons.rose,
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


