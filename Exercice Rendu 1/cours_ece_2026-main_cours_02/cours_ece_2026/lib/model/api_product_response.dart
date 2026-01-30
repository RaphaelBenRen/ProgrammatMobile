// ignore_for_file: constant_identifier_names

/// Classes pour mapper la réponse JSON de l'API
class ApiProductResponse {
  final ApiProduct? response;
  final String? error;

  ApiProductResponse({
    this.response,
    this.error,
  });

  ApiProductResponse.fromJSON(Map<String, dynamic> json)
      : response = json['response'] != null
            ? ApiProduct.fromJSON(json['response'])
            : null,
        error = json['error'];
}

class ApiProduct {
  final String barcode;
  final String? name;
  final String? altName;
  final ApiPictures? pictures;
  final String? quantity;
  final List<String>? brands;
  final List<String>? stores;
  final List<String>? countries;
  final List<String>? manufacturingCountries;
  final String? nutriScore;
  final int? novaScore;
  final int? ecoScore;
  final String? ecoScoreGrade;
  final int? nutritionScore;
  final ApiIngredients? ingredients;
  final ApiNutrientLevels? nutrientLevels;
  final ApiNutritionFacts? nutritionFacts;
  final ApiLevels? levels;
  final ApiTraces? traces;
  final Map<String, String>? additives;
  final ApiAllergens? allergens;
  final List<String>? packaging;
  final ApiAnalysis? analysis;

  ApiProduct({
    required this.barcode,
    this.name,
    this.altName,
    this.pictures,
    this.quantity,
    this.brands,
    this.stores,
    this.countries,
    this.manufacturingCountries,
    this.nutriScore,
    this.novaScore,
    this.ecoScore,
    this.ecoScoreGrade,
    this.nutritionScore,
    this.ingredients,
    this.nutrientLevels,
    this.nutritionFacts,
    this.levels,
    this.traces,
    this.additives,
    this.allergens,
    this.packaging,
    this.analysis,
  });

  ApiProduct.fromJSON(Map<String, dynamic> json)
      : barcode = json['barcode'],
        name = json['name'],
        altName = json['altName'],
        pictures = json['pictures'] != null
            ? ApiPictures.fromJSON(json['pictures'])
            : null,
        quantity = json['quantity'],
        brands = json['brands'] != null
            ? List<String>.from(json['brands'])
            : null,
        stores =
            json['stores'] != null ? List<String>.from(json['stores']) : null,
        countries = json['countries'] != null
            ? List<String>.from(json['countries'])
            : null,
        manufacturingCountries = json['manufacturingCountries'] != null
            ? List<String>.from(json['manufacturingCountries'])
            : null,
        nutriScore = json['nutriScore'],
        novaScore = json['novaScore'],
        ecoScore = json['ecoScore'],
        ecoScoreGrade = json['ecoScoreGrade'],
        nutritionScore = json['nutritionScore'],
        ingredients = json['ingredients'] != null
            ? ApiIngredients.fromJSON(json['ingredients'])
            : null,
        nutrientLevels = json['nutrientLevels'] != null
            ? ApiNutrientLevels.fromJSON(json['nutrientLevels'])
            : null,
        nutritionFacts = json['nutritionFacts'] != null
            ? ApiNutritionFacts.fromJSON(json['nutritionFacts'])
            : null,
        levels = json['levels'] != null
            ? ApiLevels.fromJSON(json['levels'])
            : null,
        traces = json['traces'] != null
            ? ApiTraces.fromJSON(json['traces'])
            : null,
        additives = json['additives'] != null
            ? Map<String, String>.from(json['additives'])
            : null,
        allergens = json['allergens'] != null
            ? ApiAllergens.fromJSON(json['allergens'])
            : null,
        packaging = json['packaging'] != null
            ? List<String>.from(json['packaging'])
            : null,
        analysis = json['analysis'] != null
            ? ApiAnalysis.fromJSON(json['analysis'])
            : null;
}

