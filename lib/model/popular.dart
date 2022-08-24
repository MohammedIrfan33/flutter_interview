
class Popular {
  String ? title;
  String ? byLine;
  String ? publishedDate;
  String ? thumbImage;

  Popular({
    required this.title,
    required this.byLine,
    required this.publishedDate,
    required this.thumbImage
  });
  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
    title: json["title"] as String,
    byLine:json["byline"] as String,
    publishedDate: json["published_date"] as String,
    thumbImage: json["media"][0]["media-metadata"][0]["url"] as String
  );
}