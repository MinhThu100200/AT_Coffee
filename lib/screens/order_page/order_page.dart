import 'package:flutter/material.dart';
import 'package:at_coffee/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';
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
        body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: SafeArea(
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
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0)),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            Align(
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
            Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: size.width - 60.0,
                          padding:
                              const EdgeInsets.only(top: 0.0, bottom: 10.0),
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
                    ])),
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
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
                  width: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
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
                                        color: _index == 0 ? primary : black,
                                        fit: BoxFit.fitHeight),
                                  ),
                                  Positioned(
                                    top: 25,
                                    child: Text(SizeEnum.S.name,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  )
                                ])),
                          ),
                        ),
                      ),
                      Container(
                        height: 80.0,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 12.0, right: 0.0),
                        child: InkWell(
                          onTap: () {
                            _updateSize(SizeEnum.M);
                          },
                          child: Container(
                            alignment: Alignment.center, // use aligment
                            child: SizedBox(
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                  Positioned(
                                    child: Image.asset(
                                        'assets/icons/coffee-cup.png',
                                        height: 85,
                                        color: _index == 1 ? primary : black,
                                        fit: BoxFit.fitHeight),
                                  ),
                                  Positioned(
                                    top: 30.0,
                                    child: Text(SizeEnum.M.name,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  )
                                ])),
                          ),
                        ),
                      ),
                      Container(
                        height: 95.0,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 3.0, right: 0.0),
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
                                        color: _index == 2 ? primary : black,
                                        fit: BoxFit.fitHeight),
                                  ),
                                  Positioned(
                                    top: 35,
                                    child: Text(SizeEnum.L.name,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  )
                                ])),
                          ),
                        ),
                      )
                    ]),
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(children: [
                    Container(
                        child: ((() {
                      if (_product.discount > 0) {
                        return Container(
                          padding: const EdgeInsets.only(top: 8.0, right: 28),
                          child: Text(oCcy.format(_product.sizes[0].price),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough)),
                        );
                      }
                    })())),
                    Container(
                        padding: const EdgeInsets.only(top: 2.0, right: 30),
                        child: Text(
                            oCcy.format(_product.sizes[0].price *
                                (1 - _product.discount / 100)),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ))),
                  ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Container(
                        child: ((() {
                      if (_product.discount > 0) {
                        return Container(
                          padding: const EdgeInsets.only(top: 8.0, right: 33.0),
                          child: Text(oCcy.format(_product.sizes[1].price),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough)),
                        );
                      }
                    })())),
                    Container(
                        padding: const EdgeInsets.only(top: 2.0, right: 35.0),
                        child: Text(
                            oCcy.format(_product.sizes[1].price *
                                (1 - _product.discount / 100)),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ))),
                  ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          child: ((() {
                        if (_product.discount > 0) {
                          return Container(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 14.0),
                            child: Text(oCcy.format(_product.sizes[2].price),
                                style: const TextStyle(
                                    color: yellow,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough)),
                          );
                        }
                      })())),
                      Container(
                          padding: const EdgeInsets.only(top: 2.0, right: 16),
                          child: Text(
                              oCcy.format(_product.sizes[2].price *
                                  (1 - _product.discount / 100)),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ))),
                    ],
                  ),
                  SizedBox(width: 8),
                ]),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 10, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 0.0, right: 0.0),
                              child: Text("Sữa",
                                  style: TextStyle(
                                      color: red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 0),
                            child: SizedBox(
                              width: 130,
                              height: 100,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                  //left: 20,
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: primary),
                                    child: Image.asset('assets/icons/milk.png',
                                        height: 75, width: 60, color: white1),
                                  ),
                                ),
                                Positioned(
                                  right: 95,
                                  child: InkWell(
                                    onTap: () {
                                      print('aaaaaaaaa');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: lightGray3),
                                      child: Image.asset(
                                          'assets/icons/left-arrow.png',
                                          height: 13,
                                          color: black),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 95,
                                  child: InkWell(
                                    onTap: () {
                                      print('aaaaaaaaa');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: lightGray3),
                                      child: Image.asset(
                                          'assets/icons/right-arrow.png',
                                          height: 13,
                                          color: black),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Sữa tươi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ))
                        ]),
                    Container(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, top: 0.0, right: 0.0),
                                child: Text("Đường",
                                    style: TextStyle(
                                        color: red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 0),
                              child: SizedBox(
                                width: 130,
                                height: 60,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        //left: 20,
                                        child: Container(
                                          width: 100,
                                          height: 45,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: primary),
                                          child: Text("50%",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      Positioned(
                                        right: 100,
                                        child: InkWell(
                                          onTap: () {
                                            print('aaaaaaaaa');
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: lightGray3),
                                            child: Image.asset(
                                                'assets/icons/left-arrow.png',
                                                height: 13,
                                                color: black),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 100,
                                        child: InkWell(
                                          onTap: () {
                                            print('aaaaaaaaa');
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: lightGray3),
                                            child: Image.asset(
                                                'assets/icons/right-arrow.png',
                                                height: 13,
                                                color: black),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, top: 0.0, right: 0.0),
                                child: Text("Đá",
                                    style: TextStyle(
                                        color: red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 0),
                              child: SizedBox(
                                width: 130,
                                height: 60,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        //left: 20,
                                        child: Container(
                                          width: 100,
                                          height: 45,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: primary),
                                          child: Text("50%",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      Positioned(
                                        right: 100,
                                        child: InkWell(
                                          onTap: () {
                                            print('aaaaaaaaa');
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: lightGray3),
                                            child: Image.asset(
                                                'assets/icons/left-arrow.png',
                                                height: 13,
                                                color: black),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 100,
                                        child: InkWell(
                                          onTap: () {
                                            print('aaaaaaaaa');
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: lightGray3),
                                            child: Image.asset(
                                                'assets/icons/right-arrow.png',
                                                height: 13,
                                                color: black),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ]),
                    ),
                  ]),
            ),
            Container(
              child: Text("-----Nhận xét và đánh giá-----",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),

          ]))),
        ),
        Container(
          color: primary,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                padding: const EdgeInsets.all(0.0),
                color: primary,
                height: 60.0,
                width: size.width / 3,
                child: TextButton(
                    onPressed: () {},
                    child: const Text("Giỏ hàng (0)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)))),
            Container(
                color: lightGray3,
                height: 60.0,
                width: size.width / 3.25,
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
                            color: Colors.black)))),
            Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                color: primary,
                height: 60.0,
                width: size.width / 3,
                child: TextButton(
                    onPressed: () {},
                    child: const Text("Thêm vào giỏ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)))),
          ]),
        ),
      ],
    ));
  }
}
