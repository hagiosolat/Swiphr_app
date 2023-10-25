class CarRide {
  const CarRide({required this.name, required this.price, this.isSelected=false});
  final String name;
  final int price;
  final bool isSelected;
}

List<CarRide> carRideList = const [
  CarRide(name: 'Toyota Camry', price: 7),
  CarRide(name: 'Lexus R700', price: 9),
  CarRide(name: 'Mercedes W90', price: 10),
];
