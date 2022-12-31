import 'package:flutter/material.dart';

class KConstants {
  static Color baseRedColor = Color(0xFFEC0606);
  static Color baseTwoRedColor = Color(0xFFF14444);
  static Color baseThreeRedColor = Color(0xFFF58383);
  static Color baseFourRedColor = Color(0xFFFAC1C1);

  static Color baseAccentColor = Color(0xFF800000);
  static Color baseTwoAccentColor = Color(0xFFA04040);
  static Color baseThreeAccentColor = Color(0xFFBF8080);
  static Color baseFourAccentColor = Color(0xFFDFBFBF);

  static Color baseDarkColor = Color(0xFF363636);
  static Color baseTwoDarkColor = Color(0xFF686868);
  static Color baseThreeDarkColor = Color(0xFF9B9B9B);
  static Color baseFourDarkColor = Color(0xFFCDCDCD);

  static Color baseGreyColor = Color(0xFF828282);
  static Color baseTwoGreyColor = Color(0xFFA1A1A1);
  static Color baseThreeGreyColor = Color(0xFFC0C0C0);
  static Color baseFourGreyColor = Color(0xFFE0E0E0);
  static Color baseFiveGreyColor = Color(0xffF2F2F2);
  static Color baseSixGreyColor = Color(0xffF5F5F5F5);

  static Color baseGreenColor = Color(0xFF15BE77);
  static Color baseOrangeColor = Color(0xFFFF9012);

  static Color baseBlueColor = Color(0xFF0000FF);

  static List<String> foodName = [
    "Pounded Yam and Egusi",
    "Meatpie",
    "Fish Pie",
    "Shawarma",
    "Samosa",
    "Chilled Ice Cream",
    "Dodo and Beans",
    "Ewa Agoyin",
    "Dodo and Beans",
    "Oreos Milkshake",
    "Banana Milkshake",
    "Grilled Chicken",
    "Amala and Ewedu",
    "Chicken Wings",
    "Potato and Chips",
    "Baked Beans",
    "Moi-moi and Egg",
    "Freshly Boiled Eggs",
    "Scotched Eggs",
    "Long Island",
    "Heartbreak Lake",
    "Squishes",
    "Bread and Akara",
    "Akara and Pap",
    "Last last Breakfast",
    "Love Island",
    "Pina Colada",
    "Sweet Honey",
    "Pankcake",
    "Creamy Muffins"
  ];

  static List<String> restaurantImages = [
    "images/Res-2.png",
    "images/Res-3.png",
    "images/Res-4.png",
    "images/Res-5.png",
    "images/Res-7.png",
    "images/Restaurant.png",
  ];

  static List<String> foodImages = [
    "images/Rectangle 6.png",
    "images/Rectangle 6-1.png",
    "images/Rectangle 6-2.png",
    "images/Rectangle 6-3.png",
    "images/Rectangle 6-4.png",
    "images/food3.png",
    "images/food33.png",
    "images/food34-PhotoRoom.png",
    "images/Rectangle 6.png",
    "images/Rectangle 6-1.png",
    "images/Rectangle 6-2.png",
    "images/Rectangle 6-3.png",
    "images/Rectangle 6-4.png",
    "images/food3.png",
    "images/food33.png",
    "images/food34-PhotoRoom.png",
    "images/Rectangle 6.png",
    "images/Rectangle 6-1.png",
    "images/Rectangle 6-2.png",
    "images/Rectangle 6-3.png",
    "images/Rectangle 6-4.png",
    "images/food3.png",
    "images/food33.png",
    "images/food34-PhotoRoom.png",
    "images/Rectangle 6.png",
    "images/Rectangle 6-1.png",
    "images/Rectangle 6-2.png",
    "images/Rectangle 6-3.png",
    "images/Rectangle 6-4.png",
    "images/food3.png",
  ];

  static List<String> restaurantName = [
    "Mr. Biggs",
    "Chicken Republic",
    "Dominos Pizza",
    "Captain Cook",
    "Madam 12:30",
    "Mama Ebo Pepper Rice",
    "Omega Restaurant",
    "Chef's Kiss",
    "Plaidies",
    "Junkyard",
    "Sunrise",
    "Chop Belleful",
    "Oga Bole",
    "Bole Republic",
    "Eat You Out",
    "Kazeem's Kitchen",
    "GT Plaza",
    "Kaydees",
  ];

  static String deliveryAddress =
      "Plot 56, Garki Market opposite GT Plaza, FCT, Abuja";

  static List<String> States = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Enugu",
    "Edo",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Kastina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara",
    "Abuja"
  ];

  // static List<Object> restaurantFullData = [];
}

class RestaurantFullData {
  String restaurantName;
  String restaurantLocation;
  String restaurantOpen;
  String restaurantDelivery;
  String restaurantClose;
  List<String> meals;

