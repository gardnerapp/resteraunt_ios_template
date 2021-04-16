import 'Side.dart';

class SideCollection{

  final String title;
  final List<Side> sideList;

  SideCollection({this.title, this.sideList});

  factory SideCollection.fromJson(Map<String, dynamic> json) {
    var sideList = json['sideList'].map((e) => Side.fromJson(e)).toList();
    return SideCollection(title: json['title'], sideList: sideList);
  }
}