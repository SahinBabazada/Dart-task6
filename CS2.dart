main() {
  Map<String, List<int>> customers = {
    'Shahin': [120, 250],
    'Faig': [320, 150]
  };
  customers.forEach((key, value) {
    customers[key] = customers[key]!.map((e) => e > 200 ? e + 10 : e).toList();
  });
  print(customers);
}
