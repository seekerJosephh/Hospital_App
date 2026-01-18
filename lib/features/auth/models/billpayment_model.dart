class BillpaymentModel {
  String hospitalName;
  String date;
  String staffName;
  String typeOfDisease;
  int checkFee;
  String warranty;
  int drugPrices;
  int total;
  Actions actions;

  BillpaymentModel({
    required this.hospitalName,
    required this.date,
    required this.staffName,
    required this.typeOfDisease,
    required this.checkFee,
    required this.warranty,
    required this.drugPrices,
    required this.total,
    required this.actions,
  });

  factory BillpaymentModel.fromJson(Map<String, dynamic> json) {
    return BillpaymentModel(
      hospitalName: json['hospitalName'],
      date: json['date'],
      staffName: json['staffName'],
      typeOfDisease: json['typeOfDisease'],
      checkFee: json['checkFee'],
      warranty: json['warranty'],
      drugPrices: json['drugPrices'],
      total: json['total'],
      actions: Actions.fromJson(json['actions']),
    );
  }
}

class Actions {
  bool view;
  bool pay;

  Actions({required this.view, required this.pay});

  factory Actions.fromJson(Map<String, dynamic> json) {
    return Actions(
      view: json['view'],
      pay: json['pay'],
    );
  }
}
