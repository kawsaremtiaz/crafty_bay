import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/data/models/banner_item.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';


class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key, this.height, required this.bannerList,
  });

  final double? height;
  final List<BannerItem> bannerList;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 180.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
            // enableInfiniteScroll: false,
            // autoPlay: true,
          ),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    // TODO: make it horizontal alignment
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(banner.image ?? ''),
                            fit: BoxFit.cover
                          )
                        ),
                        alignment: Alignment.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(banner.title ?? '', style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),),
                          ),
                          const SizedBox(height: 8,),
                          SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      AppColors.primaryColor),
                                  padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.only(
                                        left: 25.0,
                                        right: 25.0,
                                        top: 0.0,
                                        bottom: 0.0),
                                  ),
                                ),
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                          ),

                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6,),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: i == index ? AppColors.primaryColor : Colors.transparent,
                      border: Border.all(
                        color: i == index ? AppColors.primaryColor : Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
              ],
            );
          }
        )
      ],
    );
  }
}