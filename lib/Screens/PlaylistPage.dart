import 'dart:math';

import 'package:flutter/material.dart';
import 'package:melody_project_mexique/Services/ApiService.dart';
import 'package:melody_project_mexique/Screens/GenreDetailPage.dart';
import 'package:melody_project_mexique/Services/bottomBar.dart';

class PlaylistPage extends StatefulWidget {
  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final ApiService apiService = ApiService();
  List<String> genres = [];

  @override
  void initState() {
    super.initState();
    fetchGenres();
  }

  Future<void> fetchGenres() async {
    final musicList = await apiService.getAllFetchMusicData();
    setState(() {
      genres = musicList.map((music) => music.genre ?? 'Unknown').toSet().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              "Playlists populares",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  // Afficher les conteneurs pour chaque genre
                  ...genres.map((genre) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenreDetailPage(genre: genre),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _generateRandomColor(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              genre,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 1), // Utilisez BottomBar ici avec currentIndex à 1
    );
  }

  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  }
}