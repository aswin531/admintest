class CarVehicle {
  final String carId;
   String make;
   String engine;
   int seatCapacity;
   String model;
   String body;
   int year;
   String color;
   double rentalPriceDay;
   bool status;
   String mainImageUrl;
   List<String> imageUrls;

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

  factory CarVehicle.fromFirestoreDcument(Map<String, dynamic> map, String id) {
    return CarVehicle(
        carId: id,
        make: map["make"] ?? "Toyota",
        engine: map["engine"] ?? "Camry",
        seatCapacity: map["seatCapacity"] ?? 5,
        model: map["model"],
        body: map["body"],
        year: map["year"],
        color: map["color"],
        rentalPriceDay: map["rentalPriceDay"] ?? 2500,
        status: map["status"],
        imageUrls: List<String>.from(map["imageUrls"] ?? []),
        mainImageUrl: map["mainImageUrl"] as String? ?? '');
  }
}
