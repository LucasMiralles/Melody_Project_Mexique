import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:melody_project_mexique/Model/MusicDataResponse.dart';
import 'package:melody_project_mexique/Model/ArtistDataResponse.dart';
import 'package:melody_project_mexique/Model/PlaylistDataResponse.dart';

class ApiService {
  Future<List<MusicDataResponse>> getAllFetchMusicData() async {
    const url = "http://localhost:4000/music";
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['music'] as List<dynamic>;
        final musicList = result.map((e) {
          return MusicDataResponse.fromJson(e);
        }).toList();

        return musicList;
      } else {
        throw Exception("Data fetch failed");
      }
    } catch (e) {
      print(e);
      throw Exception("Data fetch failed");
    }
  }

  Future<List<ArtistDataResponse>> getAllArtistsData() async {
    const url = "http://localhost:4000/artists";
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['artists'] as List<dynamic>;
        final artistList = result.map((e) {
          return ArtistDataResponse.fromJson(e);
        }).toList();

        return artistList;
      } else {
        throw Exception("Data fetch failed");
      }
    } catch (e) {
      print(e);
      throw Exception("Data fetch failed");
    }
  }

  Future<List<MusicDataResponse>> getMusicDataByArtist(String artistName) async {
    final url = "http://localhost:4000/music?artist=$artistName";
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['music'] as List<dynamic>;
        final musicList = result.map((e) {
          return MusicDataResponse.fromJson(e);
        }).toList();

        return musicList;
      } else {
        throw Exception("Data fetch failed");
      }
    } catch (e) {
      print(e);
      throw Exception("Data fetch failed");
    }
  }

  Future<List<PlaylistDataResponse>> getAllPlaylistsData() async {
    const url = "http://localhost:4000/playlists";
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['playlists'] as List<dynamic>;
        final playlistList = result.map((e) {
          return PlaylistDataResponse.fromJson(e);
        }).toList();

        return playlistList;
      } else {
        throw Exception("Data fetch failed");
      }
    } catch (e) {
      print(e);
      throw Exception("Data fetch failed");
    }
  }
}