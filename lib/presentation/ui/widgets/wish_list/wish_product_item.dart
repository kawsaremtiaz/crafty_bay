import 'package:crafty_bay/data/models/wish_item.dart';
import 'package:crafty_bay/presentation/state_holders/remove_wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishProductItem extends StatefulWidget {
  const WishProductItem({super.key, required this.wishItem,});

  final WishItem wishItem;

  @override
  State<WishProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<WishProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.network(
            widget.wishItem.product?.image ?? '',
            width: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.wishItem.product?.title ?? '',
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '৳${widget.wishItem.product?.price ?? 0}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          int? productId = widget.wishItem.productId;
                          Get.find<RemoveWishListController>().removeWishProduct(productId!);
                        },
                        // style: ElevatedButton.styleFrom(
                        //   fixedSize: Size(100, 20),
                        //   padding: EdgeInsets.zero
                        // ),
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(const Size(120, 40)), // Set width and height here
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0)),
                          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 16, color: Colors.white)),
                          // Set padding here
                          // You can also set other styles like background color, text color, etc.
                        ),
                        child: const Text("Remove",),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
