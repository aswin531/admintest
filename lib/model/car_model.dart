class CarVehicle {
  final String carId;
  final String make;
  final String engine;
  final int seatCapacity;
  final String model;
  final String body;
  final int year;
  final String color;
  final double rentalPriceDay;
  final bool status;
  final String mainImageUrl;
  final List<String> imageUrls;

  CarVehicle(
      {required this.carId,
      required this.make,
      required this.engine,
      required this.seatCapacity,
      required this.model,
      required this.body,
      required this.year,
      required this.color,
      required this.rentalPriceDay,
      required this.status,
      required this.imageUrls,
      required this.mainImageUrl});

  Map<String, dynamic> toFireStoreDocument() {
    return {
      "make": make,
      "engine": engine,
      "seatCapacity": seatCapacity,
      "model": model,
      "body": body,
      "year": year,
      "color": color,
      "rentalPricePerDay": rentalPriceDay,
      "status": status,
      "mainimageUrl": mainImageUrl,
      "imageUrls": imageUrls,
    };
  }

  factory CarVehicle.fromFirestoreMap(Map<String, dynamic> map, String id) {
    return CarVehicle(
        carId: id,
        make: map["make"] ?? "Toyota",
        engine: map["engine"] ?? "Camry",
        seatCapacity: map["seatCapacity"] ?? 5,
        model: map["model"],
        body: map["body"],
        year: map["year"],
        color: map["color"],
        rentalPriceDay: map["rentalPriceDay"],
        status: map["status"],
        imageUrls: map["imageUrls"],
        mainImageUrl: map["mainImageUrl"]);
  }
}
