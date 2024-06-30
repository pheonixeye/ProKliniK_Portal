import 'package:equatable/equatable.dart';

class Faq extends Equatable {
  final String qEn;
  final String qAr;
  final String aEn;
  final String aAr;

  const Faq({
    required this.qEn,
    required this.qAr,
    required this.aEn,
    required this.aAr,
  });

  @override
  List<Object?> get props => [
        qEn,
        qAr,
        aEn,
        aAr,
      ];
}
