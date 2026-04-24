class EndPoints {
  static String baseUrl = "https://marketi-api.onrender.com/api/v1/";
  static String login = "auth/signIn";

  static String signUp = "auth/signUp";
  // static  String register = "auth/register";
  // static  String getProducts = "products";
  // static  String getCategories = "categories";
  // static  String getUserProfile = "users/profile";
  // get id /////////////////////////////////////

  // method to get id
  static String getUserDataEndPoind(id) {
    return "https://supermarket-dan1.onrender.com/api/v1/portfoilo/userData/$id";
  }
}

class ApiKeys {
  static String status = "status";
  static String errorMassege = "error";
}
