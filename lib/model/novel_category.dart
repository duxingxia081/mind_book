import 'package:json_annotation/json_annotation.dart';
///小说分类
@JsonSerializable()
class NovelCategory {
  final String major;
  final List<String>? mins;
  NovelCategory({required this.major, this.mins});
  factory NovelCategory.fromJson(Map<String, dynamic> json) => _$NovelCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$NovelCategoryToJson(this);
}
