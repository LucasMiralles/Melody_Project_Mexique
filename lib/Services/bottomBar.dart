import 'package:flutter/material.dart';
import 'package:melody_project_mexique/Screens/ArtistsPage.dart';
import 'package:melody_project_mexique/Screens/SearchPage.dart';
import 'package:melody_project_mexique/Screens/PlaylistPage.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;

  BottomBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFFFFD1DC),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: _buildNavigationButton(
                icon: Icons.person,
                label: 'Artistas',
                index: 0,
                onPressed: () {
                  if (currentIndex != 0) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ArtistsPage()),
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: _buildNavigationButton(
                icon: Icons.search,
                label: 'Buscar',
                index: 1,
                onPressed: () {
                  if (currentIndex != 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: _buildNavigationButton(
                icon: Icons.playlist_play,
                label: 'Playlists',
                index: 2,
                onPressed: () {
                  if (currentIndex != 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PlaylistPage()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required String label,
    required int index,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}