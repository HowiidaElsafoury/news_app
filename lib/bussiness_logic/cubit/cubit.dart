import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bussiness_logic/cubit/states.dart';
import 'package:news_app/models/source_model.dart'as SourceModel;
import '../../core/network_layer/api_manager.dart';
import '../../models/article_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  List<SourceModel.Source> sourceList = [];
  List<Articles> articlesList = [];

  changeIndexState(int index) {
    selectedIndex = index;
    emit(ChangeIndexState());
  }

  getSource(String categoryId) async {
    emit(HomeSourceLoadingState());
    try {
      var response = await ApiManager.fetchSources(categoryId);

      if (response.status == "ok") {
        sourceList = response.sources;
        emit(HomeSourceSuccessState(sourceList));
      } else {
        emit(HomeSourceErrorState());
      }
    } catch (e) {
      emit(HomeSourceErrorState());
    }
  }

  getArticals(String sourceId) async {
    emit(HomeArticalsLoadingState());
    try {
      var response = await ApiManager.fetchArticles(sourceId);

      if (response.status == "ok") {
        articlesList = response.articles ?? [];
        emit(HomeArticalsSuccessState());
      } else {
        emit(HomeArticalsErrorState());
      }
    } catch (e) {
      emit(HomeArticalsErrorState());
    }
  }
}