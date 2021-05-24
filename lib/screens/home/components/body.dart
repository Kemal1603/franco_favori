import 'package:ff_app/constants.dart';
import 'package:ff_app/screens/home/components/categories.dart';
import 'package:ff_app/screens/home/components/special_offers.dart';
import 'package:ff_app/screens/home/components/title_text.dart';
import 'package:ff_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'discount_banner.dart';
import 'icon_with_counter.dart';
import 'package:ff_app/models/Product.dart';
import 'package:ff_app/screens/details/details_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: SizeConfig.screenWidth * 0.6,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: TextField(
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20.0),
                          vertical: getProportionateScreenWidth(9.0),
                        ),
                      ),
                    ),
                  ),
                  IconWithCounter(
                    icon: 'assets/icons/Cart Icon.svg',
                  ),
                  IconWithCounter(
                    icon: 'assets/icons/Bell.svg',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            DiscountBanner(),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: Category()),
            TitleText(
              text: 'Special Offer For You!',
              press: null,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SpecialOfferCard(
                    image: 'assets/images/Image Banner 2.png',
                    category: 'Smartphones',
                    numOfItems: 17,
                    press: null,
                  ),
                  SpecialOfferCard(
                    image: 'assets/images/Image Banner 3.png',
                    category: 'Smartphones',
                    numOfItems: 17,
                    press: null,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.05,
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            TitleText(
              text: 'Popular Products!',
              press: null,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    ...List.generate(
                        demoProducts.length,
                        (index) => PopularCard(
                              image: demoProducts[index].images[0],
                              title: demoProducts[index].title,
                              price: demoProducts[index].price,
                              press: () => Navigator.pushNamed(
                                  context, DetailsScreen.routName,
                                  arguments: DetailsScreen(
                                    product: demoProducts[index],
                                  )),
                            ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PopularCard extends StatelessWidget {
  final String image, title;
  final double price;
  final GestureTapCallback press;

  PopularCard({this.image, this.title, this.price, this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: press,
            child: SizedBox(
              width: 120.0,
              child: AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(13.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: kSecondaryColor.withOpacity(0.2)),
                  child: Image.asset(image),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 40.0,
                  width: 120.0,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 13.0),
                  )),
              SizedBox(
                height: 30.0,
                child: Row(
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    IsFavoriteClass()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class IsFavoriteClass extends StatefulWidget {
  const IsFavoriteClass({
    Key key,
  }) : super(key: key);

  @override
  _IsFavoriteClassState createState() => _IsFavoriteClassState();
}

class _IsFavoriteClassState extends State<IsFavoriteClass> {
  bool ifLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ifLiked = !ifLiked;
        });
      },
      child: Container(
        height: 25.0,
        width: 30.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: kSecondaryColor.withOpacity(0.3)),
        child: SvgPicture.asset(
          'assets/icons/Heart Icon_2.svg',
          fit: BoxFit.scaleDown,
          color: ifLiked ? Colors.red : kSecondaryColor,
        ),
      ),
    );
  }
}
