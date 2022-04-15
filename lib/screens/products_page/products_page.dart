import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:at_coffee/common/theme/colors.dart';
import 'package:at_coffee/screens/products_page/products_page_class.dart';
import 'package:at_coffee/screens/products_page/product_item.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);
  @override
  _ProductsPage createState() => _ProductsPage();
}

class _ProductsPage extends State<ProductsPage> {
  final oCcy = NumberFormat.currency(locale: 'vi', symbol: 'đ');

  List<Category> _categories = [
    new Category(id: 1, name: 'Cà phê'),
    new Category(id: 2, name: 'Trà sữa'),
    new Category(id: 3, name: 'Nước ép')
  ];

  List<Product> _products = [
    new Product(
        id: 1,
        name: "Cà phê đen",
        description:
            "Cà phê chất lượng đến từ vùng đất cà phê đỉnh chóp của Việt Nam. Hương vị mê ly động lòng người uống.",
        image:
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637475332/ncuzidudzgrikehrg1in.png",
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637471055/ssqf7s62lzskmro1qzjl.png",
            "https://res.cloudinary.com/tranan2509/image/upload/v1637471428/knm8qhneddobu7n26orr.png",
        price: 70000,
        discount: 15,
        rate: 4,
        count: 50,
        sizes: [
          new Size(size: "S", price: 15000),
          new Size(size: "M", price: 20000),
          new Size(size: "L", price: 25000)
        ]),
    new Product(
        id: 2,
        name: "Cà phê đen 2",
        description:
            "Cà phê chất lượng đến từ vùng đất cà phê đỉnh chóp của Việt Nam. Hương vị mê ly động lòng người uống.",
        image:
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637475332/ncuzidudzgrikehrg1in.png",
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637471055/ssqf7s62lzskmro1qzjl.png",
            "https://res.cloudinary.com/tranan2509/image/upload/v1637471428/knm8qhneddobu7n26orr.png",
        price: 70000,
        discount: 0,
        rate: 4,
        count: 50,
        sizes: [
          new Size(size: "S", price: 15000),
          new Size(size: "M", price: 20000),
          new Size(size: "L", price: 25000)
        ]),
    new Product(
        id: 3,
        name: "Cà phê đen 3",
        description:
            "Cà phê chất lượng đến từ vùng đất cà phê đỉnh chóp của Việt Nam. Hương vị mê ly động lòng người uống.",
        image:
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637475332/ncuzidudzgrikehrg1in.png",
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637471055/ssqf7s62lzskmro1qzjl.png",
            "https://res.cloudinary.com/tranan2509/image/upload/v1637471428/knm8qhneddobu7n26orr.png",
        price: 70000,
        discount: 5,
        rate: 4,
        count: 50,
        sizes: [
          new Size(size: "S", price: 15000),
          new Size(size: "M", price: 20000),
          new Size(size: "L", price: 25000)
        ]),
    new Product(
        id: 4,
        name: "Cà phê đen 4",
        description:
            "Cà phê chất lượng đến từ vùng đất cà phê đỉnh chóp của Việt Nam. Hương vị mê ly động lòng người uống.",
        image:
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637475332/ncuzidudzgrikehrg1in.png",
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637471055/ssqf7s62lzskmro1qzjl.png",
            "https://res.cloudinary.com/tranan2509/image/upload/v1637471428/knm8qhneddobu7n26orr.png",
        price: 70000,
        discount: 5,
        rate: 4,
        count: 50,
        sizes: [
          new Size(size: "S", price: 15000),
          new Size(size: "M", price: 20000),
          new Size(size: "L", price: 25000)
        ]),
    new Product(
        id: 5,
        name: "Cà phê đen 5",
        description:
            "Cà phê chất lượng đến từ vùng đất cà phê đỉnh chóp của Việt Nam. Hương vị mê ly động lòng người uống.",
        image:
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637475332/ncuzidudzgrikehrg1in.png",
            //"https://res.cloudinary.com/tranan2509/image/upload/v1637471055/ssqf7s62lzskmro1qzjl.png",
            "https://res.cloudinary.com/tranan2509/image/upload/v1637471428/knm8qhneddobu7n26orr.png",
        price: 70000,
        discount: 10,
        rate: 4,
        count: 50,
        sizes: [
          new Size(size: "S", price: 17000),
          new Size(size: "M", price: 19000),
          new Size(size: "L", price: 23000)
        ])
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: primary,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    child: SizedBox(
                  width: size.width,
                  child: Stack(alignment: Alignment.centerLeft, children: [
                    Positioned(
                      child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    Positioned(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("Sản phẩm",
                            style: TextStyle(
                                color: white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ]),
                )),
                // Expanded(
                //   flex: 1,
                //   child: ListView.builder(
                //     itemCount: _categories.length,
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Text(_categories[index].name);
                //     },
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  margin: const EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white1,
                  ),
                  child: const Text("A&T Coffee",
                      style: TextStyle(fontSize: 18, color: primary)),
                ),
                Expanded(
                  //flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: white),
                    child: ListView.builder(
                        itemCount: _products.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductItem(product: _products[index]);
                        }),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
