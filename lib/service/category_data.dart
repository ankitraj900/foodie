import 'package:foodiiee/model/category_model.dart';

List<CategoryModel> getCategories(){

List<CategoryModel> category=[];

CategoryModel categoryModel= new CategoryModel();

categoryModel.name="Pizza";
categoryModel.image="assets/images/pizza.png";
category.add(categoryModel);
categoryModel=new CategoryModel();

categoryModel.name="Burger";
categoryModel.image="assets/images/burger.png";
category.add(categoryModel);
categoryModel=new CategoryModel();

categoryModel.name="Icecream";
categoryModel.image="assets/images/icecream.png";
category.add(categoryModel);
categoryModel=new CategoryModel();

categoryModel.name="Cake";
categoryModel.image="assets/images/cake.png";
category.add(categoryModel);
categoryModel=new CategoryModel();

categoryModel.name="Briyani";
categoryModel.image="assets/images/briyani.png";
category.add(categoryModel);
categoryModel=new CategoryModel();

categoryModel.name="Chowmein";
categoryModel.image="assets/images/chowmein.png";
category.add(categoryModel);
categoryModel=new CategoryModel();

return category;



}