  RestaurantFullData(
      this.restaurantName,
      this.restaurantLocation,
      this.restaurantOpen,
      this.restaurantDelivery,
      this.restaurantClose,
      this.meals);

  static List<Object> mealsImagePrice = [];

  static List<RestaurantFullData> chopwellRestaurants = [
    RestaurantFullData("Chicken Republic", "Kubwa, Abuja", "12: 00pm",
        "15 minutes", "9:00 pm", [
      "Pounded Yam and Egusi",
      "Meatpie",
      "Fish Pie",
      "Shawarma",
      "Samosa",
      "Chilled Ice Cream",
      "Dodo and Beans",
      "Ewa Agoyin",
      "Dodo and Beans",
      "Oreos Milkshake",
      "Banana Milkshake",
      "Grilled Chicken",
      "Amala and Ewedu",
      "Chicken Wings",
      "Potato and Chips",
      "Baked Beans",
      "Moi-moi and Egg",
      "Freshly Boiled Eggs",
      "Scotched Eggs",
      "Long Island",
      "Heartbreak Lake",
      "Squishes",
      "Bread and Akara",
      "Akara and Pap",
      "Last last Breakfast",
      "Love Island",
      "Pina Colada",
      "Sweet Honey",
      "Pankcake",
      "Creamy Muffins"
    ]),
    RestaurantFullData(
        "Banana Island", "Apo, Abuja", "11: 30pm", "25 minutes", "9:00 pm", [
      "Pounded Yam and Egusi",
      "Meatpie",
      "Fish Pie",
      "Shawarma",
      "Samosa",
      "Chilled Ice Cream",
      "Dodo and Beans",
      "Ewa Agoyin",
      "Dodo and Beans",
      "Oreos Milkshake",
      "Banana Milkshake",
      "Grilled Chicken",
      "Amala and Ewedu",
      "Chicken Wings",
      "Potato and Chips",
      "Baked Beans",
      "Moi-moi and Egg",
      "Freshly Boiled Eggs",
      "Scotched Eggs",
      "Long Island",
      "Heartbreak Lake",
      "Squishes",
      "Bread and Akara",
      "Akara and Pap",
      "Last last Breakfast",
      "Love Island",
      "Pina Colada",
      "Sweet Honey",
      "Pankcake",
      "Creamy Muffins"
    ]),
    RestaurantFullData(
        "Stop 2 Shop", "Gudu, Abuja", "12: 00pm", "10 minutes", "9:00 pm", [
      "Pounded Yam and Egusi",
      "Meatpie",
      "Fish Pie",
      "Shawarma",
      "Samosa",
      "Chilled Ice Cream",
      "Dodo and Beans",
      "Ewa Agoyin",
      "Dodo and Beans",
      "Oreos Milkshake",
      "Banana Milkshake",
      "Grilled Chicken",
      "Amala and Ewedu",
      "Chicken Wings",
      "Potato and Chips",
      "Baked Beans",
      "Moi-moi and Egg",
      "Freshly Boiled Eggs",
      "Scotched Eggs",
      "Long Island",
      "Heartbreak Lake",
      "Squishes",
      "Bread and Akara",
      "Akara and Pap",
      "Last last Breakfast",
      "Love Island",
      "Pina Colada",
      "Sweet Honey",
      "Pankcake",
      "Creamy Muffins"
    ]),
    RestaurantFullData("Passover Meals", "Gwagwa, Abuja", "12: 00 pm",
        "12 minutes", "9:00 pm", [
      "Pounded Yam and Egusi",
      "Meatpie",
      "Fish Pie",
      "Shawarma",
      "Samosa",
      "Chilled Ice Cream",
      "Dodo and Beans",
      "Ewa Agoyin",
      "Dodo and Beans",
      "Oreos Milkshake",
      "Banana Milkshake",
      "Grilled Chicken",
      "Amala and Ewedu",
      "Chicken Wings",
      "Potato and Chips",
      "Baked Beans",
      "Moi-moi and Egg",
      "Freshly Boiled Eggs",
      "Scotched Eggs",
      "Long Island",
      "Heartbreak Lake",
      "Squishes",
      "Bread and Akara",
      "Akara and Pap",
      "Last last Breakfast",
      "Love Island",
      "Pina Colada",
      "Sweet Honey",
      "Pankcake",
      "Creamy Muffins"
    ]),
    RestaurantFullData("PurpleStone Eateries", "Gwarinpa, Abuja", "8: 00 am",
        "10 minutes", "9:00 pm", [
      "Pounded Yam and Egusi",
      "Meatpie",
      "Fish Pie",
      "Shawarma",
      "Samosa",
      "Chilled Ice Cream",
      "Dodo and Beans",
      "Ewa Agoyin",
      "Dodo and Beans",
      "Oreos Milkshake",
      "Banana Milkshake",
      "Grilled Chicken",
      "Amala and Ewedu",
      "Chicken Wings",
      "Potato and Chips",
      "Baked Beans",
      "Moi-moi and Egg",
      "Freshly Boiled Eggs",
      "Scotched Eggs",
      "Long Island",
      "Heartbreak Lake",
      "Squishes",
      "Bread and Akara",
      "Akara and Pap",
      "Last last Breakfast",
      "Love Island",
      "Pina Colada",
      "Sweet Honey",
      "Pankcake",
      "Creamy Muffins"
    ]),
    RestaurantFullData("Cassava Pits", "Gwagwalada, Abuja", "10: 00 pm",
        "40 minutes", "9:00 pm", [
      "Pounded Yam and Egusi",
      "Meatpie",
      "Fish Pie",
      "Shawarma",
      "Samosa",
      "Chilled Ice Cream",
      "Dodo and Beans",
      "Ewa Agoyin",
      "Dodo and Beans",
      "Oreos Milkshake",
      "Banana Milkshake",
      "Grilled Chicken",
      "Amala and Ewedu",
      "Chicken Wings",
      "Potato and Chips",
      "Baked Beans",
      "Moi-moi and Egg",
      "Freshly Boiled Eggs",
      "Scotched Eggs",
      "Long Island",
      "Heartbreak Lake",
      "Squishes",
      "Bread and Akara",
      "Akara and Pap",
      "Last last Breakfast",
      "Love Island",
      "Pina Colada",
      "Sweet Honey",
      "Pankcake",
      "Creamy Muffins"
    ]),
    RestaurantFullData("Dominos Pizza", "Maitama, Abuja", "12: 30 pm",
        "25 minutes", "9:00 pm", [
      "Pounded Yam and Egusi",
      "Meatpie",
      "Fish Pie",
      "Shawarma",
      "Samosa",
      "Chilled Ice Cream",
      "Dodo and Beans",
      "Ewa Agoyin",
      "Dodo and Beans",
      "Oreos Milkshake",
      "Banana Milkshake",
      "Grilled Chicken",
      "Amala and Ewedu",
      "Chicken Wings",
      "Potato and Chips",
      "Baked Beans",
      "Moi-moi and Egg",
      "Freshly Boiled Eggs",
      "Scotched Eggs",
      "Long Island",
      "Heartbreak Lake",
      "Squishes",
      "Bread and Akara",
      "Akara and Pap",
      "Last last Breakfast",
      "Love Island",
      "Pina Colada",
      "Sweet Honey",
      "Pankcake",
      "Creamy Muffins"
    ]),
    RestaurantFullData(
        "Mr. Biggs", "Garki, Abuja", "12: 30 pm", "15 minutes", "12:00 pm", [
      "Pounded Yam and Egusi",
      "Meatpie",
      "Fish Pie",
      "Shawarma",
      "Samosa",
      "Chilled Ice Cream",
      "Dodo and Beans",
      "Ewa Agoyin",
      "Dodo and Beans",
      "Oreos Milkshake",
      "Banana Milkshake",
      "Grilled Chicken",
      "Amala and Ewedu",
      "Chicken Wings",
      "Potato and Chips",
      "Baked Beans",
      "Moi-moi and Egg",
      "Freshly Boiled Eggs",
      "Scotched Eggs",
      "Long Island",
      "Heartbreak Lake",
      "Squishes",
      "Bread and Akara",
      "Akara and Pap",
      "Last last Breakfast",
      "Love Island",
      "Pina Colada",
      "Sweet Honey",
      "Pankcake",
      "Creamy Muffins"
    ]),
  ];
}

