import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../size_config.dart';



class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> categories = [

      {'icon': 'assets/icons/Flash Icon.svg', 'text': 'Flash Deal'},
      {'icon': 'assets/icons/Bill Icon.svg', 'text': 'Bill'},
      {'icon': 'assets/icons/Game Icon.svg', 'text': 'Game'},
      {'icon': 'assets/icons/Gift Icon.svg', 'text': 'Gift'},
      {'icon': 'assets/icons/Discover.svg', 'text': 'More'},

    ];

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(categories.length, (index) => CategoryCard(
            press: null,
            text: categories[index]['text'],
            icon: categories[index]['icon'],
          ))

        ],
      ),
    );

  }
}

class CategoryCard extends StatelessWidget {
  final String text, icon;
  final GestureTapCallback press;


  CategoryCard({
    @required this.text,
    @required this.icon,
    @required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(14.0),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(55.0),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFFFECDF),
                  ),
                  child: SvgPicture.asset(icon, fit: BoxFit.scaleDown,),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),

              Text(text, textAlign: TextAlign.center,),

            ],
          ),

        ),
      ),
    );
  }
}
