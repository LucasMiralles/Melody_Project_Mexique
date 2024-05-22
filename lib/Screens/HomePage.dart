import 'package:flutter/material.dart';
import 'package:melody_project_mexique/Services/ApiService.dart';
import 'package:melody_project_mexique/Model/MusicDataResponse.dart';
import 'MusicDetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MusicDataResponse> musicList = [];

  @override
  void initState() {
    super.initState();
    fetchMusicData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
      ),
      body: customListCard(),
    );
  }

  Future<void> fetchMusicData() async {
    final musicListResponse = await ApiService().getAllFetchMusicData();
    setState(() {
      musicList = musicListResponse;
    });
  }

  Widget customListCard() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: musicList.length,
      itemBuilder: (context, index) {
        final music = musicList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MusicDetailPage(
                  musicList: musicList,
                  initialIndex: index,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8, right: 8),
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: FadeInImage.assetNetwork(
                    placeholder: "lib/assets/images/musicplaceholder.png",
                    image: music.image ?? 'https://via.placeholder.com/60',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      music.title ?? 'Unknown Title',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      music.artist ?? 'Unknown Artist',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}