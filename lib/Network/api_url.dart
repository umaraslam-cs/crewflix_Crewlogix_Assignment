class ApiUrl {
  // static const baseUrl = "http://192.168.0.109:5001/api/";
  static const baseUrl = "https://dev.gotstuck.co.uk/api/";
  static const loginURL = "${ApiUrl.baseUrl}auth/register";
  static const otpSendMobile = "${ApiUrl.baseUrl}user/send-otp-phone";
  static const socialUrl = "${ApiUrl.baseUrl}auth/social-login";
  static const otpURL = "${ApiUrl.baseUrl}auth/verify-OTP";
  static const resendOtpUrl = "${ApiUrl.baseUrl}user/update-phone";
  static const otpResendUrl = "${ApiUrl.baseUrl}auth/resend-otp";
  static const updateProfile = "${ApiUrl.baseUrl}user/update-profile";
  static const vehicleUrl = "${ApiUrl.baseUrl}vehicle";
  static const orderUrl = "${ApiUrl.baseUrl}orders";
  static const walletUrl = "${ApiUrl.baseUrl}wallet/get-balance";
  static const category = "${ApiUrl.baseUrl}category?type=";
  static const voucherUrl =
      "${ApiUrl.baseUrl}vservices/list-user-vouchers?type=";
  static const walletTrans = "${ApiUrl.baseUrl}orders/get-transaction-history?";

  static const notificationUrl = "${ApiUrl.baseUrl}notification/user/notifications?readAt=true&";
  static const categoryDetail = "${ApiUrl.baseUrl}user-services/sub-services-by-service-name/";
  static const aboutUs = "${ApiUrl.baseUrl}settings/get-about-section";
  static const updateFcmURL = "${ApiUrl.baseUrl}user/update-fcm";
  static const profile = "${ApiUrl.baseUrl}user/get-profile";
  static const shopServiceUrl =
      "${ApiUrl.baseUrl}vservices/list-nearby-services";
  static const postImage = "${ApiUrl.baseUrl}image";
  static const roadSide = "${ApiUrl.baseUrl}road-side-order";
  static const freelancers =
      "${ApiUrl.baseUrl}user-service-types/get-freelancers?orderId=";
  static const orderHistory =
      "${ApiUrl.baseUrl}road-side-order/order-history-order-status";
  static const reviewsUrl = "${ApiUrl.baseUrl}reviews";
  static const listTopRatted =
      "${ApiUrl.baseUrl}vservices/list-top-ratted-services";
}
