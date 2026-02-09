{
  description = "A collection of flake templates";

  outputs = _: {
    templates = {
      python-315 = {
        path = ./python/python315;
        description = "Python 3.15 template";
      };
      python-312 = {
        path = ./python/python312;
        description = "Python 3.12 template";
      };
      java-gradle = {
        path = ./java/gradle;
        description = "Gradle jdk25 template";
      };
      java-maven = {
        path = ./java/maven;
        description = "Maven jdk25 template";
      };
      java-javac = {
        path = ./java/javac;
        description = "Javac jdk25 template";
      };
    };
  };
}