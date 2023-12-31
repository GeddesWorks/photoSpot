import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:photospot/model/gallery.dart';
import 'package:photospot/view/home_screen.dart';
import 'package:photospot/view/web_image.dart';

class ProductView {}

Widget imageBox(
    GalleryModel gallery, BuildContext context, HomeScreenState state) {
  double screenWidth = MediaQuery.of(context).size.width;
  var queryData = MediaQuery.of(context);

  return Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/gallery/${gallery.refName}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Swiper(
              control: (screenWidth > 1200)
                  ? const SwiperControl(
                      iconPrevious: Icons.arrow_back,
                      iconNext: Icons.arrow_forward,
                      color: Colors.white,
                    )
                  : null,
              autoplay: true,
              autoplayDelay: 5000,
              itemCount: gallery.imageUrls?.length ?? 0,
              itemBuilder: (context, index) {
                return WebImage(
                  url: gallery.imageUrls?[index] ??
                      'https://imgs.search.brave.com/2ReQeXoSJNl54r5vmMTh340F_J3vLyVIjIziZ3fQHF8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG40/Lmljb25maW5kZXIu/Y29tL2RhdGEvaWNv/bnMvc2VjdXJpdHkt/MjgzLzY0LzEzLTEy/OC5wbmc',
                );
              },
              pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white, activeColor: Colors.black),
              ),
            ),
          ),
          Wrap(
            children: gallery.imageUrls
                    ?.map((item) => Container(
                          width: 0,
                          height: 0,
                          color: Colors.white,
                          child: WebImage(
                            url: item,
                          ),
                        ))
                    .toList() ??
                [],
          ),
          Column(
            children: [
              Text(
                style: Theme.of(context).textTheme.headlineLarge,
                gallery.name,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
