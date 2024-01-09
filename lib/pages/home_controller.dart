import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:verzel_project/main.dart';
import 'package:verzel_project/models/offer_model.dart';
import 'package:verzel_project/repositories/offer_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  final OfferRepository _offerRepository = getIt<OfferRepository>();

  final ObservableList<OfferModel> _offers = ObservableList<OfferModel>();
  ObservableList<OfferModel> get offers => _offers; 

  int _currentPage = 0;
  
  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMore = false;

  bool isThereNextPage = true;
  

  _HomeControllerBase() {
    _fetchOffers();
    _scrollController.addListener(_infiniteScrolling);
  }

  @action
  Future<void> _fetchOffers() async {
    isLoading = true;
    dynamic result = await _offerRepository.getAll(_currentPage.toString());
    List<OfferModel> offersResult = List.from(result.map((e) => OfferModel.fromJson(e)));
    _offers.addAll(offersResult);
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
  }

  @action
  Future<void> _fetchMoreOffers() async {
    isLoadingMore = true;
    await Future.delayed(const Duration(seconds: 1));
    try {
      List results = await _offerRepository.getAll(_currentPage.toString());
      List<OfferModel> offersResult = List.from(results.map((e) => OfferModel.fromJson(e)));
      _offers.addAll(offersResult);
      results.isNotEmpty ? isThereNextPage = true : isThereNextPage = false;
    } catch (e) {
      print(e);
    } finally {
      isLoadingMore = false;
    }
  }

  _infiniteScrolling() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoadingMore) {
      if(isThereNextPage) {
        _currentPage = _currentPage + 3;
        _fetchMoreOffers();
      }
    }
  }
}