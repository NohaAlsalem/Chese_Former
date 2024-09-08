import 'package:bloc/bloc.dart';
import 'package:chese_former/to_mom/on_Bording_Cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class onPordingCub extends Cubit<onPording>{
  onPordingCub() :super (initial());
  static onPordingCub get(context)=>BlocProvider.of(context);
  bool isLast=false;
  changeisLast(bool x){
    isLast=x;
    emit(changeIsLast());
  }
}