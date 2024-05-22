import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:melody_project_mexique/auth.dart';
import 'package:melody_project_mexique/constantes.dart' as cons;

import 'home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final  _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final email2 = TextEditingController();
  final password = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                'Regístrate gratis para empezar a escuchar',
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
                  'Regístrate con Facebook',
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
                      'Regístrate con Google',
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
                'Regístrate con correo electrónico',
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
               //   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Cuál es su e-mail ?',
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
                            'Confirme su e-mail',
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
                        controller: email2,
                        cursorColor: cons.noir,
                        decoration: InputDecoration(
                          hintText: 'Introduce de nuevo su e-mail.',
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
                            'Crear una contraseña',
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
                          hintText: 'Crear una contraseña.',
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
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () async {
                        // Vérifiez si le formulaire est valide
                        if (_formKey.currentState!.validate()) {
                          // Si les emails correspondent, tentez de vous inscrire
                          if (email.text == email2.text) {
                            // Si les emails correspondent, inscrivez-vous
                            _formKey.currentState!.save();
                            bool isSignedUp = await AuthServices.signupUser(email.text, password.text, context);

                            // Si l'inscription a réussi, naviguez vers la page d'accueil
                            if (isSignedUp) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            }
                          } else {
                            // Sinon, affichez un message d'erreur
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black,
                                content: Text(
                                  'Los correos electrónicos no coinciden',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
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
                        'INICIAR',
                        style: TextStyle(
                          color: cons.noir,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
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

String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final isEmailValid = emailRegex.hasMatch(email??'');
  if (!isEmailValid) {
    return 'Introduce un email válido';
  }
  return null;
}

String? validatePassword(String? password) {
  if (password!.length < 5) {
    return 'La contraseña debe tener al menos 5 caracteres';
  }
  return null;
}
