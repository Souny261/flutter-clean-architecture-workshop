enum PAGES {
  root,
  todos,
  error,
  savedTodo,
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
      case PAGES.savedTodo:
        return "/saved-todo";
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
      case PAGES.savedTodo:
        return "SAVED-TODOS";
      default:
        return "ROOT";
    }
  }
}
