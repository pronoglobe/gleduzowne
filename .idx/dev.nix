
# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  services.docker.enable = true;
  services.postgres.enable = true;
  services.redis.enable = true;
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodePackages.firebase-tools
    pkgs.jdk17
    pkgs.unzip
    pkgs.python310
    pkgs.python310Packages.pip
    pkgs.nodejs_20
    pkgs.yarn
    pkgs.nodePackages.pnpm
    pkgs.bun
    pkgs.gh
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt
    pkgs.stdenv.cc
  ];
  # Sets environment variables in the workspace
  env = {

    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";

  };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
      "rust-lang.rust-analyzer"
      "tamasfe.even-better-toml"
      "serayuzgur.crates"
      "vadimcn.vscode-lldb"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # default.openFiles = ["src/main.rs"];

        build-flutter = ''
          cd /home/user/myapp/android

          ./gradlew \
            --parallel \
            -Pverbose=true \
            -Ptarget-platform=android-x86 \
            -Ptarget=/home/user/myapp/lib/main.dart \
            -Pbase-application-name=android.app.Application \
            -Pdart-defines=RkxVVFRFUl9XRUJfQ0FOVkFTS0lUX1VSTD1odHRwczovL3d3dy5nc3RhdGljLmNvbS9mbHV0dGVyLWNhbnZhc2tpdC85NzU1MDkwN2I3MGY0ZjNiMzI4YjZjMTYwMGRmMjFmYWMxYTE4ODlhLw== \
            -Pdart-obfuscation=false \
            -Ptrack-widget-creation=true \
            -Ptree-shake-icons=false \
            -Pfilesystem-scheme=org-dartlang-root \
            assembleDebug

          # TODO: Execute web build in debug mode.
          # flutter run does this transparently either way
          # https://github.com/flutter/flutter/issues/96283#issuecomment-1144750411
          # flutter build web --profile --dart-define=Dart2jsOptimization=O0 

          adb -s localhost:5555 wait-for-device
        '';




        npm-install = "npm ci --no-audit --prefer-offline --no-progress --timing";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [
          # Cover all the variations of language, src-dir, router (app/pages)
          "pages/index.tsx" "pages/index.jsx"
          "src/pages/index.tsx" "src/pages/index.jsx"
          "app/page.tsx" "app/page.jsx"
          "src/app/page.tsx" "src/app/page.jsx"
          "gleduzownecli/src/main.rs"
        ];

      };
      
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        # web = {
        #   command = ["flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT"];
        #   manager = "flutter";
        # };
        web = {
          command = ["npm" "run" "dev" "--" "--port" "$PORT" "--hostname" "0.0.0.0"];
          manager = "web";
        };
        android = {
          command = ["flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555"];
          manager = "flutter";
        };
      };
    };
  };
}
