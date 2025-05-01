import 'dart:math';

import 'package:foodiiee/model/burger_model.dart';

List<BurgerModel> getBurger(){
  List<BurgerModel> burger=[];

BurgerModel burgerModel=new BurgerModel();

burgerModel.name="Cheese Burger";
burgerModel.image="assets/images/burger1.jpg";
burgerModel.price="50";
burger.add(burgerModel);
burgerModel=new BurgerModel();

burgerModel.name="Burger";
burgerModel.image="assets/images/burger2.jpg";
burgerModel.price="50";
burger.add(burgerModel);
burgerModel=new BurgerModel();

burgerModel.name="Garlic Burger";
burgerModel.image="assets/images/burger3.jpg";
burgerModel.price="50";
burger.add(burgerModel);
burgerModel=new BurgerModel();

burgerModel.name="Garlic Burger";
burgerModel.image="assets/images/burger3.jpg";
burgerModel.price="50";
burger.add(burgerModel);
burgerModel=new BurgerModel();

burgerModel.name="Garlic Burger";
burgerModel.image="assets/images/burger3.jpg";
burgerModel.price="50";
burger.add(burgerModel);
burgerModel=new BurgerModel();

burgerModel.name="Garlic Burger";
burgerModel.image="assets/images/burger3.jpg";
burgerModel.price="50";
burger.add(burgerModel);
burgerModel=new BurgerModel();



return burger;



}