void main(List<String> args) {
  
}

enum PlantType{nuclear,wind,water}

abstract class EnergyPlant{

  double energyLeft;
  PlantType type;

  EnergyPlant({required this.energyLeft, required this.type});

  void consumeEnergy(double amount);
}