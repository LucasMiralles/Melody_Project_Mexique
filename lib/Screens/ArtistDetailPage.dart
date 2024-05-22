import 'package:flutter/material.dart';
import 'package:melody_project_mexique/Model/ArtistDataResponse.dart';
import 'package:melody_project_mexique/Model/MusicDataResponse.dart';
import 'package:melody_project_mexique/Services/ApiService.dart';
import 'package:melody_project_mexique/Screens/MusicDetailPage.dart';
import 'package:melody_project_mexique/Services/bottomBar.dart';

class ArtistDetailPage extends StatelessWidget {
  final ArtistDataResponse artist;
  final ApiService apiService = ApiService();

  ArtistDetailPage({required this.artist});

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
                    image: NetworkImage(artist.photo ?? 'https://via.placeholder.com/200'),
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
                  artist.name ?? 'Unknown Artist',
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
                    return Center(child: Text("No music found for this artist", style: TextStyle(color: Colors.white)));
                  }

                  final musicList = snapshot.data!;
                  final artistMusicList = musicList.where((music) => music.artist == artist.name).toList();

                  if (artistMusicList.isEmpty) {
                    return Center(child: Text("No music found for this artist", style: TextStyle(color: Colors.white)));
                  }

                  return ListView.builder(
                    itemCount: artistMusicList.length,
                    itemBuilder: (context, index) {
                      final music = artistMusicList[index];
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
                                  music.album ?? 'Unknown Album',
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
                                musicList: artistMusicList,
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
      bottomNavigationBar: BottomBar(currentIndex: -1), // Utilisez BottomBar ici avec currentIndex à -1
    );
  }
}