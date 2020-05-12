
class CategoryBigModel {
    String mallCategoryId;// 类别编号
    String mallCategoryName; // 类别名称
    List<dynamic> bxMallSubDto;
    Null comments;
    String image;




    CategoryBigModel({
      this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image
    });

    factory CategoryBigModel.formJson(dynamic json) {
       return CategoryBigModel(
         mallCategoryId: json['mallCategoryId'],
         mallCategoryName: json['mallCategoryName'],
       );
    } 
}