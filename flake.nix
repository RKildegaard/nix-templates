{
  description = "A collection of flake templates";

  outputs = _: {
    templates = {
      python = {
        path = ./python;
        description = "Python 3.15 template";
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