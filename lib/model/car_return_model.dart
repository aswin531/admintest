class CarReturnModel {
  final String returnId;
  final String carId;
  final String userId;
  final DateTime returnDate;
  final bool isDamaged;
  final double fuelLevel;
  final int mileage;
  final String? comments;
  final double lateFee;
  final double totalCost;

  CarReturnModel(
      this.returnId,
      this.carId,
      this.userId,
      this.returnDate,
      this.isDamaged,
      this.fuelLevel,
      this.mileage,
      this.comments,
      this.lateFee,
      this.totalCost);

  double calculateTotalCost(
      double baseRentalCost, double damageFee, double lateFee) {
    return baseRentalCost + damageFee + lateFee;
  }

  Map<String, dynamic> toJson() {
    return {
      'returnId': returnId,
      'carId': carId,
      'userId': userId,
      'returnDate': returnDate,
      'isDamaged': isDamaged,
      'fuelLevel': fuelLevel,
      'mileage': mileage,
      'comments': comments,
      'lateFee': lateFee,
      'totalCost': totalCost,
    };
  }

  factory CarReturnModel.fromJson(Map<String, dynamic> json) {
    return CarReturnModel(
        json['returnId'],
        json['carId'],
        json['userId'],
        json['returnDate'],
        json['isDamaged'],
        json['fuelLevel'],
        json['mileage'],
        json['comments'],
        json['lateFee'],
        json['totalCost']);
  }
}
