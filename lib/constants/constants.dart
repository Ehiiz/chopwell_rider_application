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

  static Color baseShadowColor = Color(0x1A5A6CEA);

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

List<Map<String, dynamic>> defaultBankList = [
  {
    "id": 272,
    "code": "120001",
    "name": "9 Payment Service Bank",
    "logo": "",
    "created": "2020-10-09 15:20:59"
  },
  {
    "id": 219,
    "code": "090270",
    "name": "AB Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 109,
    "code": "070010",
    "name": "ABBEY MORTGAGE BANK",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 209,
    "code": "090260",
    "name": "Above Only Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 203,
    "code": "090197",
    "name": "ABU Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 286,
    "code": "090424",
    "name": "Abucoop Microfinance Bank",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 88,
    "code": "000014",
    "name": "Access Bank",
    "logo":
        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAPuSURBVGhD7Zh7TFNXHMe/tQUqlEZAymMrGLFGMjKzBFxIlLls7gGaxSzoHqIjm2L2MrCQkc0lRpmbWzYStsQ4Scge4pZNsoUYQ1L3SFgrThTwUaottDwK2hakpUJ76f3t0B4ljPDvDSz3kzTt93fP797PuffcP3oUxMASYxn/XlLI0lIhS0uFLC0VsrRUyNJSIUtLhSwtFf8v6Sn7Rf5r8bGgNPld8DXX8LS4WFA67B4EVAnwnzvKK4uHedLC2ABEYQrqLW9DHB+CQlTAf76eH52La9iDji4bBCHEK1HcnjF0XevDxESAV4BexzCs9iGQGI5kMTwN8yUr6xUieYZpdp4rV+3wjo7zCtBzawC2XhdPUeb8sQ383YiwdxjiXRuIVKC4BDarMGK0D4O0ydBsfIOPBH47dwHlNY3IXZ0B0x9X0W78FBvyDdj04mG0ne9E5tpMaOLjYP3zC6gN5QgGBWi1arzz2jPYvGEdtrxwCE8/nw+jsROO9q/huO3B5u2HUcDO8c8VO2iwCasKDzBDYHIqhPcrilFVsS1y7QfSgcvNCDs7IPrY3VAnQfNsNRQKJQKtn4MCI1CmrIUyMxfx+aWRxllElO6vR4JGjTyDHtVHT4Oc37M6uxpjTdF7SE9NRNuZQ5HM3hYoYrfCYW9Etl6HqiOnEGBPZFokdHQ70Nn6SWTU9Z5+5OVVwOs+jeSkFZHafR4sj7hHSyAMW6FMyoZKZ8CU6QdMmr+DIiULyuRsCINdiFkfnekMT+6shSK7DCXldTCaLFijT8OPLSaUlz7BjkaFxbAA+81+HNy/PZJnaD5rRvwqHTbtqEXy+n1oam6DbqUWJ4/txahvEoqsMtjsLjyyLguVH72MlPRd+OCzn3g3Z+ZO30cITpDnxC66+3Ml+Yx1NN5aR74zNeRt2E3TwXt8FBFbx4TYYp6IcjZWUdOvJirec4yyCw/wahToX6F9NSd5Imr9/TJBt4On+RQ89yEV7TzCE9Ff5mtsJRTxFGXeZo0w6YP/1FuISc5gM1oGweuEtuw4VMvnPqKk3Ndxj3WmpWgxYHHCcqEemsTl0Be8y94okX0IY/YG/NLSjr1vfgWsXIFEtQq+Gw14vOQgLl6y4aEcHVanp+L4x7uRV1iJ1JwMuIfcMJ+txbY9X0LJxt8eGcXWpx5Dy7fV/MqMiPp/CE2MkuebV8l74iUK+e7w6nwsN53Uc6ufp1mstgHqH5jtCwaD1H2jl3z+AK8Q2fpc1G3p44nI7Rmnzuu9PLGeUIi6WB4a8fDKLAtui4Xu2NmMRMSmGXhl8SDv5UmFLC0VsrRUyNJSIUtLhSwtFbK0VMjSUrEEpYF/AREybBR+bbExAAAAAElFTkSuQmCC",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 79,
    "code": "000005",
    "name": "Access Bank (Diamond)",
    "logo":
        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAPuSURBVGhD7Zh7TFNXHMe/tQUqlEZAymMrGLFGMjKzBFxIlLls7gGaxSzoHqIjm2L2MrCQkc0lRpmbWzYStsQ4Scge4pZNsoUYQ1L3SFgrThTwUaottDwK2hakpUJ76f3t0B4ljPDvDSz3kzTt93fP797PuffcP3oUxMASYxn/XlLI0lIhS0uFLC0VsrRUyNJSIUtLhSwtFf8v6Sn7Rf5r8bGgNPld8DXX8LS4WFA67B4EVAnwnzvKK4uHedLC2ABEYQrqLW9DHB+CQlTAf76eH52La9iDji4bBCHEK1HcnjF0XevDxESAV4BexzCs9iGQGI5kMTwN8yUr6xUieYZpdp4rV+3wjo7zCtBzawC2XhdPUeb8sQ383YiwdxjiXRuIVKC4BDarMGK0D4O0ydBsfIOPBH47dwHlNY3IXZ0B0x9X0W78FBvyDdj04mG0ne9E5tpMaOLjYP3zC6gN5QgGBWi1arzz2jPYvGEdtrxwCE8/nw+jsROO9q/huO3B5u2HUcDO8c8VO2iwCasKDzBDYHIqhPcrilFVsS1y7QfSgcvNCDs7IPrY3VAnQfNsNRQKJQKtn4MCI1CmrIUyMxfx+aWRxllElO6vR4JGjTyDHtVHT4Oc37M6uxpjTdF7SE9NRNuZQ5HM3hYoYrfCYW9Etl6HqiOnEGBPZFokdHQ70Nn6SWTU9Z5+5OVVwOs+jeSkFZHafR4sj7hHSyAMW6FMyoZKZ8CU6QdMmr+DIiULyuRsCINdiFkfnekMT+6shSK7DCXldTCaLFijT8OPLSaUlz7BjkaFxbAA+81+HNy/PZJnaD5rRvwqHTbtqEXy+n1oam6DbqUWJ4/txahvEoqsMtjsLjyyLguVH72MlPRd+OCzn3g3Z+ZO30cITpDnxC66+3Ml+Yx1NN5aR74zNeRt2E3TwXt8FBFbx4TYYp6IcjZWUdOvJirec4yyCw/wahToX6F9NSd5Imr9/TJBt4On+RQ89yEV7TzCE9Ff5mtsJRTxFGXeZo0w6YP/1FuISc5gM1oGweuEtuw4VMvnPqKk3Ndxj3WmpWgxYHHCcqEemsTl0Be8y94okX0IY/YG/NLSjr1vfgWsXIFEtQq+Gw14vOQgLl6y4aEcHVanp+L4x7uRV1iJ1JwMuIfcMJ+txbY9X0LJxt8eGcXWpx5Dy7fV/MqMiPp/CE2MkuebV8l74iUK+e7w6nwsN53Uc6ufp1mstgHqH5jtCwaD1H2jl3z+AK8Q2fpc1G3p44nI7Rmnzuu9PLGeUIi6WB4a8fDKLAtui4Xu2NmMRMSmGXhl8SDv5UmFLC0VsrRUyNJSIUtLhSwtFbK0VMjSUrEEpYF/AREybBR+bbExAAAAAElFTkSuQmCC",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 324,
    "code": "100052",
    "name": "Access Yelo & Beta",
    "logo": "",
    "created": "2021-07-26 09:20:59"
  },
  {
    "id": 243,
    "code": "100013",
    "name": "AccessMobile",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 148,
    "code": "090134",
    "name": "ACCION MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 174,
    "code": "090160",
    "name": "Addosser MFBB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 217,
    "code": "090268",
    "name": "Adeyemi College Staff Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 169,
    "code": "090155",
    "name": "ADVANS LAFAYETTE MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 258,
    "code": "100028",
    "name": "AG MORTGAGE BANK PLC",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 342,
    "code": "090531",
    "name": "Aku MFB",
    "logo": "",
    "created": "2023-03-01 10:47:59"
  },
  {
    "id": 147,
    "code": "090133",
    "name": "AL-BARKAH MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 208,
    "code": "090259",
    "name": "Alekun Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 225,
    "code": "090277",
    "name": "Alhayat MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 145,
    "code": "090131",
    "name": "ALLWORKERS MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 358,
    "code": "090548",
    "name": "ALLY MFB",
    "logo": "",
    "created": "2023-05-05 08:10:59"
  },
  {
    "id": 183,
    "code": "090169",
    "name": "Alphakapital MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 194,
    "code": "090180",
    "name": "Amju MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 130,
    "code": "090116",
    "name": "AMML MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 346,
    "code": "090610",
    "name": "AMOYE MFB",
    "logo": "",
    "created": "2023-03-21 12:41:59"
  },
  {
    "id": 340,
    "code": "090529",
    "name": "AMPERSAND MFB",
    "logo": "",
    "created": "2022-12-30 10:30:59"
  },
  {
    "id": 362,
    "code": "090645",
    "name": "AMUCHA MFB",
    "logo": "",
    "created": "2023-06-20 14:03:12"
  },
  {
    "id": 157,
    "code": "090143",
    "name": "APEKS Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 230,
    "code": "090282",
    "name": "Arise MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 117,
    "code": "090001",
    "name": "ASOSavings",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 357,
    "code": "090287",
    "name": "ASSETMATRIX MFB",
    "logo": "",
    "created": "2023-04-26 17:19:59"
  },
  {
    "id": 186,
    "code": "090172",
    "name": "Astrapolis MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 213,
    "code": "090264",
    "name": "Auchi Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 195,
    "code": "090188",
    "name": "Baines Credit MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 343,
    "code": "090581",
    "name": "Banc Corp MFB",
    "logo": "",
    "created": "2023-03-01 10:48:05"
  },
  {
    "id": 303,
    "code": "090425",
    "name": "Banex MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 141,
    "code": "090127",
    "name": "BC Kash MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 345,
    "code": "090615",
    "name": "BESTSTAR MFB",
    "logo": "",
    "created": "2023-03-21 12:40:59"
  },
  {
    "id": 289,
    "code": "090431",
    "name": "BLUEWHALES MFB",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 131,
    "code": "090117",
    "name": "Boctrust Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 314,
    "code": "090319",
    "name": "BONGHE MFB",
    "logo": "",
    "created": "2021-07-09 15:20:59"
  },
  {
    "id": 190,
    "code": "090176",
    "name": "Bosak MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 162,
    "code": "090148",
    "name": "Bowen MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 339,
    "code": "050006",
    "name": "BRANCH INTERNATIONAL FINANCIAL SERVICES",
    "logo": "",
    "created": "2022-11-28 12:01:59"
  },
  {
    "id": 114,
    "code": "070015",
    "name": "Brent Mortgage Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 276,
    "code": "090293",
    "name": "Brethren MFB",
    "logo": "",
    "created": "2021-01-29 15:20:59"
  },
  {
    "id": 271,
    "code": "090363",
    "name": "Bridgeway MFB",
    "logo": "",
    "created": "2020-10-09 15:20:59"
  },
  {
    "id": 322,
    "code": "090445",
    "name": "CAPSTONE MFB",
    "logo": "",
    "created": "2021-07-24 13:20:59"
  },
  {
    "id": 256,
    "code": "100026",
    "name": "Carbon",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 235,
    "code": "100005",
    "name": "Cellulant",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 168,
    "code": "090154",
    "name": "CEMCS MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 277,
    "code": "090397",
    "name": "Chanelle MFB",
    "logo": "",
    "created": "2021-01-29 15:20:59"
  },
  {
    "id": 309,
    "code": "090440",
    "name": "CHERISH MFB",
    "logo": "",
    "created": "2021-06-21 18:20:59"
  },
  {
    "id": 281,
    "code": "090416",
    "name": "CHIBUEZE MFB",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 155,
    "code": "090141",
    "name": "Chikum Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 158,
    "code": "090144",
    "name": "CIT Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 83,
    "code": "000009",
    "name": "Citi Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 331,
    "code": "090530",
    "name": "CONFIDENCE MFB",
    "logo": "",
    "created": "2022-09-19 10:13:59"
  },
  {
    "id": 359,
    "code": "090553",
    "name": "CONSISTENT TRUST MFB",
    "logo": "",
    "created": "2023-05-12 08:38:38"
  },
  {
    "id": 144,
    "code": "090130",
    "name": "CONSUMER  MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 261,
    "code": "100032",
    "name": "Contec Global",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 278,
    "code": "070021",
    "name": "COOP Mortgage Bank",
    "logo": "",
    "created": "2021-01-29 15:20:59"
  },
  {
    "id": 100,
    "code": "060001",
    "name": "Coronation",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 105,
    "code": "070006",
    "name": "Covenant MFB",
    "logo":
        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAIAAAC1eHXNAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAA0ASURBVFhHnVgJXFTVGv/uNjsMDMOAgoAIiAumKKXpUymzPbc0s0ye9bMsS201ey+Xp75earbw8plLz0xtcct6kimmqeGa4pILLigqAwMzwyx31nvv+87cCw6oqf1/Fzj3O98953++7zvfdw6UJElwOzhbX11y6vCui+crayuT/ZUdWG9+vLavJTbsswFQjKGVypTDGTPUlm6q+Ezlm1vArfI4W1f97o9frNpdAm5PRqJqdhb7WCJD02xAokKiFBQliaIBJJBESQyDGJaEIMWo9e0eNHYdx+oSlVFujJvzOFlTNXTZjBOnfwNan56gXpdHdzVQ9jD4RSDfSiKZnjw0UDRFUfJXkWElKeyXQl5t+j3mfrNpRi13XRc34TF46fTvftkAhjgQVPM7Uq+mQW0QAuGQJPhxDpyY0SbQmniKYsSgW+BtYthPsWqK0VCMSuaE4xM2YT6hz3RD1iPysNfihjzO1l3JmjYKhBCo9SBQx3pBWw3U+wOC364yd4zJHqxJ68cZWinajRBCvP/yr96zm/jKUlodQ7G6Rjai4KszZD5o7jdH1myB6/NYf2T30PkvgtEMFIsmr+0DFAgej03Xpr+p999kf5PP0C3ELwrIlE2OAXAcLHYd+ZxSGWhWQ94ljBm32twh+aFlkf5muA6P5fu3FBW/AfE4GQ1huNgH1CIfoDjL/YvUpuzI9ASysoyo2SPATgwVoijWbh7vtx6kNSaig+9Bjzo5P2lgsaLZiJY8Sk8fGjD7rwqJAGwtgK4qZzgxP+n+hdgrK7ectRGiKDbvkkjkAriOr7TveZ/RJ8lUhIDDmDc2Ln+8ohVBMx4O3mOa0A9iTEDTEILnUqE43eFOGWjuOwuVmmbYW/n71pMHjlVfcPJuNculm1v1Sssd2eNeJIi9LRaGwOn5qp21P73E6JOxjQoCX5sydC0X107RaMFD/+ZjPO8GTkUMK0Got8eRcFfivR+gCk4hisLzq+cv2fo16VNrgWbkiUEUIBwG3p3bocfCEZP653RDWQs2OL23stS27TVGZyFUxDBuqNQRJUo3MX4jpvywjHfUAsuRlxAszgl5ODOSwDecblbJF0xR/pJdG8FogrhE0BoIFZWGPBo9GIxgST1pvVg4Z2zuzGdC4ZC8bjJUBNjWZ9xrzCsSgy58xX0u+Oo9Fd/LvQhFOyyK3HN3Qmw8ehRXy4DEF9jYx7fTaiP25s0ee+zcEeIv2QB/jGAAeNe+6asK0nObRwxpXl4zSAy5KZrDjYyCNiO3yH2KPcasfB/UGkICIcDkJC/baaxMwjJl8LGq0xCbcEskECo1Kt859fE9547TGGdXQVZsGfCR4LPjfqcoWvQ7/DWH5D5Fb9W2b0Gtk9tonGeTw3TXl7HZ/f1xNqcNNDoyyG09Jkuvd0diIEfZgzDh4jK0Kb1ACBLrcHrPqTVyD+Exf/saEpvyBxIYOH9u/khszvnxy99+2wkSAz4/+HzgcYLbAW47BHgI+m/48O7UuISsxBTQaOPffIyMGQU0SVzBZDEQiRJGxV/YIctZ/FmwfT0JOhki9Nd7oNNob0hgOE56/8OghJteDIf8uuzBssqyshI0K1Zb+TUanoCvR2r2ebvVoNZWuxz4isJmMStJalMO7hpSlika61SYt2GCJjwuV/5OtoAMQeiV3ApY86TVC3KT0+w/v8XTWkzXrXtOjnl7hMdxZcI9w0fkF/ad9iQpfi0QCjxccN/0Tf+1856pA56Ys/UryW7VqdQv9H4ER0BvKWoA2owB3orvaE6HdSNYfwJ50D9XlAPb6BSEEOyU3RP/Lin9yqDRSZxBkMBYMMlW9i9PbU1m67bF6/8TEMKgjwWtHnSGq7/xoeniERPrL5/T0NSsR5+T/DzojQ28e9X+rVeTYAS6lD6YVrGBBTvccBEb9J4LJ5ScISMczm5zxzm7DVx2FjOVGNKm3O2r2skDN+2pNzPiLJCQ9P3R3YAGFwTwe8HrgnCIhE4woI+zOH0eXJLP6yZD2WvA6zZo9Qt3X80TCDSLytIZxCB5oWgs4PiXPm27TDJjE8SQ0dJhY/kvke1DSqS+7cBAbblOrZ/xw9KPHp8w7cFnPi5Z8e3ED4uHvzym54O+hTuTDUZpyb5MS2rphLldU7POL9hsjI2vsF0e/VCRtOKIx8/vOqVsTgWYn1QGoDVy0IgRw9DHqs8DE81D5DSmg5fOAIuhg/EVxvqEasQ2vCvv3Sdm/O9zzBBry3cOyuu9fMd6DcthNFTZa8/ZLi37ddObGxe3Hd+nS1r77MSUFes+tbocBo0WHFYcOGoDk+lpFVknadDEG/SZuivN7AGSmtNU2asjOQ23CknAmtY9iDtxg8TEA6dBM3Vrk71w10ZTUpq1wR68crZ1nBm90CMj9wr6Iia+Z1r7T/EUp9VfarDxgQAIosvnVYZvBIUnG+QhiXK2pD0BPN5FRRF6NxQIYt2KyChW03D4M3PhvLDfic7GaMjAI0E41D213ZrynQNyuq4+WAqt21Ui76C/Y3LaGbsVh+6Z0fGbwzuMbTv9c/OXGOw4FB4lI6NfhSSiBO0tsLFp+EobMJ03bW4Ew1S56uP0MURI6IaD9lP2Pe8lFR1+b8yUOSPeUKliwelMT845ffJwQWb+4gM7MxMz9HozmDNamzP2Vl0Al6dTWqepD43r0677upKvtBw5Hhu1jcmagCxRDKKFMDMJalN7Iuoxf8KB88evbhmfZ9HTb1XUXZm3ftHKiQtGwV6BiQl7axh1LJuY5bCewZVxYgDPxoIkqTAv+lym+DRfwOv3OVLiEh2BkERxprjEUN3J6oBgUatW0L3GfTxJWnmMrCoSEGhy0Vd/afUARpcY8jvbFO1DD7GdW2UcOHPkKg+G/enUoWd7PTCPgjWHtl9g7ZhPIyPUA1ygQaDJZhYk2o4HPyEcIK8XPHjeQ98KYj0TCTpBqsBvKCmo5TSbPaUJaTkoVEhErBGoKQdGzVLivoChbUTI5mAhwBLcBJbbcHTXmmenYXP9b5jwmxVM2aTX4Fp5lCTgnTBwlNJuBH/pF7xeaEA4RGcNjUjonhkdSCJqAs0IDXab25mb3ZVsEBUX9aiavzY918qjJAHf6wNI1WwE4cdXbmMYlV8IVei7yFK6MOsOCAebharOMHHtJ5+PegM8DYrkTyMczGyXl25Kaqpz6D7+chleq4ws/fczwSFd7pblxOxt2nYELBlN4NSrd2zo2bZjUquMZqb6E3DWbRj3D6XdCOf+D1l1rAjiknPUE527y0LCY3K/YaReNAE5a/Ujls6omvkN4CEo2lS3Bd49tN+QvNaZUcagfFf2hhwVrTTcsPJgfre+shwR4dF/KISau0al+faX9VZX3fIJ8wBT059A0B8ba1r73MzGXRJZHoBt2+txBtMGm7T1rOejR8fIPQhlOzx17whyymoCfhNnTps67Jm77p/+xKtQX317VvHzGk7dMPcHbEZv19otr2gZsIWYYQfDsekZfTI7y10IhccXGJWY4KMuq6ToMGybd4ZPe7ho5cvzSREPkcJ4E4giujI/Pdf34U/4Fu0Rx4FiyloWoHXZZRIEGtYUvSN3yVB44MF66rCXyGGimXfUl+zVOTOeHlVwn2/Jvs6tM6HeSiIJJ2sB/Ao9i6dXP7/8+TkHpyyOyOShkAPlPLyIObGshjK12YWbKNAxN/++9vmRXgXNbjuGtwZ5kQqemaPh57VaPT+/BAc8Zb0wbdPyr/dvIVPiDYoUaolcWAA6tc9/vfDxorsfxna0GfC3c/uUOOuWRfXmF45jnhTB4/B/VoYXUllHRjMeLr/X+CLeb+NJBosG7t6Guk/GTp+AER0BHwwcs1bWu51qToVH87R4iywn4YDOxekjFCRnhVD6QqXXP/Sk4agTDSyBo3bda/8e0qW3ot+IZjwQ2yvKC2eNIfd9+U7VBFTzOHWxCUuffG1kwQBF+Adwn4WDc8tO7JlZY/6xhgE0MZYcV/2rg8bNH/S8ohOFljwQXx4oHf3Ja+QEf+3NANMdXsRZ1ZD8wuH5/ftmdcEaq3QhJC/YTl4+v3vX0c0/Xaz+1hXrDqqApSJBiCTsTxYOWzX6bVm3Ba7DA7HxWNmguePBmIBbRhFFA+MUSwGGBT54fMSLJDpBCGEAkgsRrSERhnJ0jLwQ9JSj9qXHxhXjVrgBrs8Dcb7emomXFJwPr/ORcLs+yOfyCKgTUWuhi1y9rtWvfDAyv78iuR5uyEPGsGUz1+1YDzHGZnecWwEOi8cJtyMr647DbyzU4+b6Q9yEB+K07dLQZTOPnzxADENcQN/EPPigFX0egyUVo+HRTuRWdlPcnIeMSrt1WsmKL8o2ReKUI3FDnsi/hHAAXDqGMN6skAHDFt7xl+kPjO7bLk/5+BZwqzyaUGmv+bnicPmV8ydqLh63Vjp9XjwJt7ekdG6FB4W0v2R27paapajeOgD+D8P+G91CITGDAAAAAElFTkSuQmCC",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 173,
    "code": "090159",
    "name": "Credit Afrique MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 317,
    "code": "090429",
    "name": "CROSS RIVER MFB",
    "logo": "",
    "created": "2021-07-24 13:20:59"
  },
  {
    "id": 291,
    "code": "090414",
    "name": "CRUTECH MFB",
    "logo": "",
    "created": "2021-05-04 15:20:59"
  },
  {
    "id": 360,
    "code": "050017",
    "name": "CS ADVANCE FINANCE",
    "logo": "",
    "created": "2023-05-16 11:50:38"
  },
  {
    "id": 181,
    "code": "090167",
    "name": "Daylight Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 325,
    "code": "090470",
    "name": "DOT MICROFINANCE BANK LIMITED",
    "logo": "",
    "created": "2021-07-26 09:20:59"
  },
  {
    "id": 170,
    "code": "090156",
    "name": "e-BARCs MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 251,
    "code": "100021",
    "name": "Eartholeum",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 84,
    "code": "000010",
    "name": "ECOBANK",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 238,
    "code": "100008",
    "name": "Ecobank Xpress Account",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 122,
    "code": "090097",
    "name": "Ekondo MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 222,
    "code": "090273",
    "name": "Emeralds MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 128,
    "code": "090114",
    "name": "EmpireTrust Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 329,
    "code": "090539",
    "name": "ENRICH MFB",
    "logo": "",
    "created": "2022-08-25 13:03:59"
  },
  {
    "id": 93,
    "code": "000019",
    "name": "Enterprise Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 196,
    "code": "090189",
    "name": "Esan MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 180,
    "code": "090166",
    "name": "Eso-E Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 236,
    "code": "100006",
    "name": "eTranzact",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 356,
    "code": "090541",
    "name": "EXCELLENT MFB",
    "logo": "",
    "created": "2023-04-26 14:41:59"
  },
  {
    "id": 327,
    "code": "090328",
    "name": "Eyowo",
    "logo": "",
    "created": "2021-11-09 17:37:59"
  },
  {
    "id": 338,
    "code": "090551",
    "name": "FAIRMONEY MFB",
    "logo": "",
    "created": "2022-11-21 12:01:59"
  },
  {
    "id": 306,
    "code": "090330",
    "name": "Fame MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 193,
    "code": "090179",
    "name": "FAST MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 123,
    "code": "090107",
    "name": "FBN Morgages Limited",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 244,
    "code": "100014",
    "name": "FBNMobile",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 101,
    "code": "060002",
    "name": "FBNQuest MERCHANT BANK",
    "logo":
        "data:image/jpeg;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 77,
    "code": "000003",
    "name": "FCMB",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 260,
    "code": "100031",
    "name": "FCMB Easy Account",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 231,
    "code": "100001",
    "name": "FET",
    "logo":
        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAEGfaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjUtYzAyMSA3OS4xNTQ5MTEsIDIwMTMvMTAvMjktMTE6NDc6MTYgICAgICAgICI+CiAgIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CiAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICAgICAgICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgICAgICAgICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICAgICAgICAgICB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgICAgICAgICB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIgogICAgICAgICAgICB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmV4aWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIj4KICAgICAgICAgPHhtcDpDcmVhdG9yVG9vbD5BZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4bXA6Q3JlYXRlRGF0ZT4yMDE0LTAzLTIwVDE2OjU3OjQyKzAxOjAwPC94bXA6Q3JlYXRlRGF0ZT4KICAgICAgICAgPHhtcDpNb2RpZnlEYXRlPjIwMTQtMDYtMDNUMTQ6MDc6MTIrMDE6MDA8L3htcDpNb2RpZnlEYXRlPgogICAgICAgICA8eG1wOk1ldGFkYXRhRGF0ZT4yMDE0LTA2LTAzVDE0OjA3OjEyKzAxOjAwPC94bXA6TWV0YWRhdGFEYXRlPgogICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3BuZzwvZGM6Zm9ybWF0PgogICAgICAgICA8cGhvdG9zaG9wOkNvbG9yTW9kZT4zPC9waG90b3Nob3A6Q29sb3JNb2RlPgogICAgICAgICA8cGhvdG9zaG9wOkRvY3VtZW50QW5jZXN0b3JzPgogICAgICAgICAgICA8cmRmOkJhZz4KICAgICAgICAgICAgICAgPHJkZjpsaT5FMjM4NTdGQzQ2ODZGMDg0NDFBOUQ2RjUzOTkyRUYzRDwvcmRmOmxpPgogICAgICAgICAgICA8L3JkZjpCYWc+CiAgICAgICAgIDwvcGhvdG9zaG9wOkRvY3VtZW50QW5jZXN0b3JzPgogICAgICAgICA8eG1wTU06SW5zdGFuY2VJRD54bXAuaWlkOjNlZmM3N2RkLWQxNTEtMzI0Mi04ZTkwLTk2NTU5NmRkMjViZTwveG1wTU06SW5zdGFuY2VJRD4KICAgICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+eG1wLmRpZDo1NzBlMmQ5Ni01NDQ5LTMyNGItYmUwYi01MGM3ZmE1YjM1MDk8L3htcE1NOkRvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ+eG1wLmRpZDo1NzBlMmQ5Ni01NDQ5LTMyNGItYmUwYi01MGM3ZmE1YjM1MDk8L3htcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOkhpc3Rvcnk+CiAgICAgICAgICAgIDxyZGY6U2VxPgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmFjdGlvbj5jcmVhdGVkPC9zdEV2dDphY3Rpb24+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDppbnN0YW5jZUlEPnhtcC5paWQ6NTcwZTJkOTYtNTQ0OS0zMjRiLWJlMGItNTBjN2ZhNWIzNTA5PC9zdEV2dDppbnN0YW5jZUlEPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6d2hlbj4yMDE0LTAzLTIwVDE2OjU3OjQyKzAxOjAwPC9zdEV2dDp3aGVuPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6c29mdHdhcmVBZ2VudD5BZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDo3OWExZmI5NS0xOTk0LTAxNDgtOGYxZi02NWNhYjEwMmM3OWI8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTQtMDYtMDNUMTM6MzM6MjIrMDE6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cyk8L3N0RXZ0OnNvZnR3YXJlQWdlbnQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpjaGFuZ2VkPi88L3N0RXZ0OmNoYW5nZWQ+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmFjdGlvbj5zYXZlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6aW5zdGFuY2VJRD54bXAuaWlkOjA3ODE2M2M5LTRiMmYtNjU0Zi04ZjI0LWM4NWIyYmIzNDQxNDwvc3RFdnQ6aW5zdGFuY2VJRD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OndoZW4+MjAxNC0wNi0wM1QxNDowNzoxMiswMTowMDwvc3RFdnQ6d2hlbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OnNvZnR3YXJlQWdlbnQ+QWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKTwvc3RFdnQ6c29mdHdhcmVBZ2VudD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmNoYW5nZWQ+Lzwvc3RFdnQ6Y2hhbmdlZD4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPmNvbnZlcnRlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6cGFyYW1ldGVycz5mcm9tIGFwcGxpY2F0aW9uL3ZuZC5hZG9iZS5waG90b3Nob3AgdG8gaW1hZ2UvcG5nPC9zdEV2dDpwYXJhbWV0ZXJzPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+ZGVyaXZlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6cGFyYW1ldGVycz5jb252ZXJ0ZWQgZnJvbSBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIHRvIGltYWdlL3BuZzwvc3RFdnQ6cGFyYW1ldGVycz4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPnNhdmVkPC9zdEV2dDphY3Rpb24+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDppbnN0YW5jZUlEPnhtcC5paWQ6M2VmYzc3ZGQtZDE1MS0zMjQyLThlOTAtOTY1NTk2ZGQyNWJlPC9zdEV2dDppbnN0YW5jZUlEPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6d2hlbj4yMDE0LTA2LTAzVDE0OjA3OjEyKzAxOjAwPC9zdEV2dDp3aGVuPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6c29mdHdhcmVBZ2VudD5BZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICAgICA8c3RFdnQ6Y2hhbmdlZD4vPC9zdEV2dDpjaGFuZ2VkPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgPC9yZGY6U2VxPgogICAgICAgICA8L3htcE1NOkhpc3Rvcnk+CiAgICAgICAgIDx4bXBNTTpEZXJpdmVkRnJvbSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgIDxzdFJlZjppbnN0YW5jZUlEPnhtcC5paWQ6MDc4MTYzYzktNGIyZi02NTRmLThmMjQtYzg1YjJiYjM0NDE0PC9zdFJlZjppbnN0YW5jZUlEPgogICAgICAgICAgICA8c3RSZWY6ZG9jdW1lbnRJRD54bXAuZGlkOjU3MGUyZDk2LTU0NDktMzI0Yi1iZTBiLTUwYzdmYTViMzUwOTwvc3RSZWY6ZG9jdW1lbnRJRD4KICAgICAgICAgICAgPHN0UmVmOm9yaWdpbmFsRG9jdW1lbnRJRD54bXAuZGlkOjU3MGUyZDk2LTU0NDktMzI0Yi1iZTBiLTUwYzdmYTViMzUwOTwvc3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPgogICAgICAgICA8L3htcE1NOkRlcml2ZWRGcm9tPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpYUmVzb2x1dGlvbj43MjAwMDAvMTAwMDA8L3RpZmY6WFJlc29sdXRpb24+CiAgICAgICAgIDx0aWZmOllSZXNvbHV0aW9uPjcyMDAwMC8xMDAwMDwvdGlmZjpZUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6UmVzb2x1dGlvblVuaXQ+MjwvdGlmZjpSZXNvbHV0aW9uVW5pdD4KICAgICAgICAgPGV4aWY6Q29sb3JTcGFjZT42NTUzNTwvZXhpZjpDb2xvclNwYWNlPgogICAgICAgICA8ZXhpZjpQaXhlbFhEaW1lbnNpb24+NTEyPC9leGlmOlBpeGVsWERpbWVuc2lvbj4KICAgICAgICAgPGV4aWY6UGl4ZWxZRGltZW5zaW9uPjUxMjwvZXhpZjpQaXhlbFlEaW1lbnNpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo8P3hwYWNrZXQgZW5kPSJ3Ij8+rRxTNwAAB9NJREFUaEPlmAtwVOUVx/933+9NNg+ymwchQhJIYtJkA+YFQlBrjKTgI0LFKVNLsWNxHC1TS5FRh6LWsUKrzjiAOoyd6dgZq9PqlAhFJRZhVGqZJiK2EJJAErLJkn3ex96eb/dmYs1usklsHOMvs3tz73fu3f89+//Od+5yMoEZMHzuJFLyq5W92UGlbKeF79g+wNOl7M0eMxL9dTFte4j0Ov99DvmvyFDHDs0a0870wJ4mqJ22WRfMmJZo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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 167,
    "code": "090153",
    "name": "FFS Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 81,
    "code": "000007",
    "name": "Fidelity Bank",
    "logo":
        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAIAAAC1eHXNAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAVLSURBVFhHvZh5TBxVHMd3ZpfdpS2F5aoVS0LbEG0rqDShrbYUa9KIEk1KAWtbKGJrwRiR2mAlHgkam9ADYhtbSyBVo3+oiVFMjFKuchRqC1q0AUItx0IXKOwcezAzjL+Z9/Yox8Kyx2c3M+/7dnf2t7/rvVkiMeXziUkTSRCiQqEQ5QecpYN0sp3thzmlbWj7OD4hiack0DsFYRqO9259IM9hiKj4kvEJEwGG4Bl3cPqMbbjwZVjWmpWxuao8HWsZkiBJpZJUKaWj20/4rO1pA67n6in9XKO5qmwv+vq89my9aVCyA3nUbzCsNTc/SSF7n+ao9vGW19tehTGJAu0fpuG7KMuXp9KQLP23JEwTwfA0WEP60xssZXmv+Hk85pjfhqs1pCZQGdg02gBx8RNSmYjipyewHSVdxTq1DvJFSaiGzYOk38JiGmcvf7EPjQ2WkTrD72pSg6QgCn7yx9QUH7U2/EDaU0ie6HxHpw6Ti0cqdHCFP+oF2pd1hGquzkfyxv2221SXmlQjCYAp/ogLQ1ty8pOio0KQLP7rmE4disZ2fB4XHtKTJCvO4MZV2XfBKliUhBJJO761AyJi1htbbBGxCJaLveUrVEFIOuPbuDC0NfPQ1i0J0UjmtWfZ03MGPsxTjhfUWtW3tlr9Vf9TL93tnJ7O+CouEBGL3tjbchxJ6BCf3ILGNTM97fgqLoyBLi1LX2OrkZzWzGC5eyI5G1jnFrNncA+asW7bGVt4dAeSX925dJftmy8iCNLrRkxxgkatavo5D8lBU/+57tPBAdgx80FKezTvMT0tWg20ocux5zvUmh6hXeUiIghp/+Etj0BusgP3G+sKVgbhBexI235oWbO71mxIeX/sHZhh4+lzmc8kxiB5vvtMN3VbqwxE0gWigvBa3dJjTM6R7QWHtyN5dbQe0nNlQDCSLkB14p39GD1peva5R+2LyLB56NiNo5HahxZMC4R37KApS1z8IzXfH0aSF/nMptTF5KYDAvUPD6AZy/p14Z01b2OtUKTWJcNKtpjcdMaj/AAjYqJDe2zNG9jbKG0/A8gAJBfP0u2AcKyPCe9rK8JaoTjYsofiKY0SF607SPWylMBAYsZtetjZE6+1Zo6Y9XATgLU7LDFPoUSTk2I7rzhyIvfaK/2mu8tUy7F2H/fiAh2T1huzs7de+QFXB5DVktbP/rfcAyMAN+yAtYPpnyg9tafyLO4TQMbVFyAcnnhCBvJjcYHhOIHVT9bWFdhXc+DFuiSKMwaqlmHtAYvyB9ykwyZvfPjkzqfXoZkx62jyH5vhJ2iUWjTjCVKe4uE8SAkxxsRtWM0PfRaqw7/75sT11PrkFQFBS+gT8+HKDrgzhoR4v2h3h1O7/PpOxRttByM1q9ztmC4hiLDHPrJa+dlrAcNOiVN8R0Nh/MbVeEqhePfmm9fGmmC768basRDcNLcpOH4Of0Bd0CPUloQ14nip3QizYHq5flfnxJ+hmrlvQDwBrif9P+e8ZTdbOHbEWFVxoPkXfBMGNBpqd9UkciLvcX3OCxkdpUN/JEpuuEfFrg0XmLKsjAT0MvDh38eLOt6K0ER6MStnQZAv7d5gMXNQmewoXXlpf1dDIUlitw+ZBlJqdzSPNoZrIr0eC2fg0gRUJkHkpuzbVv1NDp6WOd9z9nLfxQhtpJJQ4SnfAHkaF/KEZMek0RwS7FgnwQ1517MZjobtjE/dgJDteFKyA0/InPzn4x8HvoNAeLU9zMDxjTDiwQ5dwgN2XOgprzfUCCK0E5Qj2BkPjqWHPEA4zdsHjtdmvipj97J0hv3sxpWP/w92rkLg7iZsVgAAAABJRU5ErkJggg==",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 249,
    "code": "100019",
    "name": "Fidelity Mobile",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 140,
    "code": "090126",
    "name": "FidFund MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 126,
    "code": "090111",
    "name": "FinaTrust Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 90,
    "code": "000016",
    "name": "First Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 113,
    "code": "070014",
    "name": "First Generation Mortgage Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 177,
    "code": "090163",
    "name": "First Multiple MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 178,
    "code": "090164",
    "name": "First Royal Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 349,
    "code": "090614",
    "name": "FLOURISH MFB",
    "logo": "",
    "created": "2023-03-21 12:43:59"
  },
  {
    "id": 104,
    "code": "070002",
    "name": "Fortis Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 246,
    "code": "100016",
    "name": "FortisMobile",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 268,
    "code": "400001",
    "name": "FSDH",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 159,
    "code": "090145",
    "name": "Full range MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 301,
    "code": "090438",
    "name": "FUTMINNA MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 172,
    "code": "090158",
    "name": "FUTO MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 182,
    "code": "090168",
    "name": "Gashua Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 108,
    "code": "070009",
    "name": "GATEWAY MORTGAGE BANK",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 275,
    "code": "090411",
    "name": "GIGINYA MFB",
    "logo": "",
    "created": "2021-01-29 15:20:59"
  },
  {
    "id": 315,
    "code": "090441",
    "name": "GIWA MICROFINANCE BANK",
    "logo": "",
    "created": "2021-07-09 15:20:59"
  },
  {
    "id": 308,
    "code": "000027",
    "name": "GLOBUS Bank",
    "logo": "",
    "created": "2021-06-01 18:20:59"
  },
  {
    "id": 226,
    "code": "090278",
    "name": "Glory MFB ",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 252,
    "code": "100022",
    "name": "GoMoney",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 335,
    "code": "090495",
    "name": "GOODNEWS MFB",
    "logo": "",
    "created": "2022-10-14 14:59:59"
  },
  {
    "id": 136,
    "code": "090122",
    "name": "GOWANS MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 192,
    "code": "090178",
    "name": "GreenBank MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 218,
    "code": "090269",
    "name": "Greenville Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 293,
    "code": "060004",
    "name": "GREENWICH Merchant Bank",
    "logo": "",
    "created": "2021-06-01 18:20:59"
  },
  {
    "id": 201,
    "code": "090195",
    "name": "Grooming Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 87,
    "code": "000013",
    "name": "GTBank",
    "logo":
        "data:image/jpeg;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 239,
    "code": "100009",
    "name": "GTMobile",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 161,
    "code": "090147",
    "name": "Hackman Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 116,
    "code": "070017",
    "name": "Haggai Mortgage Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 135,
    "code": "090121",
    "name": "HASAL MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 247,
    "code": "100017",
    "name": "Hedonmark",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 94,
    "code": "000020",
    "name": "Heritage",
    "logo":
        "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4QAiRXhpZgAATU0AKgAAAAgAAQESAAMAAAABAAEAAAAAAAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAgMDAwYDAwYMCAcIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCAAtAC0DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9/KKy/GvjPTfh34S1HXdZulsdJ0m3e6u7hlZhDGgyzYUFjgdgCTXP+NP2g/Cfw/vZ7fVNRuIri10sa3PHDp9zcNBZb9n2hxHG21AwOScbQCTgAmsqlenD45Jert/Wz+4xqYilT/iSS9Wl/Wz+47SisVfiHor21hMmoQywapAlzayx5eOaJyoRwwBG071IOemT0BIlk8b6TDqf2OTULWO4KCRVdwquOc7WPysQBkgElQykgBlzXtId0V7WHdGrRVe31W2upvLjuIZJMuNqyBm+QhX4z/CSAfQkA1Yq73NL32PJf24kjuP2aNetZH2/2jNZ6cqFWaOZri7htxHIqsrGNvNwxQh1XLJh1U14J8S/EvxGuvEHxQ17XLP4c6RJ4V8GLZ+LhFNqV5NFpO27uCbRYkUea6eewGWYbYwVHAP17418BaT8RNMt7PWLX7Za2t7b6hHH5rxgTQSrLEx2kZ2uqnacqcYII4rm/F37NPg3x1qmsXeqaXcXMniKSCTVIxqV1HBqPkoEjSaJJBHJGqjGxlKHJJBJJPi4/Latat7SD0sla9r2UvJ9Wtul/I8HMcrrV63tKbSVkrXteyn5PrJfLm8jzNbH4f8AifwN8NbfUre60o6r4RR9LkhuIJTololg2/bK6iTmOXBdEKsYYg4AIV9TT/gz8O/Gmo3Ph/SNevPtFvZvaT/YLm3Zmj+1PJJGW8sncrYR8YwhRSfm59K8cfBTw38RmX+17Ga4RIBbCOO8ngi2Ddj5I3VcgO4DYyFdgCAxBm8O/CXw/wCFPEr6xp9h9n1CSD7M0onlbMfyfLtZiv8AyzTnGePc51+oy9o7xjy/O9rWtt/Wxssvlz+9GLjp3Ttaz6eX6dDl/g7+zrb/AA319tcubuS41eSF7Zki2rbLHuXYQNgYyBFClycsCd29vnr0yiivQo0YUo8kFoelQoQox5KasgooorU2CiiigAooooA//9k=",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 287,
    "code": "090418",
    "name": "HIGHLAND MFB",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 189,
    "code": "090175",
    "name": "HighStreet MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 273,
    "code": "120002",
    "name": "Hope PSB",
    "logo": "",
    "created": "2020-10-09 15:20:59"
  },
  {
    "id": 132,
    "code": "090118",
    "name": "IBILE Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 227,
    "code": "090279",
    "name": "Ikire MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 294,
    "code": "090350",
    "name": "ILORIN MFB",
    "logo": "",
    "created": "2021-06-01 18:20:59"
  },
  {
    "id": 207,
    "code": "090258",
    "name": "Imo Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 254,
    "code": "100024",
    "name": "Imperial Homes Mortgage Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 171,
    "code": "090157",
    "name": "Infinity MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 115,
    "code": "070016",
    "name": "Infinity trust  Mortgage Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 259,
    "code": "100029",
    "name": "Innovectives Kesh",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 302,
    "code": "090434",
    "name": "Insight MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 257,
    "code": "100027",
    "name": "Intellifin",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 163,
    "code": "090149",
    "name": "IRL Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 348,
    "code": "090620",
    "name": "IYIN EKITI MFB",
    "logo": "",
    "created": "2023-03-21 12:43:59"
  },
  {
    "id": 285,
    "code": "090421",
    "name": "Izon Microfinance Bank",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 80,
    "code": "000006",
    "name": "JAIZ Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 118,
    "code": "090003",
    "name": "JubileeLife",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 198,
    "code": "090191",
    "name": "KCMB MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 245,
    "code": "100015",
    "name": "Kegow",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 76,
    "code": "000002",
    "name": "Keystone Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 270,
    "code": "090380",
    "name": "KREDI MONEY MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 216,
    "code": "090267",
    "name": "Kuda Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 312,
    "code": "090450",
    "name": "KWASU MFB",
    "logo": "",
    "created": "2021-07-06 06:20:59"
  },
  {
    "id": 282,
    "code": "090422",
    "name": "LANDGOLD MFB",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 191,
    "code": "090177",
    "name": "Lapo MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 220,
    "code": "090271",
    "name": "Lavender Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 111,
    "code": "070012",
    "name": "LBIC Mortgage Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 361,
    "code": "090372",
    "name": "LEGEND MFB",
    "logo": "",
    "created": "2023-06-15 22:46:38"
  },
  {
    "id": 284,
    "code": "090420",
    "name": "LETSHEGO MFB",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 333,
    "code": "090557",
    "name": "LIFEGATE MFB",
    "logo": "",
    "created": "2022-09-27 18:20:59"
  },
  {
    "id": 296,
    "code": "090435",
    "name": "LINKS MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 316,
    "code": "000029",
    "name": "LOTUS BANK",
    "logo": "",
    "created": "2021-07-09 15:20:59"
  },
  {
    "id": 214,
    "code": "090265",
    "name": "Lovonus Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 347,
    "code": "090623",
    "name": "MAB ALLIANZ MFB",
    "logo": "",
    "created": "2023-03-21 12:42:59"
  },
  {
    "id": 185,
    "code": "090171",
    "name": "Mainstreet MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 188,
    "code": "090174",
    "name": "Malachy MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 299,
    "code": "090423",
    "name": "MAUTECH MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 228,
    "code": "090280",
    "name": "Megapraise Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 297,
    "code": "090432",
    "name": "Memphis MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 224,
    "code": "090275",
    "name": "Meridian MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 150,
    "code": "090136",
    "name": "Microcred Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 229,
    "code": "090281",
    "name": "MINT-FINEX MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 241,
    "code": "100011",
    "name": "Mkudi",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 250,
    "code": "100020",
    "name": "MoneyBox",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 143,
    "code": "090129",
    "name": "MONEYTRUST MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 332,
    "code": "090405",
    "name": "Moniepoint MFB",
    "logo": "",
    "created": "2022-09-22 19:25:59"
  },
  {
    "id": 364,
    "code": "090392",
    "name": "MOZFIN MFB",
    "logo": "",
    "created": "2023-07-03 11:56:43"
  },
  {
    "id": 197,
    "code": "090190",
    "name": "Mutual Benefits MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 165,
    "code": "090151",
    "name": "Mutual Trust Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 166,
    "code": "090152",
    "name": "Nargata MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 212,
    "code": "090263",
    "name": "Navy Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 142,
    "code": "090128",
    "name": "Ndiorah MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 124,
    "code": "090108",
    "name": "New Prudential Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 205,
    "code": "090205",
    "name": "Newdawn Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 318,
    "code": "090459",
    "name": "NICE MFB",
    "logo": "",
    "created": "2021-07-24 13:20:59"
  },
  {
    "id": 200,
    "code": "090194",
    "name": "NIRSAL National microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 102,
    "code": "060003",
    "name": "NOVA MB",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 103,
    "code": "070001",
    "name": "NPF MicroFinance Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 304,
    "code": "090437",
    "name": "OakLand MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 133,
    "code": "090119",
    "name": "OHAFIA MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 175,
    "code": "090161",
    "name": "Okpoga MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 221,
    "code": "090272",
    "name": "Olabisi Onabanjo university Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 106,
    "code": "070007",
    "name": "Omoluabi Mortgage Bank Plc",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 344,
    "code": "000036",
    "name": "Optimus Bank",
    "logo": "",
    "created": "2023-03-01 17:22:05"
  },
  {
    "id": 320,
    "code": "090460",
    "name": "ORITABASORUN MFB",
    "logo": "",
    "created": "2021-07-24 13:20:59"
  },
  {
    "id": 311,
    "code": "090456",
    "name": "OSPOLY MFB",
    "logo": "",
    "created": "2021-06-28 06:20:59"
  },
  {
    "id": 232,
    "code": "100002",
    "name": "Paga",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 107,
    "code": "070008",
    "name": "PAGE FINANCIALS",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 280,
    "code": "100033",
    "name": "PalmPay",
    "logo": "",
    "created": "2021-01-29 15:20:59"
  },
  {
    "id": 119,
    "code": "000030",
    "name": "Parallex",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 313,
    "code": "090390",
    "name": "PARKWAY MFB",
    "logo": "",
    "created": "2021-07-06 06:20:59"
  },
  {
    "id": 233,
    "code": "100003",
    "name": "Parkway-ReadyCash",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 262,
    "code": "110001",
    "name": "PayAttitude Online",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 234,
    "code": "100004",
    "name": "Paycom (Opay)",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 283,
    "code": "090402",
    "name": "PEACE MFB",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 151,
    "code": "090137",
    "name": "Pecan Trust Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 202,
    "code": "090196",
    "name": "Pennywise Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 149,
    "code": "090135",
    "name": "Personal Trust Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 179,
    "code": "090165",
    "name": "Petra Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 112,
    "code": "070013",
    "name": "PLATINUM MORTGAGE BANK",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 82,
    "code": "000008",
    "name": "POLARIS BANK",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 337,
    "code": "000031",
    "name": "Premium Trust Bank",
    "logo": "",
    "created": "2022-10-31 21:06:59"
  },
  {
    "id": 223,
    "code": "090274",
    "name": "Prestige Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 97,
    "code": "000023",
    "name": "Providus Bank ",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 355,
    "code": "090303",
    "name": "PURPLEMONEY MFB",
    "logo": "",
    "created": "2023-04-20 18:55:59"
  },
  {
    "id": 210,
    "code": "090261",
    "name": "QuickFund Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 184,
    "code": "090170",
    "name": "Rahama MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 98,
    "code": "000024",
    "name": "Rand Merchant Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 110,
    "code": "070011",
    "name": "Refuge Mortgage Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 139,
    "code": "090125",
    "name": "REGENT MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 350,
    "code": "090463",
    "name": "REHOBOTH MFB",
    "logo": "",
    "created": "2023-03-29 13:50:59"
  },
  {
    "id": 187,
    "code": "090173",
    "name": "Reliance MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 204,
    "code": "090198",
    "name": "Renmoney microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 146,
    "code": "090132",
    "name": "RICHWAY MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 298,
    "code": "090433",
    "name": "RIGO MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 330,
    "code": "090547",
    "name": "ROCKSHIELD MFB",
    "logo": "",
    "created": "2022-09-06 19:00:59"
  },
  {
    "id": 290,
    "code": "090405",
    "name": "Rolez Microfinance Bank",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 152,
    "code": "090138",
    "name": "Royal Exchange Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 279,
    "code": "090175",
    "name": "Rubies MFB",
    "logo": "",
    "created": "2021-01-29 15:20:59"
  },
  {
    "id": 326,
    "code": "090286",
    "name": "Safe Haven MFB",
    "logo": "",
    "created": "2021-11-09 17:37:59"
  },
  {
    "id": 321,
    "code": "090485",
    "name": "SAFEGATE MFB",
    "logo": "",
    "created": "2021-07-24 13:20:59"
  },
  {
    "id": 121,
    "code": "090006",
    "name": "SafeTrust",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 154,
    "code": "090140",
    "name": "Sagamu Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 127,
    "code": "090112",
    "name": "Seed Capital Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 341,
    "code": "000034",
    "name": "SIGNATURE BANK",
    "logo": "",
    "created": "2023-02-16 20:12:59"
  },
  {
    "id": 328,
    "code": "120004",
    "name": "SmartCash PSB",
    "logo":
        "data:image/jpeg;base64,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",
    "created": "2022-05-25 12:37:59"
  },
  {
    "id": 269,
    "code": "090325",
    "name": "Sparkle",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 305,
    "code": "090436",
    "name": "Spectrum MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 237,
    "code": "100007",
    "name": "Stanbic IBTC @ease Wallet",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 86,
    "code": "000012",
    "name": "StanbicIBTC Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 95,
    "code": "000021",
    "name": "StandardChartered",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 176,
    "code": "090162",
    "name": "Stanford MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 300,
    "code": "070022",
    "name": "STB Mortgage Bank",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 211,
    "code": "090262",
    "name": "Stellas Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 75,
    "code": "000001",
    "name": "Sterling Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 310,
    "code": "090340",
    "name": "STOCKCORP MFB",
    "logo": "",
    "created": "2021-06-21 18:20:59"
  },
  {
    "id": 295,
    "code": "090302",
    "name": "SUNBEAM MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 96,
    "code": "000022",
    "name": "SUNTRUST BANK",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 323,
    "code": "090446",
    "name": "SUPPORT MFB",
    "logo": "",
    "created": "2021-07-24 13:20:59"
  },
  {
    "id": 253,
    "code": "100023",
    "name": "TagPay",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 99,
    "code": "000026",
    "name": "Taj Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 336,
    "code": "090560",
    "name": "TANADI MFB",
    "logo": "",
    "created": "2022-10-19 15:53:59"
  },
  {
    "id": 288,
    "code": "090426",
    "name": "TANGERINE MONEY",
    "logo": "",
    "created": "2021-03-12 15:20:59"
  },
  {
    "id": 129,
    "code": "090115",
    "name": "TCF",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 240,
    "code": "100010",
    "name": "TeasyMobile",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 363,
    "code": "090283",
    "name": "THRIVE MFB",
    "logo": "",
    "created": "2023-06-21 09:41:31"
  },
  {
    "id": 274,
    "code": "000025",
    "name": "Titan Trust Bank",
    "logo": "",
    "created": "2020-10-09 15:20:59"
  },
  {
    "id": 334,
    "code": "100039",
    "name": "TITAN-PAYSTACK MFB",
    "logo": "",
    "created": "2022-09-27 19:30:59"
  },
  {
    "id": 160,
    "code": "090146",
    "name": "Trident Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 120,
    "code": "090005",
    "name": "Trustbond",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 78,
    "code": "000004",
    "name": "UBA",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 319,
    "code": "090461",
    "name": "UNIBADAN MFB",
    "logo": "",
    "created": "2021-07-24 13:20:59"
  },
  {
    "id": 215,
    "code": "090266",
    "name": "Uniben Microfinance bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 199,
    "code": "090193",
    "name": "Unical MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 307,
    "code": "090341",
    "name": "UNIILORIN MFB",
    "logo": "",
    "created": "2021-06-01 14:20:59"
  },
  {
    "id": 92,
    "code": "000018",
    "name": "Union Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 85,
    "code": "000011",
    "name": "Unity Bank",
    "logo":
        "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAgMDAwYDAwYMCAcIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCAAtAC0DASIAAhEBAxEB/8QAHAAAAgIDAQEAAAAAAAAAAAAABQgABwIGCQEE/8QANhAAAQMDAwMCBAQDCQAAAAAAAgEDBAUGEQcIEgAJExQhFSIxQRYXI1EKM2EkMjpieIGEsrb/xAAXAQEBAQEAAAAAAAAAAAAAAAAEAwAF/8QALREAAQMDAQYEBwEAAAAAAAAAAQIDEQAhMQQFEhNBUaFhgbHhFCIycZHC0fD/2gAMAwEAAhEDEQA/AO/nU6r+4deo9tbn7V01kQ/7Rd9t1a4IMxHkwnw6TT2XmCDH94kqLRiqKvs25lEwirp+tO4W7ra1jkWPaNAh1qsTKSxOgK7kQYVXHkedeJTEfGIgCInyqpOImV9hUO0doNaJsOvzBMCASSTMAAXkxA8ag9qENCVdYte/SjG+PcRcG1Ha3dF/2vp/WNUq7b6RVi2xSldSXVPLLZYPgrTD7n6YOk6vFovlaXOEySWEl+UP8cfhf4zSvxIkH4p8J9W3670nk8XqPDnn4vInDyY48vbOfbpQ92fccvPbt21tT9U4tBoP5iaZ1CLTJVMqDbpQHHXahFjESi26h48cgscXMc28oqjhFVjcbqtuhtTv5XNM010ttG5roi6Zs0qkw509lpqZafxYXSqRkU1pEkJOV1ngpCXEEXwqmDVuzXG9dpk6ln6VAkE2NosQcEHPn0qPxiSAtMkGLRiZ72iPCuvPU6XHYjvFuDchqpr/AGbdlNo1LrWkN/SKHCbpwuD6mjuALkCQ8jhkqvOAjiko8QXCcRT36+7t6brLg3iWRqHdFVp9Hh0Gl6g1q3bUfp4uj8TpEF0Y7cp1TMsum8D+eKCOBFOKLnNVNKTM8o74pKXUqiOc9s1oev8AcHPvRbdKby4+Cw7wdxn6+Vyme2P+Pn/bpi4VMotJ12myXJTJXJXKO2jEfGXAhxXcGX9EV2UKL9OWB+vFcJp3ea3dW1bdHt93J2/Ztcve39P3Kvbt3U+jsk9MSFUWWhZdEURUEQNtxeRcQVxWQUg8nJMe3RfOse4DuLagaoalWDcth21dGntMG0KdUIbojS6elRloEeQ4oC2k9xRKS61lXGwksCXsIolHdKl1tDio+W4+8keho2+A6UEXme2fUVoveuh+l7eO8lRTi0VStdUT7clnU0i/7IvVuh/iPHf9Nof+nLoF3qdDbqu7t27mqdbdtV65qrd0u3ZtMgUanvVCZMRqZTQdFtlkScIg9O4ZIgrgfmX2yvQHf/qtX9hPdssfXqRp5e9/WJd2mb2nEtLWpyzZdPmBUynNqoqohlxTbERMw5CjxDyJvgodg6dTei4JzvvGPArJH5GKM2nhyVYn9lf2h+sWsKbAe6zuYuj9NuHf2hbeorZOfy5NSoaOwwjii+xGraoWP86fdemb7R2ip7fe2lovbLwPNzhtmPVJwO/zAlzszpAl+6o9IcRV++OlF/iM9tFR1lvzbe/SH34Ll5XS5pfUno64cej1cmCQS+/AAiyCX7IhEv7ddQo0duHHbZZbFppoUAAAeIgKeyIifZE66TyhwUkZOfKwpTKTxlA4GPO5rPHv1ETHU6nQ6ZS+ahbyKjpDF1dmVS3RqMbT2RT5NPSNJcJ6qw5K8HAFtplxwX2iZkqiKJNmiApOtD5CZ91o3kTtOUvoG6GjIWRV6BECR6lHRqjVQliwXNOCelAC5ibpqQttorpKgiWLSuDb3YV2M3G3VLJtOpN3g5HdrwyqSw8laKPx8CyUIV83j4jw5544TGOiVW0utmvN1IZ1vUSaNZRsagj8Fpz1yByUEdyK8+PIscs45Lj6r1TeT0/1vep7qutKPuklfnf3ntuGn7ZeSHpfbdc1Nq8dfcHVdFKXAP8AoTbxvEnv75/b6ut0Bi6WWxC1IlXkzblCZu6dBClyK4EBoak/EA+YxzkcfITSH8yApcUX3xno91lrkADkPes2gpJJ5n2r/9k=",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 137,
    "code": "090123",
    "name": "Verite Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 45,
    "code": "999999",
    "name": "VFD MICROFINANCE BANK",
    "logo": "https://cms.vbank.ng/wp-content/uploads/2020/08/mfb.png",
    "created": "2019-04-16 15:59:06"
  },
  {
    "id": 164,
    "code": "090150",
    "name": "Virtue MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 153,
    "code": "090139",
    "name": "Visa Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 242,
    "code": "100012",
    "name": "VTNetworks",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 354,
    "code": "090590",
    "name": "WAYA MFB",
    "logo": "",
    "created": "2023-04-06 15:38:59"
  },
  {
    "id": 91,
    "code": "000017",
    "name": "Wema Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 134,
    "code": "090120",
    "name": "WETLAND MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 138,
    "code": "090124",
    "name": "XSLNCE Microfinance Bank",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 156,
    "code": "090142",
    "name": "Yes MFB",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 89,
    "code": "000015",
    "name": "Zenith Bank",
    "logo":
        "data:image/png;base64,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",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 248,
    "code": "100018",
    "name": "ZenithMobile",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  },
  {
    "id": 255,
    "code": "100025",
    "name": "Zinternet - KongaPay",
    "logo": "",
    "created": "2019-09-26 18:20:59"
  }
];
RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
RegExp passwordRegex = RegExp(r'^.{8,}$');

RegExp nameRegex = RegExp(r'[a-zA-Z]');
RegExp otpRegex = RegExp(r'^[a-zA-Z0-9]{1,5}$');
RegExp phoneRegex = RegExp(r'^\d{11}$');
RegExp bvnRegex = RegExp(r'^\d{11}$');
RegExp otpRegex2 = RegExp(r'^\d{6}$');
