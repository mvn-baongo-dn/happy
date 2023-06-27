import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_page_presenter.dart';
import '../bloc/home_page_state.dart';

class AddressList extends StatelessWidget {
  const AddressList(
      {super.key,
      required this.presenter,
      required this.widgets,
      required this.onClicked,
      required this.location,
      required this.name});
  final HomePagePresenter presenter;
  final List<Widget> widgets;
  final Function(int) onClicked;
  final String location;
  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePagePresenter, HomePageState>(
      bloc: presenter,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onPanUpdate: (details) {
                presenter.setIndex(details, widgets.length);
                print('currrStateinit------------------${state.currentIndex}');
              },
              onPanEnd: (details) {
                presenter.ceilCurrentIndex();
                print('currrState------------------${state.currentIndex}');
              },
              child: AddressListCardItems(
                presenter: presenter,
                cards: List.generate(
                  widgets.length,
                  (index) => CardModel(id: index, child: widgets[index]),
                ),
                centerIndex: state.currentIndex,
                maxWidth: constraints.maxWidth,
                maxHeight: constraints.maxHeight,
                onClicked: onClicked,
                location: location,
                name: name,
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddressListCardItems extends StatelessWidget {
  final List<CardModel> cards;
  final Function(int) onClicked;
  final double centerIndex;
  final double maxHeight;
  final double maxWidth;
  final HomePagePresenter presenter;
  final String location;
  final String name;

  AddressListCardItems({
    required this.cards,
    required this.centerIndex,
    required this.maxHeight,
    required this.maxWidth,
    required this.onClicked,
    required this.presenter,
    required this.location,
    required this.name,
  });

  Widget _buildItem(CardModel item) {
    final int index = item.id;
    final width = presenter.getCardWidth(index, maxWidth) + 0;
    final height = maxHeight - 60 * (centerIndex - index).abs();
    final position = presenter.getCardPosition(index, maxWidth);
    final verticalPadding = width * 0.05 * (centerIndex - index).abs();
    print('position ...../// $position');
    print('verticalPadding ...../// $verticalPadding');

    return Positioned(
      left: position,
      child: Transform(
        transform: presenter.getTransform(index),
        alignment: FractionalOffset.center,
        child: Stack(
          children: [
            Container(
              width: width.toDouble(),
              height: height > 0 ? height : 0,
              child: item.child,
            ),
            item.isCenter
                ? Positioned(
                    left: 13,
                    bottom: 20,
                    right: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 13,
                            ),
                            Text(
                              location,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Text(
                          name,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  List<Widget> _sortedStackWidgets(List<CardModel> widgets) {
    for (int i = 0; i < widgets.length; i++) {
      if (widgets[i].id == centerIndex) {
        widgets[i].zIndex = widgets.length.toDouble();
        widgets[i].isCenter = true; // Đánh dấu thẻ ở vị trí trung tâm
      } else if (widgets[i].id < centerIndex) {
        widgets[i].isCenter = false;
        widgets[i].zIndex = widgets[i].id.toDouble();
      } else {
        widgets[i].isCenter = false;
        widgets[i].zIndex =
            widgets.length.toDouble() - widgets[i].id.toDouble();
      }
    }
    widgets.sort((a, b) => a.zIndex.compareTo(b.zIndex));
    return widgets.map((e) {
      double distance = (centerIndex - e.id).abs();
      if (distance >= 0 && distance <= 3)
        return _buildItem(
          e,
        );
      else
        return Container();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: _sortedStackWidgets(cards),
      ),
    );
  }
}

class CardModel {
  final int id;
  double zIndex;
  final Widget? child;
  bool isCenter;

  CardModel(
      {required this.id, this.zIndex = 0.0, this.child, this.isCenter = false});
}
