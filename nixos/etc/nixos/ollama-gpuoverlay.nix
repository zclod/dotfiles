final: prev:
{
  ollama = prev.ollama.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "Maciej-Mogilany";
      repo = "ollama";
      rev = "8170b0345de6aa78c679c9eae303fbf745f5bd7f";
      # If you don't know the hash, the first time, set:
      # hash = "";
      # then nix will fail the build with such an error message:
      # hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
      # specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
      # got:    sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
      hash = "173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4";
    };
  });
}
