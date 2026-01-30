import 'package:formation_flutter/model/api_product_response.dart';
import 'package:formation_flutter/model/product.dart';

/// Convertit la réponse API en objet Product du domaine
Product convertApiProductToProduct(ApiProduct apiProduct) {
  return Product(
    barcode: apiProduct.barcode,
    name: apiProduct.name,
    altName: apiProduct.altName,
    picture: apiProduct.pictures?.front ?? apiProduct.pictures?.product,
    quantity: apiProduct.quantity,
    brands: apiProduct.brands,
    manufacturingCountries: apiProduct.manufacturingCountries,
    nutriScore: _convertNutriScore(apiProduct.nutriScore),
    nutriScoreLevels: _convertNutriScoreLevels(apiProduct.levels),
    novaScore: _convertNovaScore(apiProduct.novaScore),
    greenScore: _convertGreenScore(apiProduct.ecoScoreGrade),
    ingredients: apiProduct.ingredients?.list,
    ingredientsWithAllergens: apiProduct.ingredients?.withAllergens,
    traces: apiProduct.traces?.list,
    allergens: apiProduct.allergens?.list,
    additives: apiProduct.additives,
    nutrientLevels: _convertNutrientLevels(apiProduct.nutrientLevels),
    nutritionFacts: _convertNutritionFacts(apiProduct.nutritionFacts),
    ingredientsFromPalmOil: apiProduct.ingredients?.containsPalmOil,
    containsPalmOil: ProductAnalysis.fromString(apiProduct.analysis?.palmOil),
    isVegan: ProductAnalysis.fromString(apiProduct.analysis?.vegan),
    isVegetarian: ProductAnalysis.fromString(apiProduct.analysis?.vegetarian),
  );
}

ProductNutriScore _convertNutriScore(String? nutriScore) {
  if (nutriScore == null) return ProductNutriScore.unknown;
  
  return switch (nutriScore.toUpperCase()) {
    'A' => ProductNutriScore.A,
    'B' => ProductNutriScore.B,
    'C' => ProductNutriScore.C,
    'D' => ProductNutriScore.D,
    'E' => ProductNutriScore.E,
    _ => ProductNutriScore.unknown,
  };
}

ProductNovaScore _convertNovaScore(int? novaScore) {
  if (novaScore == null) return ProductNovaScore.unknown;
  
  return switch (novaScore) {
    1 => ProductNovaScore.group1,
    2 => ProductNovaScore.group2,
    3 => ProductNovaScore.group3,
    4 => ProductNovaScore.group4,
    _ => ProductNovaScore.unknown,
  };
}

ProductGreenScore _convertGreenScore(String? ecoScoreGrade) {
  if (ecoScoreGrade == null) return ProductGreenScore.unknown;
  
  return switch (ecoScoreGrade.toUpperCase()) {
    'A+' => ProductGreenScore.APlus,
    'A' => ProductGreenScore.A,
    'B' => ProductGreenScore.B,
    'C' => ProductGreenScore.C,
    'D' => ProductGreenScore.D,
    'E' => ProductGreenScore.E,
    'F' => ProductGreenScore.F,
    _ => ProductGreenScore.unknown,
  };
}

NutrientLevels? _convertNutrientLevels(ApiNutrientLevels? apiLevels) {
  if (apiLevels == null) return null;
  
  return NutrientLevels(
    salt: apiLevels.salt?.level,
    saturatedFat: apiLevels.saturatedFat?.level,
    sugars: apiLevels.sugars?.level,
    fat: apiLevels.fat?.level,
  );
}

NutritionFacts? _convertNutritionFacts(ApiNutritionFacts? apiNutritionFacts) {
  if (apiNutritionFacts == null) return null;
  
  return NutritionFacts(
    servingSize: apiNutritionFacts.servingSize ?? '100g',
    calories: _convertNutriment(apiNutritionFacts.calories),
    fat: _convertNutriment(apiNutritionFacts.fat),
    saturatedFat: _convertNutriment(apiNutritionFacts.saturatedFat),
    carbohydrate: _convertNutriment(apiNutritionFacts.carbohydrate),
    sugar: _convertNutriment(apiNutritionFacts.sugar),
    fiber: _convertNutriment(apiNutritionFacts.fiber),
    proteins: _convertNutriment(apiNutritionFacts.proteins),
    sodium: _convertNutriment(apiNutritionFacts.sodium),
    salt: _convertNutriment(apiNutritionFacts.salt),
    energy: _convertNutriment(apiNutritionFacts.energy),
  );
}

Nutriment? _convertNutriment(ApiNutriment? apiNutriment) {
  if (apiNutriment == null) return null;
  
  return Nutriment(
    unit: apiNutriment.unit ?? '',
    perServing: apiNutriment.perServing,
    per100g: apiNutriment.per100g,
  );
}

ProductNutriScoreLevels? _convertNutriScoreLevels(ApiLevels? apiLevels) {
  if (apiLevels == null) return null;
  
  return ProductNutriScoreLevels(
    energy: _convertNutriScoreLevel(apiLevels.energy),
    fiber: _convertNutriScoreLevel(apiLevels.fiber),
    fruitsVegetablesLegumes: _convertNutriScoreLevel(apiLevels.fruitsVegetablesLegumes),
    proteins: _convertNutriScoreLevel(apiLevels.proteins),
    salt: _convertNutriScoreLevel(apiLevels.salt),
    saturatedFat: _convertNutriScoreLevel(apiLevels.saturatedFat),
    sugars: _convertNutriScoreLevel(apiLevels.sugars),
  );
}

ProductNutriScoreLevel? _convertNutriScoreLevel(ApiLevel? apiLevel) {
  if (apiLevel == null) return null;
  
  return ProductNutriScoreLevel(
    points: apiLevel.points ?? 0.0,
    maxPoints: apiLevel.maxPoints ?? 0.0,
    unit: apiLevel.unit ?? '',
    value: apiLevel.value ?? 0.0,
    type: _convertNutriScoreLevelType(apiLevel.type),
  );
}

ProductNutriScoreLevelType _convertNutriScoreLevelType(String? type) {
  if (type == null) return ProductNutriScoreLevelType.unknown;
  
  return switch (type.toLowerCase()) {
    'positive' => ProductNutriScoreLevelType.positive,
    'negative' => ProductNutriScoreLevelType.negative,
    _ => ProductNutriScoreLevelType.unknown,
  };
}
