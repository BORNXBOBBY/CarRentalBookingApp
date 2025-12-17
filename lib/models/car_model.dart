class Car {
  final String id, brand, model, image, transmission, fuel;
  final double pricePerDay;

  Car({
    required this.id, required this.brand, required this.model,
    required this.image, required this.pricePerDay,
    required this.transmission, required this.fuel,
  });
}

// Mock Data
List<Car> mockCars = [
  Car(id: '1', brand: 'Tesla', model: 'Model 3', pricePerDay: 150, transmission: 'Automatic', fuel: 'Electric', image: 'https://img.freepik.com/free-photo/white-off-roader-jeep-parking_114579-4007.jpg'),
  Car(id: '2', brand: 'BMW', model: 'M4 Series', pricePerDay: 200, transmission: 'Automatic', fuel: 'Petrol', image: 'https://img.freepik.com/free-photo/silver-luxury-sedan-car_114579-4029.jpg'),
  Car(id: '3', brand: 'Toyota', model: 'Fortuner', pricePerDay: 120, transmission: 'Manual', fuel: 'Diesel', image: 'https://img.freepik.com/free-photo/white-off-roader-jeep-parking_114579-4007.jpg'),
  Car(id: '4', brand: 'Tesla', model: 'Model 3', pricePerDay: 150, transmission: 'Automatic', fuel: 'Electric', image: 'https://img.freepik.com/free-photo/white-off-roader-jeep-parking_114579-4007.jpg'),
  Car(id: '5', brand: 'BMW', model: 'M4 Series', pricePerDay: 200, transmission: 'Automatic', fuel: 'Petrol', image: 'https://img.freepik.com/free-photo/silver-luxury-sedan-car_114579-4029.jpg'),
  Car(id: '6', brand: 'Toyota', model: 'Fortuner', pricePerDay: 120, transmission: 'Manual', fuel: 'Diesel', image: 'https://img.freepik.com/free-photo/white-off-roader-jeep-parking_114579-4007.jpg'),
];