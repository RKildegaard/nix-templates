{
  description = "A collection of flake templates";

  # HOW TO USE:
  # The outputs are defined in categories. To template the categories use "-" seperated names.
  # This way in python-315 the python is the category and the 315 is the template name.

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
      go = {
        path = ./go;
        description = "Go devshell template";
      };
      chisel = {
        path = ./chisel;
        description = "Chisel template";
      };
    };
  };
}