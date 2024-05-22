import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:melody_project_mexique/Model/ArtistDataResponse.dart';
import 'package:melody_project_mexique/Services/ApiService.dart';
import 'package:melody_project_mexique/Screens/ArtistDetailPage.dart';
import 'package:melody_project_mexique/Services/bottomBar.dart';
import 'package:melody_project_mexique/auth.dart';
import 'package:melody_project_mexique/login.dart';

class ArtistsPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  Future<void> _signOut(BuildContext context) async {
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40), // Ajoute un espace entre le haut de la page et le titre
                Text(
                  "Artistas del momento",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40), // Ajoute un espace entre le titre et la liste des artistes
                Expanded(
                  child: FutureBuilder<List<ArtistDataResponse>>(
                    future: apiService.getAllArtistsData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error fetching artists data",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            "No artists found",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      final artists = snapshot.data!;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Nombre de colonnes
                          crossAxisSpacing: 20, // Espacement horizontal entre les éléments
                          mainAxisSpacing: 25, // Espacement vertical entre les éléments
                        ),
                        itemCount: artists.length,
                        itemBuilder: (context, index) {
                          final artist = artists[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArtistDetailPage(artist: artist),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 70, // Taille du cercle (photo de l'artiste)
                                  backgroundImage: NetworkImage(
                                    artist.photo ?? 'https://via.placeholder.com/100', // URL par défaut si null
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  artist.name ?? 'Unknown Artist', // Texte par défaut si null
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () => _signOut(context),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(currentIndex: 0), // Utilisez BottomBar ici
    );
  }
}