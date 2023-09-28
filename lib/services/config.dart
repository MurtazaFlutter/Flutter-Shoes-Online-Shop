class Config {
  static const String apiUrl = "192.168.214.205:3005";
  static const String loginUrl = "/api/login/";
  static const String signUpUrl = "/api/signup/";
  static const String getUser = "/api/getUser";
  static const String getCartUrl = "/api/getCart";
  static const String addToCartUrl = "/api/addToCart";
  static const String updateUserUrl = "";
  static const paymentUrl = "/stripe/create-checkout-session";
  static const paymentBaseUrl = "payment-production-261a.up.railway.app";
  static const String sneakers = "/api/products";
  static const String sneaker = "/api/product/id";
  static const String orders = "/api/orders";
  static const String search = "/api/products/search/key";
}
// https://payment-production-261a.up.railway.app/stripe/checkout-success
// https://payment-production-261a.up.railway.app/stripe/cancel