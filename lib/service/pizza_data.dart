import 'dart:math';

import 'package:foodiiee/model/pizza_model.dart';

List<PizzaModel> getPizza(){
  List<PizzaModel> pizza=[];

PizzaModel pizzaModel=new PizzaModel();

pizzaModel.name="Cheese Pizza";
pizzaModel.image="assets/images/pizza1.jpg";
pizzaModel.price="50";
pizza.add(pizzaModel);
pizzaModel=new PizzaModel();

pizzaModel.name="Volcano Pizza";
pizzaModel.image="assets/images/pizza2.jpg";
pizzaModel.price="100";
pizza.add(pizzaModel);
pizzaModel=new PizzaModel();

pizzaModel.name="Cheese Pizza";
pizzaModel.image="assets/images/pizza1.jpg";
pizzaModel.price="50";
pizza.add(pizzaModel);
pizzaModel=new PizzaModel();

pizzaModel.name="Volcano Pizza";
pizzaModel.image="assets/images/pizza2.jpg";
pizzaModel.price="100";
pizza.add(pizzaModel);
pizzaModel=new PizzaModel();pizzaModel.name="Cheese Pizza";
pizzaModel.image="assets/images/pizza1.jpg";
pizzaModel.price="50";
pizza.add(pizzaModel);
pizzaModel=new PizzaModel();

pizzaModel.name="Volcano Pizza";
pizzaModel.image="assets/images/pizza2.jpg";
pizzaModel.price="100";
pizza.add(pizzaModel);
pizzaModel=new PizzaModel();

return pizza;



}