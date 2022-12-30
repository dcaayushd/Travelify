import 'package:bloc/bloc.dart';
import 'package:travelify/cubit/app_cubit_states.dart';
import 'package:travelify/models/data_model.dart';
import 'package:travelify/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  Future<void> getData() async {
    try{
      emit(LoadingState());
      places =await data.getInfo();
      emit(LoadedState(places));
    }catch(e){
//
    }
  }

  detailPge(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }
}