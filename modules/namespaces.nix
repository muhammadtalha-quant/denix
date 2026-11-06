{ inputs, ... }: {

  imports = [
    (inputs.den.namespace "disko" false)
    (inputs.den.namespace "desktop" false)
    (inputs.den.namespace "extras" false)
  ];
}