class ApiPictures {
  final String? product;
  final String? front;
  final String? ingredients;
  final String? nutrition;

  ApiPictures({
    this.product,
    this.front,
    this.ingredients,
    this.nutrition,
  });

  ApiPictures.fromJSON(Map<String, dynamic> json)
      : product = json['product'],
        front = json['front'],
        ingredients = json['ingredients'],
        nutrition = json['nutrition'];
}

class ApiIngredients {
  final bool? containsPalmOil;
  final List<String>? list;
  final String? withAllergens;
  final List<ApiIngredientDetail>? details;

  ApiIngredients({
    this.containsPalmOil,
    this.list,
    this.withAllergens,
    this.details,
  });

  ApiIngredients.fromJSON(Map<String, dynamic> json)
      : containsPalmOil = json['containsPalmOil'],
        list = json['list'] != null ? List<String>.from(json['list']) : null,
        withAllergens = json['withAllergens'],
        details = json['details'] != null
            ? (json['details'] as List)
                .map((e) => ApiIngredientDetail.fromJSON(e))
                .toList()
            : null;
}

class ApiIngredientDetail {
  final bool? vegan;
  final bool? vegetarian;
  final bool? containsPalmOil;
  final String? percent;
  final String? value;

  ApiIngredientDetail({
    this.vegan,
    this.vegetarian,
    this.containsPalmOil,
    this.percent,
    this.value,
  });

  ApiIngredientDetail.fromJSON(Map<String, dynamic> json)
      : vegan = json['vegan'],
        vegetarian = json['vegetarian'],
        containsPalmOil = json['containsPalmOil'],
        percent = json['percent'],
        value = json['value'];
}

class ApiNutrientLevels {
  final ApiNutrientLevel? fat;
  final ApiNutrientLevel? salt;
  final ApiNutrientLevel? saturatedFat;
  final ApiNutrientLevel? sugars;

  ApiNutrientLevels({
    this.fat,
    this.salt,
    this.saturatedFat,
    this.sugars,
  });

  ApiNutrientLevels.fromJSON(Map<String, dynamic> json)
      : fat = json['fat'] != null ? ApiNutrientLevel.fromJSON(json['fat']) : null,
        salt = json['salt'] != null ? ApiNutrientLevel.fromJSON(json['salt']) : null,
        saturatedFat = json['saturatedFat'] != null
            ? ApiNutrientLevel.fromJSON(json['saturatedFat'])
            : null,
        sugars = json['sugars'] != null
            ? ApiNutrientLevel.fromJSON(json['sugars'])
            : null;
}

class ApiNutrientLevel {
  final String? level;
  final double? per100g;

  ApiNutrientLevel({
    this.level,
    this.per100g,
  });

  ApiNutrientLevel.fromJSON(Map<String, dynamic> json)
      : level = json['level'],
        per100g = json['per100g']?.toDouble();
}

class ApiNutritionFacts {
  final String? servingSize;
  final ApiNutriment? calories;
  final ApiNutriment? fat;
  final ApiNutriment? saturatedFat;
  final ApiNutriment? carbohydrate;
  final ApiNutriment? sugar;
  final ApiNutriment? fiber;
  final ApiNutriment? proteins;
  final ApiNutriment? sodium;
  final ApiNutriment? salt;
  final ApiNutriment? energy;

  ApiNutritionFacts({
    this.servingSize,
    this.calories,
    this.fat,
    this.saturatedFat,
    this.carbohydrate,
    this.sugar,
    this.fiber,
    this.proteins,
    this.sodium,
    this.salt,
    this.energy,
  });

