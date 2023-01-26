enum Env { dev, prod }

abstract class FlavorConfig {
  static String? title;
  static String? baseUrl;
  static String? image;

  static void init(Env env) {
    switch (env) {
      case Env.dev:
        dev();
        break;
      case Env.prod:
        prod();
        break;
    }
  }

  static void dev() {
    title = "Dev environment";
    baseUrl = "http://localhost:8080";
    image = "dev.png";
  }

  static void prod() {
    title = "Production environment";
    baseUrl = "http://api.com.br";
    image = "prod.png";
  }
}
