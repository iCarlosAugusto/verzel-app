import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:verzel_project/components/appbar_widget.dart';
import 'package:verzel_project/components/card_offer_widget.dart';
import 'package:verzel_project/components/layout_widget.dart';
import 'package:verzel_project/components/list_widget.dart';
import 'package:verzel_project/components/text_widget.dart';
import 'package:verzel_project/components/textfield_widget.dart';
import 'package:verzel_project/models/offer_model.dart';
import 'package:verzel_project/pages/home_controller.dart';
import 'package:verzel_project/pages/offer_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();
    
    return Scaffold(
      appBar: AppbarWidget(
        showLogo: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
                    showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => Material(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget("Registre um novo veículo"),
                    
                    TextfieldWidget(
                      hintText: "Nome",
                      margin: const EdgeInsets.only(top: 16),
                    ),
                    TextfieldWidget(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      hintText: "Marca",
                    ),
                    TextfieldWidget(
                      hintText: "Modelo",
                    ),
                    TextfieldWidget(
                      hintText: "Preço",
                      margin: const EdgeInsets.symmetric(vertical: 16),
                    ),
              
                  ],
                ),
              ),
            ),
          );
          },
        ),
      body: LayoutWidget(
        scrollController: controller.scrollController,
        appBar: AppbarWidget(
          showLogo: true,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextfieldWidget(
              suffixIcon: const Icon(Icons.search),
              hintText: "Busque por marca, modelo, ano, cor...",
            ),
            Observer(builder: (_) {
              return Skeletonizer(
                enabled: controller.isLoading,
                child: TextWidget(
                  "${controller.offers.length} Resultados",
                  customWeight: FontWeight.w600,
                  color: Colors.grey[600],
                  customFontsize: 14,
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                ),
              );
            }),
            Observer(builder: (_) {
              return Skeletonizer(
                enabled: controller.isLoading,
                child: ListWidget(
                isLoadingMore: controller.isLoadingMore,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.offers.length,
                itemBuilder: (_, index) { 
                  OfferModel offerItem = controller.offers[index];
                  return Hero(
                    tag: offerItem.id,
                    child: GestureDetector(
                      child: CardOfferWidget(
                        name: offerItem.name,
                        brand: offerItem.brand,
                        model: offerItem.model,
                        imageUrl: offerItem.imageUrl,
                        price: offerItem.price,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OfferDetailsPage(
                              id: offerItem.id,
                              name: offerItem.name,
                              brand: offerItem.brand,
                              model: offerItem.model,
                              imageUrl: offerItem.imageUrl,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
