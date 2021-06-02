import 'dart:ui';

import 'package:ff_app/constants.dart';
import 'package:ff_app/models/Cart.dart';
import 'package:ff_app/models/Product.dart';
import 'package:ff_app/models/provider_models/cart_list_model.dart';
import 'package:ff_app/models/provider_models/detail_screen_model.dart';
import 'package:ff_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final Product product;
  final String screen;

  Body({this.product, this.screen});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetailScreenBodyHead(product: product),
          Container(
            width: double.infinity,
            height: 330.0,
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.07),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${product.title}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [DetailScreenLikeIcon(product: product)],
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Expanded(
                      child: Text(
                    '${product.description.length > 135 ? product.description.substring(0, 155) : ''}',
                    maxLines: 3,
                  )),
                ),
                DotsAndQuantityRow(
                  product: product,
                  screen: screen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: Cut and place somewhere else the block below
class DotsAndQuantityRow extends StatefulWidget {
  final Product product;
  final String screen;

  DotsAndQuantityRow({this.product, this.screen});

  @override
  _DotsAndQuantityRowState createState() => _DotsAndQuantityRowState();
}

class _DotsAndQuantityRowState extends State<DotsAndQuantityRow> {
  int pickedColor = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ...List.generate(widget.product.colors.length, (index) {
              return Padding(
                padding: EdgeInsets.only(left: 9.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      pickedColor = index;
                      Provider.of<DetailScreenModel>(context, listen: false)
                          .changeBackgroundColor(
                              widget.product.colors[pickedColor]);
                    });
                  },
                  child: Container(
                    width: 22.0,
                    height: 22.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: pickedColor == index
                                ? kPrimaryColor
                                : Colors.transparent)),
                    child: Padding(
                      padding: EdgeInsets.all(1.8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: widget.product.colors[index],
                            shape: BoxShape.circle),
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                  ),
                ),
              );
            }),
            SizedBox(
              width: SizeConfig.screenWidth * 0.4,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (quantity != 1) quantity--;
                });
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Icon(Icons.remove),
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.014,
            ),
            Text(
              '$quantity',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.014,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity++;
                });
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.03,
        ),
        if (widget.screen == 'Home')
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: kPrimaryColor)),
                ),
              ),
              onPressed: () {
                Provider.of<UsersCartList>(context, listen: false).addCart(
                  cart: ReadyCart(
                    product: widget.product,
                    quantity: quantity,
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(18.0)),
                ),
              )),
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        )
      ],
    );
  }
}

class DetailScreenLikeIcon extends StatefulWidget {
  final Product product;

  DetailScreenLikeIcon({this.product});

  @override
  _DetailScreenLikeIconState createState() => _DetailScreenLikeIconState();
}

class _DetailScreenLikeIconState extends State<DetailScreenLikeIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.product.isFavourite = !widget.product.isFavourite;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                widget.product.isFavourite ? Colors.red.withOpacity(0.3) : null,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            )),
        width: 40.0,
        height: 30.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            'assets/icons/Heart Icon_2.svg',
            color: widget.product.isFavourite ? Colors.red : null,
          ),
        ),
      ),
    );
  }
}

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
            child: Image.asset(
              widget.product.images[currentImage],
            ),
          ),
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
                            color: currentImage == index
                                ? kPrimaryColor
                                : Colors.black.withOpacity(0.06),
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
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.02,
        ),
      ],
    );
  }
}
