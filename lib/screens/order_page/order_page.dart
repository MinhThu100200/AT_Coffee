import 'package:flutter/material.dart';
import 'package:at_coffee/common/theme/colors.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:at_coffee/models/product.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key, this.product}) : super(key: key);

  Product product;
  @override
  _OrderPage createState() => _OrderPage();
}

enum SizeEnum { S, M, L }

class _OrderPage extends State<OrderPage> {
  Product _product;

  int _quantity = 1;

  final String _urlDefault = "assets/images/coffee.png";
  final String _urlSelected = "assets/images/ice-tea.png";
  String _urlS = "";
  String _urlM = "";
  String _urlL = "";
  int _index = 2;

  void _updateQuantity(String operator) {
    setState(() {
      if (operator == "add") {
        _quantity += 1;
      } else {
        if (_quantity > 1) {
          _quantity -= 1;
        }
      }
    });
  }

  void _updateSize(SizeEnum size) {
    _index = size.index;

    setState(() {
      _urlS = _urlDefault;
      _urlM = _urlDefault;
      _urlL = _urlDefault;
      if (size == SizeEnum.S) {
        _urlS = _urlSelected;
      } else if (size == SizeEnum.M) {
        _urlM = _urlSelected;
      } else {
        _urlL = _urlSelected;
      }
    });
  }

  final oCcy = NumberFormat.currency(locale: 'vi', symbol: 'đ');

  @override
  void initState() {
    super.initState();
    _product = widget.product;
    _updateSize(SizeEnum.L);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(alignment: Alignment.centerLeft, children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                  padding: const EdgeInsets.all(40.0),
                  height: size.width * 0.90,
                  width: size.width * 0.90,
                  decoration: const BoxDecoration(
                    color: primary,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100.0)),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(_product.image,
                          height: 150, width: 150, fit: BoxFit.cover))),
            ),
            Positioned(
              left: size.width * 0.10 - 24.0,
              top: 0.0,
              child: Container(
                padding: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey,
                ),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            Positioned.fill(
              bottom: 20.0,
              // left: 50,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: 160,
                    height: 44.0,
                    padding: const EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.grey,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: IconButton(
                              icon: const Icon(Icons.remove,
                                  size: 24.0, color: Colors.white),
                              onPressed: () {
                                _updateQuantity("minus");
                              }),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(_quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: IconButton(
                              icon: const Icon(Icons.add,
                                  size: 24.0, color: Colors.white),
                              onPressed: () {
                                _updateQuantity("add");
                              }),
                        ),
                      ],
                    )),
              ),
            )
          ]),
        ),
        Expanded(
            child: Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: size.width - 60.0,
                        padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
                        child: Text(_product.name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: red,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    Container(
                        width: size.width - 60.0,
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          _product.description,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child: const Text("Size",
                              style: TextStyle(
                                  color: red,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 70.0,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        _updateSize(SizeEnum.S);
                                      },
                                      child: Container(
                                        child: SizedBox(
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                              Positioned(
                                                child: Image.asset(
                                                    'assets/icons/coffee-cup.png',
                                                    height: 70,
                                                    color: _index == 0
                                                        ? primary
                                                        : black,
                                                    fit: BoxFit.fitHeight),
                                              ),
                                              Positioned(
                                                top: 25,
                                                child: Text(SizeEnum.S.name,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white)),
                                              )
                                            ])),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 85.0,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(right: 5),
                                    child: InkWell(
                                      onTap: () {
                                        _updateSize(SizeEnum.M);
                                      },
                                      child: Container(
                                        alignment:
                                            Alignment.center, // use aligment
                                        child: SizedBox(
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                              Positioned(
                                                child: Image.asset(
                                                    'assets/icons/coffee-cup.png',
                                                    height: 85,
                                                    color: _index == 1
                                                        ? primary
                                                        : black,
                                                    fit: BoxFit.fitHeight),
                                              ),
                                              Positioned(
                                                top: 30.0,
                                                child: Text(SizeEnum.M.name,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white)),
                                              )
                                            ])),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 100.0,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        _updateSize(SizeEnum.L);
                                      },
                                      child: Container(
                                        child: SizedBox(
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                              Positioned(
                                                child: Image.asset(
                                                    'assets/icons/coffee-cup.png',
                                                    height: 100,
                                                    color: _index == 2
                                                        ? primary
                                                        : black,
                                                    fit: BoxFit.fitHeight),
                                              ),
                                              Positioned(
                                                top: 35,
                                                child: Text(SizeEnum.L.name,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white)),
                                              )
                                            ])),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    )),
                    Expanded(
                      child: Row(children: [
                        Expanded(
                            child: SizedBox(
                          width: 5,
                        )),
                        Expanded(
                            flex: 1,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      child: ((() {
                                    if (_product.discount > 0) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 25),
                                        child: Text(
                                            oCcy.format(
                                                _product.sizes[0].price),
                                            style: const TextStyle(
                                                color: yellow,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                      );
                                    }
                                  })())),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          top: 2.0, right: 27),
                                      child: Text(
                                          oCcy.format(_product.sizes[0].price *
                                              (1 - _product.discount / 100)),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ))),
                                ])),
                        Expanded(
                          flex: 1,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    child: ((() {
                                  if (_product.discount > 0) {
                                    return Container(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 21.0),
                                      child: Text(
                                          oCcy.format(_product.sizes[1].price),
                                          style: const TextStyle(
                                              color: yellow,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.lineThrough)),
                                    );
                                  }
                                })())),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 2.0, right: 23.0),
                                    child: Text(
                                        oCcy.format(_product.sizes[1].price *
                                            (1 - _product.discount / 100)),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ))),
                              ]),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    child: ((() {
                                  if (_product.discount > 0) {
                                    return Container(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 14.0),
                                      child: Text(
                                          oCcy.format(_product.sizes[2].price),
                                          style: const TextStyle(
                                              color: yellow,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.lineThrough)),
                                    );
                                  }
                                })())),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 2.0, right: 16),
                                    child: Text(
                                        oCcy.format(_product.sizes[2].price *
                                            (1 - _product.discount / 100)),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ))),
                              ],
                            ))
                      ]),
                    )
                  ],
                ))),
        Container(
          color: primary,
          height: 60.0,
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 60.0,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Giỏ hàng (0)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white))))),
            Expanded(
                flex: 1,
                child: Container(
                    color: lightGray3,
                    height: 60.0,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                            "Tổng tiền: " +
                                oCcy
                                    .format(_quantity *
                                        _product.sizes[_index].price *
                                        (1 - _product.discount / 100))
                                    .toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black))))),
            Expanded(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.all(0.0),
                    height: 60.0,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Thêm vào giỏ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white))))),
          ]),
        )
      ]),
    ));
  }
}