  ApiNutritionFacts.fromJSON(Map<String, dynamic> json)
      : servingSize = json['servingSize'],
        calories = json['calories'] != null
            ? ApiNutriment.fromJSON(json['calories'])
            : null,
        fat = json['fat'] != null ? ApiNutriment.fromJSON(json['fat']) : null,
        saturatedFat = json['saturatedFat'] != null
            ? ApiNutriment.fromJSON(json['saturatedFat'])
            : null,
        carbohydrate = json['carbohydrate'] != null
            ? ApiNutriment.fromJSON(json['carbohydrate'])
            : null,
        sugar =
            json['sugar'] != null ? ApiNutriment.fromJSON(json['sugar']) : null,
        fiber =
            json['fiber'] != null ? ApiNutriment.fromJSON(json['fiber']) : null,
        proteins = json['proteins'] != null
            ? ApiNutriment.fromJSON(json['proteins'])
            : null,
        sodium = json['sodium'] != null
            ? ApiNutriment.fromJSON(json['sodium'])
            : null,
        salt = json['salt'] != null ? ApiNutriment.fromJSON(json['salt']) : null,
        energy = json['energy'] != null
            ? ApiNutriment.fromJSON(json['energy'])
            : null;
}

class ApiNutriment {
  final String? unit;
  final String? perServing;
  final String? per100g;

  ApiNutriment({
    this.unit,
    this.perServing,
    this.per100g,
  });

  ApiNutriment.fromJSON(Map<String, dynamic> json)
      : unit = json['unit'],
        perServing = json['perServing']?.toString(),
        per100g = json['per100g']?.toString();
}

class ApiLevels {
  final ApiLevel? energy;
  final ApiLevel? fiber;
  final ApiLevel? fruitsVegetablesLegumes;
  final ApiLevel? proteins;
  final ApiLevel? salt;
  final ApiLevel? saturatedFat;
  final ApiLevel? sugars;

  ApiLevels({
    this.energy,
    this.fiber,
    this.fruitsVegetablesLegumes,
    this.proteins,
    this.salt,
    this.saturatedFat,
    this.sugars,
  });

  ApiLevels.fromJSON(Map<String, dynamic> json)
      : energy =
            json['energy'] != null ? ApiLevel.fromJSON(json['energy']) : null,
        fiber = json['fiber'] != null ? ApiLevel.fromJSON(json['fiber']) : null,
        fruitsVegetablesLegumes = json['fruitsVegetablesLegumes'] != null
            ? ApiLevel.fromJSON(json['fruitsVegetablesLegumes'])
            : null,
        proteins = json['proteins'] != null
            ? ApiLevel.fromJSON(json['proteins'])
            : null,
        salt = json['salt'] != null ? ApiLevel.fromJSON(json['salt']) : null,
        saturatedFat = json['saturatedFat'] != null
            ? ApiLevel.fromJSON(json['saturatedFat'])
            : null,
        sugars =
            json['sugars'] != null ? ApiLevel.fromJSON(json['sugars']) : null;
}

class ApiLevel {
  final double? points;
  final double? maxPoints;
  final String? unit;
  final double? value;
  final String? type;

  ApiLevel({
    this.points,
    this.maxPoints,
    this.unit,
    this.value,
    this.type,
  });

  ApiLevel.fromJSON(Map<String, dynamic> json)
      : points = json['points']?.toDouble(),
        maxPoints = json['maxPoints']?.toDouble(),
        unit = json['unit'],
        value = json['value']?.toDouble(),
        type = json['type'];
}

class ApiTraces {
  final List<String>? list;

  ApiTraces({this.list});

  ApiTraces.fromJSON(Map<String, dynamic> json)
      : list = json['list'] != null ? List<String>.from(json['list']) : null;
}

class ApiAllergens {
  final List<String>? list;

  ApiAllergens({this.list});

  ApiAllergens.fromJSON(Map<String, dynamic> json)
      : list = json['list'] != null ? List<String>.from(json['list']) : null;
}

class ApiAnalysis {
  final String? palmOil;
  final String? vegan;
  final String? vegetarian;

  ApiAnalysis({
    this.palmOil,
    this.vegan,
    this.vegetarian,
  });

  ApiAnalysis.fromJSON(Map<String, dynamic> json)
      : palmOil = json['palmOil'],
        vegan = json['vegan'],
        vegetarian = json['vegetarian'];
}
