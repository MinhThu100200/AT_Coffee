import 'package:at_coffee/controllers/category_controller.dart';
import 'package:at_coffee/controllers/product_controller.dart';
import 'package:at_coffee/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:at_coffee/common/theme/colors.dart';
import 'package:at_coffee/models/product.dart';
import 'package:at_coffee/screens/products_page/product_item.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);
  @override
  _ProductsPage createState() => _ProductsPage();
}

class _ProductsPage extends State<ProductsPage> {
  final oCcy = NumberFormat.currency(locale: 'vi', symbol: 'đ');

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    final StoreController storeController = Get.put(StoreController());
    final ProductController productController = Get.put(ProductController());

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
                    child: Obx(() {
                      if (productController.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else
                        return ListView.builder(
                            itemCount: productController.productsList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductItem(
                                  product:
                                      productController.productsList[index]);
                            });
                    }),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
