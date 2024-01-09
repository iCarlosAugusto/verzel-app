// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingMoreAtom =
      Atom(name: '_HomeControllerBase.isLoadingMore', context: context);

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  late final _$_fetchOffersAsyncAction =
      AsyncAction('_HomeControllerBase._fetchOffers', context: context);

  @override
  Future<void> _fetchOffers() {
    return _$_fetchOffersAsyncAction.run(() => super._fetchOffers());
  }

  late final _$_fetchMoreOffersAsyncAction =
      AsyncAction('_HomeControllerBase._fetchMoreOffers', context: context);

  @override
  Future<void> _fetchMoreOffers() {
    return _$_fetchMoreOffersAsyncAction.run(() => super._fetchMoreOffers());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore}
    ''';
  }
}
