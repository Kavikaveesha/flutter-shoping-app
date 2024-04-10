import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/screens/profile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';
import '../data/model/banner_model.dart';
import 'product_detail_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final _control = PageController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            AppBarr(),
            SearchBox(),
            bannerr(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ProductDetailScreen(
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 110),
                              child: Image.asset(
                                'images/${index + 1}.webp',
                                height: 200,
                                width: 190,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 155,
                              left: 20,
                              child: Text(
                                banners()[index].name!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 210,
                              right: 0,
                              left: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$ ' + banners()[index].price!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: mains.withOpacity(0.7),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: mains.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                      child: const Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 4,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter bannerr() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: PageView(
              controller: _control,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: banner_builder(0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: banner_builder(1),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: banner_builder(2),
                  ),
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _control,
            count: 3,
            effect: const WormEffect(
              dotHeight: 11,
              dotWidth: 11,
              activeDotColor: Color(0xffFF033E),
            ),
          ),
        ],
      ),
    );
  }

  Row banner_builder(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'New Relase',
              style: TextStyle(
                color: mains,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              banners()[count].name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Force 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              width: 90,
              height: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mains,
              ),
              child: const Text(
                'buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        RotationTransition(
          turns: const AlwaysStoppedAnimation(-30 / 360),
          child: Image.asset(
            'images/${banners()[count].image!}',
            height: 210,
            width: 210,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter SearchBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15),
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 15),
                    Text(
                      'Search your shoes',
                      style: TextStyle(
                        color: Color.fromARGB(255, 194, 187, 187),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mains,
                ),
                child: const Icon(
                  Icons.filter_alt,
                  color: Colors.white,
                  size: 27,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter AppBarr() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'images/nike2_i.png',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const Profil());
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('images/p3.jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
