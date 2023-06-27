library overlapped_carousel;

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../data/models/common/responses/district.dart';

class CustomOverlappedItem extends StatefulWidget {
  final int length;
  final Function(int) onClicked;
  final int? currentIndex;
  final List<District> district;

  const CustomOverlappedItem({
    super.key,
    required this.length,
    required this.onClicked,
    required this.district,
    this.currentIndex,
  });

  @override
  _CustomOverlappedItemState createState() => _CustomOverlappedItemState();
}

class _CustomOverlappedItemState extends State<CustomOverlappedItem> {
  double currentIndex = 2;

  @override
  void initState() {
    if (widget.currentIndex != null) {
      currentIndex = widget.currentIndex!.toDouble();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                var index = currentIndex - details.delta.dx * 0.02;
                if (index >= -1 && index <= widget.length - 1) {
                  currentIndex = index;
                }
              });
            },
            onPanEnd: (details) {
              setState(() {
                currentIndex = currentIndex.ceil().toDouble();
              });
            },
            child: OverlappedItems(
              districts: districts,
              cards: List.generate(
                widget.length,
                (index) => CardModel(
                  id: index,
                ),
              ),
              centerIndex: currentIndex,
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              onClicked: widget.onClicked,
            ),
          );
        },
      ),
    );
  }
}

class OverlappedItems extends StatelessWidget {
  final List<CardModel> cards;
  final Function(int) onClicked;
  final double centerIndex;
  final double maxHeight;
  final double maxWidth;
  final List<District> districts;
  OverlappedItems({
    required this.cards,
    required this.centerIndex,
    required this.maxHeight,
    required this.maxWidth,
    required this.onClicked,
    required this.districts,
  });

  double getCardPosition(int index) {
    final double center = maxWidth / 2;
    final double centerWidgetWidth = maxWidth / 3.5;
    final double basePosition = center - centerWidgetWidth / 2 - 35;
    final distance = centerIndex - index;

    final double nearWidgetWidth = centerWidgetWidth / 5 * 3;
    final double farWidgetWidth = centerWidgetWidth / 5 * 2;

    if (distance == 0) {
      return basePosition;
    } else if (distance.abs() > 0.0 && distance.abs() <= 1.0) {
      if (distance > 0) {
        return basePosition - nearWidgetWidth * distance.abs();
      } else {
        return basePosition + centerWidgetWidth * distance.abs();
      }
    } else if (distance.abs() >= 1.0 && distance.abs() <= 2.0) {
      if (distance > 0) {
        return (basePosition - nearWidgetWidth) -
            farWidgetWidth * (distance.abs() - 1);
      } else {
        return (basePosition + centerWidgetWidth + nearWidgetWidth) +
            farWidgetWidth * (distance.abs() - 2) -
            (nearWidgetWidth - farWidgetWidth) *
                ((distance - distance.floor()));
      }
    } else {
      if (distance > 0) {
        return (basePosition - nearWidgetWidth) -
            farWidgetWidth * (distance.abs() - 1);
      } else {
        return (basePosition + centerWidgetWidth + nearWidgetWidth) +
            farWidgetWidth * (distance.abs() - 2);
      }
    }
  }

  double getCardWidth(int index) {
    final double distance = (centerIndex - index).abs();
    final double centerWidgetWidth = maxWidth / 2;
    final double nearWidgetWidth = centerWidgetWidth / 5 * 3.5;
    final double farWidgetWidth = centerWidgetWidth / 5 * 2.5;

    if (distance >= 0.0 && distance < 1.0) {
      return centerWidgetWidth -
          (centerWidgetWidth - nearWidgetWidth) * (distance - distance.floor());
    } else if (distance >= 1.0 && distance < 2.0) {
      return nearWidgetWidth -
          (nearWidgetWidth - farWidgetWidth) * (distance - distance.floor());
    } else {
      return farWidgetWidth;
    }
  }

  Matrix4 getTransform(int index) {
    var transform = Matrix4.identity()
      ..setEntry(3, 2, 0.007)
      ..scale(1.25, 1.25, 1.25);
    if (index == centerIndex) transform.scale(1.05, 1.05, 1.05);
    return transform;
  }

  Widget _buildItem(CardModel item) {
    final int index = item.id;
    final width = getCardWidth(index) + 0;
    final height = maxHeight - 60 * (centerIndex - index).abs();
    final position = getCardPosition(index);
    final verticalPadding = width * 0.05 * (centerIndex - index).abs();
    print('position ...../// $position');
    print('verticalPadding ...../// $verticalPadding');

    return Positioned(
      left: position,
      child: Transform(
        transform: getTransform(index),
        alignment: FractionalOffset.center,
        child: item.isCenter
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: width.toDouble(),
                      height: height > 0 ? height : 0,
                      child: Image.asset(
                        districts[index].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
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
                              districts[index].name,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Text(
                          districts[index].slogan,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: width.toDouble(),
                  height: height > 0 ? height : 0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage(districts[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.black.withOpacity(0.15)),
                    ),
                  ),
                ),
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
