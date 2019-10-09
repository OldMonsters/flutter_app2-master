class Tools{
  static String base = "http://125.93.80.98:2375/apis/";

  static String refresh_token = base + "employee-user/v1/refresh-token/";//刷新token
  static String password_login = base + "employee-user/v1/password-login?";//员工用户密码登陆
  static String mobile_login = base + "employee-user/v1/mobile-login?";//员工用户手机验证码登陆
  static String mobile = base + 'employee-user/v1/mobile?';
  static String code = base + 'sms/v1/code?';
  static String check_code = base + 'sms/v1/check-code?';
}