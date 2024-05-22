class PlaylistDataResponse {
  String? id;
  String? name;
  String? coverPhoto;

  PlaylistDataResponse({
    required this.id,
    required this.name,
    required this.coverPhoto,
  });

  factory PlaylistDataResponse.fromJson(Map<String, dynamic> json) {
    return PlaylistDataResponse(
      id: json['id'],
      name: json['name'],
      coverPhoto: json['coverPhoto'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['coverPhoto'] = this.coverPhoto;
    return data;
  }
}
