class PlacePredictions{
  String main_text;
  String secondary_text;
  String place_id;

  PlacePredictions({this.secondary_text, this.main_text, this.place_id});
  PlacePredictions.fromJson(Map<String, dynamic> json)
  {
  place_id = json["place_id"];
  main_text = json["main_text"];
  secondary_text = json["secondary_text"];
  }
}