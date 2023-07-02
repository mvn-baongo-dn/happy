import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../resources/resources.dart';
import '../../../routes/app_router.dart';

class ItemRecommend extends StatelessWidget {
  const ItemRecommend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 50, left: 15),
      height: 200,
      child: Row(
        children: [
          _buildImage(),
          SizedBox(
            width: 25,
          ),
          _buildInformation(context)
        ],
      ),
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      child: CachedNetworkImage(
        imageUrl:
            "https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/02_2020/mua-reu-da-nam-o-8.jpg",
        fit: BoxFit.fill,
        imageBuilder: (context, imageProvider) => Container(
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
    );
  }

  Expanded _buildInformation(BuildContext context) {
    return Expanded(
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
                onTap: () {
                  AutoRouter.of(context).replace(LoginRoute());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 0.2,
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(AppText.value.seeMore),
                ),
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
