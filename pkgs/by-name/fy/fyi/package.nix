{
  stdenv,
  lib,
  fetchFromGitea,
  pkg-config,
  meson,
  ninja,
  dbus,
  scdoc,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "fyi";
  version = "1.0.3";
  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "dnkl";
    repo = "fyi";
    rev = finalAttrs.version;
    hash = "sha256-0HGpJEWw7ShLs5vX5loYadtikzopUzzlcU+6B95nUoQ=";
  };

  depsBuildBuild = [ pkg-config ];

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
    scdoc
  ];

  buildInputs = [ dbus ];

  mesonBuildType = "release";

  meta = {
    changelog = "https://codeberg.org/dnkl/fyi/releases/tag/${finalAttrs.version}";
    description = "Command line utility to create desktop notifications";
    homepage = "https://codeberg.org/dnkl/fyi";
    license = [ lib.licenses.mit ];
    mainProgram = "fyi";
    maintainers = with lib.maintainers; [ marnym ];
    platforms = lib.platforms.linux;
  };
})
