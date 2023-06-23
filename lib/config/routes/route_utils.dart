enum PAGES {
  root,
  todos,
  error,
}
extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.root:
        return "/";

      case PAGES.todos:
        return "/todos";
      case PAGES.error:
        return "/error";
      default:
        return "/";
    }
  }
  String get screenName {
    switch (this) {
      case PAGES.root:
        return "ROOT";
      case PAGES.error:
        return "ERROR";
      case PAGES.todos:
        return "TODOS";
      default:
        return "ROOT";
    }
  }
}
