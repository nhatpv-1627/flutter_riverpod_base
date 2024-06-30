enum Flavor {
  develop,
  staging,
  production;

  static Flavor getByEnvironmentName(String environmentName) {
    switch (environmentName) {
      case "develop":
        return Flavor.develop;
      case "staging":
        return Flavor.staging;
      case "production":
        return Flavor.production;
      default:
        return Flavor.develop;
    }
  }
}
