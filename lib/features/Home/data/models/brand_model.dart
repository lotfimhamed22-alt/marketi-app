class BrandModel {
  final String name;
  final String emoji;

  BrandModel({required this.name, required this.emoji});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(name: json['name'] ?? '', emoji: json['emoji'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'emoji': emoji};
  }
}

class BrandResponse {
  final List<BrandModel> list;

  BrandResponse({required this.list});

  factory BrandResponse.fromJson(Map<String, dynamic> json) {
    return BrandResponse(
      list: (json['list'] as List).map((e) => BrandModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'list': list.map((e) => e.toJson()).toList()};
  }
}
