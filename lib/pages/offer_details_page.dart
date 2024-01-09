import 'package:flutter/material.dart';
import 'package:verzel_project/components/appbar_widget.dart';
import 'package:verzel_project/components/layout_widget.dart';
import 'package:verzel_project/components/text_widget.dart';

class OfferDetailsPage extends StatelessWidget {
  const OfferDetailsPage({
    super.key,
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.imageUrl
  });

  final String id;
  final String name;
  final String brand;
  final String model;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: LayoutWidget(
          paddingRight: 0,
          paddingLeft: 0,
          child: Column(
            children: [
              Hero(
                tag: id,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.purple,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        name,
                        customFontsize: 32,
                      ),
                      TextWidget(
                        "$brand • $model ",
                        customWeight: FontWeight.w300,
                        customFontsize: 22,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
    );
  }
}
