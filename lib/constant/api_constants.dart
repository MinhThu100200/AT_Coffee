class ApiConstants {
  static String HOST = 'https://d58b-123-20-138-232.ngrok.io';
  static String GET_CATEGORY = '/api/info/category/?list=true';
  static String GET_STORE = '/api/info/store';
  static String GET_PRODUCT =
      '/api/info/product?page=1&size=100&store=AT_THUDUC&category&keyword';
  static String GET_PRODUCT_BY_CATEGORY(cate) =>
      '/api/info/product?page=1&size=100&store=AT_THUDUC&category=' +
      cate +
      '&keyword';
}
