class ArtistDataResponse {
  String? id;
  String? name;
  String? photo;

  ArtistDataResponse({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory ArtistDataResponse.fromJson(Map<String, dynamic> json) {
    return ArtistDataResponse(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}