import 'package:flutter/material.dart';
import 'package:melody_project_mexique/Services/ApiService.dart';
import 'package:melody_project_mexique/Model/MusicDataResponse.dart';
import 'MusicDetailPage.dart';
import 'package:melody_project_mexique/Model/PlaylistDataResponse.dart';
import 'package:melody_project_mexique/Services/bottomBar.dart';

class GenreDetailPage extends StatefulWidget {
  final String genre;

  GenreDetailPage({required this.genre});

  @override
  _GenreDetailPageState createState() => _GenreDetailPageState();
}

class _GenreDetailPageState extends State<GenreDetailPage> {
  final ApiService apiService = ApiService();
  List<MusicDataResponse> genreMusicList = [];
  String genreCoverPhoto = '';

  @override
  void initState() {
    super.initState();
    fetchGenreMusic();
  }

  Future<void> fetchGenreMusic() async {
    final musicList = await apiService.getAllFetchMusicData();
    final playlistData = await apiService.getAllPlaylistsData();
    setState(() {
      genreMusicList = musicList.where((music) => music.genre == widget.genre).toList();
      if (genreMusicList.isNotEmpty) {
        // Trouver la première playlist correspondant au genre
        final genrePlaylist = playlistData.firstWhere(
              (playlist) => playlist.name == widget.genre,
          orElse: () => PlaylistDataResponse(id: '', name: '', coverPhoto: ''),
        );
        genreCoverPhoto = genrePlaylist.coverPhoto ?? 'https://via.placeholder.com/50';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(genreCoverPhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Text(
                  widget.genre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
            child: Text(
              "Música popular",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder<List<MusicDataResponse>>(
                future: apiService.getAllFetchMusicData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error fetching music data", style: TextStyle(color: Colors.white)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No music found for this genre", style: TextStyle(color: Colors.white)));
                  }

                  final musicList = snapshot.data!;
                  final genreMusicList = musicList.where((music) => music.genre == widget.genre).toList();

                  if (genreMusicList.isEmpty) {
                    return Center(child: Text("No music found for this genre", style: TextStyle(color: Colors.white)));
                  }

                  return ListView.builder(
                    itemCount: genreMusicList.length,
                    itemBuilder: (context, index) {
                      final music = genreMusicList[index];
                      return ListTile(
                        leading: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        title: Row(
                          children: [
                            Image.network(
                              music.image ?? 'https://via.placeholder.com/50',
                              width: 75,
                              height: 75,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  music.title ?? 'Unknown Title',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  music.artist ?? 'Unknown Artist',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MusicDetailPage(
                                musicList: genreMusicList,
                                initialIndex: index,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(currentIndex: 1), // Utilisez BottomBar ici avec currentIndex à 1
    );
  }
}