{
  description = "A collection of flake templates";

  outputs = _: {
    templates = {
      python = {
        path = ./python;
        description = "Python template";
      };
      java-gradle = {
        path = ./java/gradle;
        description = "Java (Gradle) template";
      };
      java-maven = {
        path = ./java/maven;
        description = "Java (Maven) template";
      };
      java-javac = {
        path = ./java/javac;
        description = "Java (javac) template";
      };
    };
  };
}