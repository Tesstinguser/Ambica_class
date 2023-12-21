
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the necessary package
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:silver_touch/constant/color_constants.dart';
import 'package:silver_touch/model/product_model.dart';
import 'package:silver_touch/screen/product/productcontroller.dart';
import 'package:silver_touch/screen/widgets/addproduct/add_product.dart';
import 'package:silver_touch/screen/widgets/addproduct/edit_product.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController productController = Get.find<ProductController>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            _scrollController.animateTo(
              _scrollController.offset + 100,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _scrollController.animateTo(
              _scrollController.offset - 100,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: Column(
            children: [
              const Text(
                "Products",
                style: TextStyle(color: Colors.purpleAccent),
              ),
              Obx(() {
                return Text("${productController.products.length}",
                    style: TextStyle(color: Colors.purpleAccent));
              }),
            ],
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddProductBottomSheet();
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search, color: primaryColor),
                          hintText: "Search",
                          hintStyle: TextStyle(color: primaryColor),
                        ),
                        controller: productController.searchController,
                        onChanged: (value) {
                          productController.searchProducts(value);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        onPressed: () {
                          showFilterDialog(context);
                        },
                        icon: const Icon(Icons.filter_alt, color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                    () => Expanded(
                  child: productController.isLoading.value
                      ? Center(
                      child: Lottie.asset('assets/animation_file/testing_loading.json'))
                      : ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, index) =>
                        _getProductCard(productController.products[index]),
                    itemCount: productController.products.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getProductCard(ProductModel product) {
    return Dismissible(
      key: ValueKey(product.productId),
      background: Container(
        color: redColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(width: 10),
            Icon(
              Icons.delete,
              color: whiteColor,
            )
          ],
        ),
      ),
      secondaryBackground: Container(
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.edit,
              color: whiteColor,
            ),
            SizedBox(width: 10)
          ],
        ),
      ),
      confirmDismiss: (dismissDirection) async {
        if (dismissDirection == DismissDirection.startToEnd) {
          productController.deleteProduct(product.productId);
          return true;
        } else {
          showEditProductBottomSheet(product);
          return false;
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                color: product.status == '1' ? greenColor : orangeColor,
              ),
              width: 10,
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showFilterDialog(BuildContext context) {
    Get.dialog(AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Filter',
            style: TextStyle(color: primaryColor),
          ),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.clear,
                color: primaryColor,
              ))
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            items: productController.types.map((String type) {
              return DropdownMenuItem<String>(
                value: type.toLowerCase(),
                child: Text(type),
              );
            }).toList(),
            onChanged: (type) {
              if (type != null) {
                productController.selectedType = type;
              }
            },
            value: productController.selectedType,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
              productController.clearFilter();
            },
            child: const Text('Clear')),
        TextButton(
            onPressed: () {
              Get.back();
              productController.filterApplied = true;
              productController.filterProduct(productController.selectedType);
            },
            child: const Text('Apply'))
      ],
    ));
  }
}
