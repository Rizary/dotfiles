{ runCommand, requireFile, unzip }:
let
  name = "pragmatapro-${version}";
  version = "0.828";
in
runCommand
  name
rec {
  outputHashMode = "recursive";
  outputHashAlgo = "sha256";
  outputHash = "005xrgfnxjzza306l8lb43r4jwdhkym8pyyhw7zd02mawvr9f185";


  src = requireFile rec {
    name = "PragmataPro${version}.zip";
    url = "file:///home/rizary/Scratch/${name}";
    sha256 = "19q6d0dxgd9k2mhr31944wpprks1qbqs1h5f400dyl5qzis2dji3";
  };

  buildInputs = [ unzip ];
} ''
  unzip $src
  install_path=$out/share/fonts/truetype/pragmatapro
  mkdir -p $install_path
  find -name "PragmataPro*.ttf" -exec mv {} $install_path \;
''
