import 'package:flutter/material.dart';
import 'package:verzel_project/components/text_widget.dart';

class ListWidget extends StatelessWidget {

  ListWidget({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.separatorBuilder,
    this.customEmpty,
    this.isLoading,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.scorllController,
    this.isLoadingMore,
  });

  Widget? Function(BuildContext, int) itemBuilder;
  Widget Function(BuildContext, int)? separatorBuilder;
  Widget? customEmpty;
  Axis scrollDirection = Axis.vertical;
  ScrollPhysics? physics;
  int itemCount;
  bool? isLoading;
  ScrollController? scorllController;
  bool? isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return 
    isLoading != null && isLoading == false && itemCount == 0 ? (
      customEmpty ?? const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              "Encontramos nada por aqui",
              textAlign: TextAlign.center,
            )
          ],
        )
      ):
    isLoading != null && isLoading == true ? 
      const Align(
        child: CircularProgressIndicator()
      )
      : Stack(
        children: [
          ListView.separated(
            controller: scorllController,
            shrinkWrap: true,
            scrollDirection: scrollDirection,
            physics: physics,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder ?? (_, __) =>  Container(height: 16),
            itemCount: itemCount
          ),
          Visibility(
            visible: isLoadingMore != null && isLoadingMore == true,
            child: Positioned(
              bottom: 24,
              left: MediaQuery.of(context).size.width / 2.5,
              child: const CircularProgressIndicator()
            ),
          )
        ],
      );
    }
}