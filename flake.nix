{
  description = "A collection of flake templates";

  outputs = _: {
    templates = {
      python_3_15 = {
        path = ./python/python315;
        description = "Python 3.15 template";
      };
      python_3_12 = {
        path = ./python/python312;
        description = "Python 3.12 template";
      };
      java_gradle = {
        path = ./java/gradle;
        description = "Gradle jdk25 template";
      };
      java_maven = {
        path = ./java/maven;
        description = "Maven jdk25 template";
      };
      java_javac = {
        path = ./java/javac;
        description = "Javac jdk25 template";
      };
    };
  };
}