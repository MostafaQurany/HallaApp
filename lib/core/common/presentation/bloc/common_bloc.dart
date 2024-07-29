import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'common_event.dart';
part 'common_state.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
 
  CommonBloc(
    
  )   : 
        super(CommonInitial()) {
    on<CommonEvent>((event, emit) {});
   
  }

}
