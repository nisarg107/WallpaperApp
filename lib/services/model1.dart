import 'dart:convert';

List<Photos> photosfromJson(String str) => List<Photos>.from(
    json.decode(str).map((x) => Photos.fromJson(x)));

class Photos {
  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;
  String? photographerUrl;
  int? photographerId;
  String? avgColor;
  Src? src;
  bool? liked;
  String? alt;

  Photos(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.avgColor,
      this.src,
      this.liked,
      this.alt});

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
    id : json['id'],
    width : json['width'],
    height : json['height'],
    url : json['url'],
    photographer : json['photographer'],
    photographerUrl : json['photographer_url'],
    photographerId : json['photographer_id'],
    avgColor : json['avg_color'],
    src : json['src'] != null ? new Src.fromJson(json['src']) : null,
    liked : json['liked'],
    alt : json['alt'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['photographer'] = this.photographer;
    data['photographer_url'] = this.photographerUrl;
    data['photographer_id'] = this.photographerId;
    data['avg_color'] = this.avgColor;
    if (this.src != null) {
      data['src'] = this.src!.toJson();
    }
    data['liked'] = this.liked;
    data['alt'] = this.alt;
    return data;
  }
}

class Src {
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  Src(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  factory Src.fromJson(Map<String, dynamic> json) => Src( 
    original : json['original'],
    large2x : json['large2x'],
    large : json['large'],
    medium : json['medium'],
    small : json['small'],
    portrait : json['portrait'],
    landscape : json['landscape'],
    tiny : json['tiny'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['large2x'] = this.large2x;
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['small'] = this.small;
    data['portrait'] = this.portrait;
    data['landscape'] = this.landscape;
    data['tiny'] = this.tiny;
    return data;
  }
}