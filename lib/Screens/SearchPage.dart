import 'package:flutter/material.dart';
import 'package:melody_project_mexique/Services/ApiService.dart';
import 'package:melody_project_mexique/Model/MusicDataResponse.dart';
import 'package:melody_project_mexique/Screens/MusicDetailPage.dart';
import 'package:melody_project_mexique/Services/bottomBar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiService apiService = ApiService();
  TextEditingController _searchController = TextEditingController();
  List<MusicDataResponse> searchResult = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() async {
    final searchText = _searchController.text.trim();
    if (searchText.isEmpty) {
      setState(() {
        searchResult.clear();
      });
    } else {
      final musicList = await apiService.getAllFetchMusicData();
      setState(() {
        searchResult = musicList
            .where((music) =>
        music.title!.toLowerCase().contains(searchText.toLowerCase()) ||
            music.artist!.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40), // Add some space at the top
            Text(
              'Buscar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change text color to white
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30), // Space between the title and search bar
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Qué le gustaría escuchar ?',
                  hintStyle: TextStyle(color: Colors.white), // Hint text color to white
                  fillColor: Colors.grey[800], // Slightly lighter grey for input background
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white), // Icon color to white
                ),
                style: TextStyle(color: Colors.white), // Text input color to white
              ),
            ),
            SizedBox(height: 20), // Space between the search bar and the results
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0), // Add left padding
                child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    final music = searchResult[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MusicDetailPage(
                                musicList: searchResult,
                                initialIndex: index,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                music.image ?? 'https://via.placeholder.com/75',
                                width: 75,
                                height: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  music.title ?? 'Unknown Title',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  music.artist ?? 'Unknown Artist',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 0), // Utilisez BottomBar ici avec currentIndex à 0
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}