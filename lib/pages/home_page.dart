import 'package:flutter/material.dart';
import 'package:travelify/utils/colors.dart';
import 'package:travelify/widgets/app_large_text.dart';
import 'package:travelify/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Top Menu Bar
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: const Center(child: Text('Photo')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          //Discover Text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const AppLargeText(text: 'Discover'),
          ),
          const SizedBox(height: 20),
          //Tab bar
          Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabController,
                labelColor: Colors.black,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const CircleTabIndicator(
                  color: AppColors.mainColor,
                  radius: 4,
                ),
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Places'),
                  Tab(text: 'Inspirations'),
                  Tab(text: 'Emotions'),
                ],
              ),
            ),
          ),
          //Tab Bar View
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/mountain.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                const Center(child: Text('Inspirations')),
                const Center(child: Text('Emotions')),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Middle bar
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppLargeText(text: 'Explore More', size: 22),
                AppText(
                  text: 'See All',
                  color: AppColors.textColor1,
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          //Activities Tab
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/${images.keys.elementAt(index)}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  const _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffSet = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleOffSet, radius, paint);
  }
}
