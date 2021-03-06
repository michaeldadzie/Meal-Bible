import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TodayMealsScreen extends StatelessWidget {
  final String imageUrl,
      title,
      id,
      complexity,
      course,
      preptime,
      cooktime,
      totaltime,
      servings,
      calories,
      fat,
      protein,
      carbo,
      step1,
      step2,
      step3,
      step4,
      step5,
      item1,
      item2,
      item3,
      item4;
  TodayMealsScreen({
    this.imageUrl,
    this.course,
    this.preptime,
    this.cooktime,
    this.totaltime,
    this.servings,
    this.calories,
    this.fat,
    this.protein,
    this.carbo,
    this.title,
    this.id,
    this.complexity,
    this.step1,
    this.step2,
    this.step3,
    this.step4,
    this.step5,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  });
  @override
  Widget build(BuildContext context) {
    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: child,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Theme.of(context).focusColor),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: title,
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                id,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hoverColor,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Prep Time',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Text(
                        preptime,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Cook Time',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Text(
                        cooktime,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Total Time',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Text(
                        totaltime,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSectionTitle(context, 'Course'),
                  Text(
                    course,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hoverColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSectionTitle(context, 'Ingredients'),
                  Container(
                    height: 25,
                    width: 80,
                    child: Center(
                      child: Text(
                        servings,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).highlightColor,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).hoverColor),
                  )
                ],
              ),
              buildContainer(
                ListView(
                  children: [
                    IngredientList(
                      items: item1,
                    ),
                    IngredientList(
                      items: item2,
                    ),
                    IngredientList(
                      items: item3,
                    ),
                    IngredientList(
                      items: item4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).hintColor,
                        child: Center(
                          child: Text(
                            calories,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Calories',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'kcal',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).hintColor,
                        child: Center(
                          child: Text(
                            fat,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Fat',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'g',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).hintColor,
                        child: Center(
                          child: Text(
                            protein,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Protein',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'g',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).hintColor,
                        child: Center(
                          child: Text(
                            carbo,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Carbo',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'g',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView(
                  children: [
                    StepsList(
                      itemPos: '1',
                      items: step1,
                    ),
                    StepsList(
                      itemPos: '2',
                      items: step2,
                    ),
                    StepsList(
                      itemPos: '3',
                      items: step3,
                    ),
                    StepsList(
                      itemPos: '4',
                      items: step4,
                    ),
                    StepsList(
                      itemPos: '5',
                      items: step5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StepsList extends StatelessWidget {
  final String items;
  final String itemPos;
  const StepsList({
    @required this.items,
    @required this.itemPos,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).hintColor),
            width: 40,
            height: 40,
            child: Center(
              child: Text(
                itemPos,
                style: TextStyle(
                    color: Theme.of(context).focusColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          title: Text(
            items,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500),
          ),
        ),
        Divider(
          color: Colors.grey[500],
        ),
      ],
    );
  }
}

class IngredientList extends StatelessWidget {
  final String items;
  const IngredientList({
    this.items,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).hintColor,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Text(items),
      ),
    );
  }
}