class ProductDetail {
  String mealPrice;
  String mealName;

  ProductDetail(this.mealPrice, this.mealName);

  static List<ProductDetail> productDetails = [
    ProductDetail("images/Res-2.png", "dodo"),
    ProductDetail("images/Res-3.png", "beans"),
    ProductDetail("images/Res-4.png", "rice"),
    ProductDetail("images/Res-5.png", "pounded yam"),
    ProductDetail("images/Res-7.png", "semovita"),
    ProductDetail("images/Rectangle 6.png", "meat"),
    ProductDetail("images/Rectangle 6-1", "fish"),
  ];
}

class FavouriteMealData {
  String restaurantImage;
  String date;
  String foodAmount;
  String restaurantName;

  FavouriteMealData(
      this.restaurantImage, this.date, this.foodAmount, this.restaurantName);

  static List<FavouriteMealData> faveMeals = [
    FavouriteMealData(
        "images/Res-2.png", "june 19th", "\$400", "Chicken Republic"),
    FavouriteMealData(
        "images/Restaurant.png", "june 19th", "\$500", "Mr. Biggs"),
    FavouriteMealData("images/Res-3.png", "june 20th", "\$600", "Eat & Chop"),
    FavouriteMealData(
        "images/Res-4.png", "june 25th", "\$700", "Baze Eateries"),
    FavouriteMealData(
        "images/Res-5.png", "june 30th", "\$1400", "Comme Choupe"),
  ];
}
