import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:happy/presentation/components/custom_overlapped_item.dart';

import '../../../data/models/common/responses/district.dart';
import './bloc/food_tourism_module.dart';
import './bloc/food_tourism_presenter.dart';
import './bloc/food_tourism_state.dart';
import '../../core/base_page/base_page.dart';

/// Create at:   27/06/2023
/// Page:        [FoodTourismPage]
/// Module:      [FoodTourismModule]
/// Presenter:   [FoodTourismPresenter]
/// State:       [FoodTourismState]
/// Description:
/// TODO: This is [FoodTourismPage]
///
@RoutePage()
class FoodTourismPage extends BasePage {
  const FoodTourismPage({Key? key}) : super(key: key);

  @override
  State<FoodTourismPage> createState() => _FoodTourismPageState();
}

class _FoodTourismPageState
    extends BasePageState<FoodTourismPage, FoodTourismPresenter> {
  @override
  @override
  Widget buildBody(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Bạn Muốn đi đâu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: min(screenWidth / 3 * (16 / 6), screenHeight * .9),
              child: CustomOverlappedItem(
                currentIndex: 2,
                district: districts,
                length: districts.length,
                onClicked: (index) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "You clicked at $index",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Các điểm lý thú',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Text('See All')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ...List.generate(
                10,
                (index) => Container(
                      padding: EdgeInsets.only(top: 10, right: 50, left: 15),
                      height: 200,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/02_2020/mua-reu-da-nam-o-8.jpg",
                              fit: BoxFit.fill,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.2,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.2,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 18,
                                    ),
                                    Text('Alenda')
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'The Coast Of Big Sur',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            width: 0.2,
                                            color: Colors.white,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text('See More'),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }

  @override
  void handlerFutureError(Object? error) {
    //TODO: (remove) Example of an overridden method
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}

///==========================================================================///
///=> Behavior of the [FoodTourismPage]
///==========================================================================///
extension _FoodTourismPageBehavior on _FoodTourismPageState {
  void _onPressButton() {
    //TODO: (remove) Example of a self-defined method
  }
}
