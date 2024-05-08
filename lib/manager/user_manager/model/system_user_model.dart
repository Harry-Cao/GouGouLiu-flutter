enum SystemUserModel {
  customerService;

  static SystemUserModel? fromUserId(String string) {
    switch (string) {
      case "10000":
        return SystemUserModel.customerService;
      default:
        return null;
    }
  }

  String get userId {
    switch (this) {
      case SystemUserModel.customerService:
        return "10000";
    }
  }

  String get userName {
    switch (this) {
      case SystemUserModel.customerService:
        return "狗狗溜客服";
    }
  }

  String get avatarUrl {
    switch (this) {
      case SystemUserModel.customerService:
        return "http://f3.ttkt.cc:12873/GGLServer/media/global/customer_service.jpeg";
    }
  }

  String get welcomeWords {
    switch (this) {
      case SystemUserModel.customerService:
        return "您在使用过程中遇到任何问题都可以向我反馈";
    }
  }
}
