import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bar_code_scanner_event.dart';
part 'bar_code_scanner_state.dart';

class BarCodeScannerBloc extends Bloc<BarCodeScannerEvent, BarCodeScannerState> {
  BarCodeScannerBloc() : super(BarCodeScannerInitial()) {
    on<BarCodeScannerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
