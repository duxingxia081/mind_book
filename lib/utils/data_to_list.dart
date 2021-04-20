import 'package:mind_book/model/novel_category.dart';
//novel转换为List
class DataToList{
  static List<NovelCategory> types2List(types) {
    List<NovelCategory> typesList=[];
    types.forEach((data){
      typesList.add(NovelCategory.fromJson(data));
    });
    return typesList;
  }

}