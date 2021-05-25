import 'package:ff_app/constants.dart';
import 'package:ff_app/models/Product.dart';
import 'package:ff_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({this.product});

  @override
  Widget build(BuildContext context) {
    return DetailScreenBodyHead(product: product);
  }
}








//TODO: Cut and place somewhere else the block below

class DetailScreenBodyHead extends StatefulWidget {
  final Product product;

  DetailScreenBodyHead({this.product});

  @override
  _DetailScreenBodyHeadState createState() => _DetailScreenBodyHeadState();
}

class _DetailScreenBodyHeadState extends State<DetailScreenBodyHead> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.02,
        ),
        Center(
          child: SizedBox(
              width: 258,
              height: 258,
              child: Image.asset(widget.product.images[currentImage],),),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.02,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                widget.product.images.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentImage = index;
                      });
                    },
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currentImage == index ? kPrimaryColor : Colors.black.withOpacity(0.06),
                        ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black.withOpacity(0.06)),
                      child: Image.asset(widget.product.images[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
