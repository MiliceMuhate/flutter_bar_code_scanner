part of 'bar_code_scanner_bloc.dart';

abstract class BarCodeScannerState extends Equatable {
  const BarCodeScannerState();  

  @override
  List<Object> get props => [];
}
class BarCodeScannerInitial extends BarCodeScannerState {}
