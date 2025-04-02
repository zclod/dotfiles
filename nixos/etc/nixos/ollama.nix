{pkgs, lib, ...}:

let 
    unstable = import <nixos-unstable> {};
#    ollamaGPU = pkgs.ollama.overrideAttrs (
#      final: prev: {
#              src = pkgs.fetchFromGitHub {
#                owner = "Maciej-Mogilany";
#                repo = "ollama";
#                rev = "8170b0345de6aa78c679c9eae303fbf745f5bd7f";
#                # If you don't know the hash, the first time, set:
#                # hash = "";
#                # then nix will fail the build with such an error message:
#                # hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
#                # specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
#                # got:    sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
#                hash = "sha256-Q9ML6ADKgsVDEbyljX8G/8i41jkd23Hl+rAX+t0mUfg=";
#              };
#
#              #vendorHash = null;
#              dontPatch = true;
#      }
#    );


in

{

#    nixpkgs.overlays = [(
#        final: prev:
#        {
#          ollama = (prev.ollama.override {
#            buildGoModule = pkgs.buildGoModule;
#          }).overrideAttrs (old: {
#            src = prev.fetchFromGitHub {
#              owner = "Maciej-Mogilany";
#              repo = "ollama";
#              rev = "8170b0345de6aa78c679c9eae303fbf745f5bd7f";
#              # If you don't know the hash, the first time, set:
#              # hash = "";
#              # then nix will fail the build with such an error message:
#              # hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
#              # specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
#              # got:    sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
#              hash = "sha256-Q9ML6ADKgsVDEbyljX8G/8i41jkd23Hl+rAX+t0mUfg=";
#            };
#
#            #ldflags = prev.ollama.ldflags // ["-mod=readonly"];
#            #ldflags = ["-mod=readonly"];
#            #vendorHash = null;
#            dontPatch = true;
#
#          });
#        }
#    )];


    boot.kernelPackages = pkgs.linuxPackages_latest;

#    environment.systemPackages = with pkgs; [
#        gnumake
#        gcc
#
#        rocmPackages.clr
#        rocmPackages.hipblas
#        rocmPackages.tensile
#        rocmPackages.rocblas
#        rocmPackages.rocsolver
#        rocmPackages.rocsparse
#        rocmPackages.rocm-device-libs
#        rocmPackages.rocm-smi
#        rocmPackages.llvm.clang
#        rocmPackages.llvm.bintools
#    ];
#    environment.systemPackages = [unstable.ollama-rocm];
#
    services.ollama.enable = true;
    services.ollama.rocmOverrideGfx = "11.0.0";
    services.ollama.acceleration = "rocm";
    #services.ollama.package = ollama-rocm;

    services.ollama.environmentVariables = {
        OLLAMA_LLM_LIBRARY = "rocm_v60000";
        HCC_AMDGPU_TARGET = "gfx1103";
        OLLAMA_MAX_LOADED_MODELS = "1";
        OLLAMA_NUM_PARALLEL = "1";

    };

    systemd.services.ollama.wantedBy = lib.mkForce [];
}
