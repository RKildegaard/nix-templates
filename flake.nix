{
  description = "A collection of flake templates";

  outputs = _: {
    templates = {
      python = {
        path = ./python;
        description = "Python template";
      };
    };
  };
}