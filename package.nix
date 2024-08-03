{ lib
, pkgs
, buildPythonPackage
, fetchFromGitHub
, setuptools
, neo4j
}:

buildPythonPackage rec {
  pname = "neomodel";
  version = "git";

  src = fetchFromGitHub {
    owner = "neo4j-contrib";
    repo = "neomodel";
    rev = "0194f3a8b2e93ec44e2089f21eacb12f15b86c70";
    sha256 = "sha256-yRxx372+um0xlUEO9L3SHqX5E8D1FI02HGQupUsryww=";
  };

  build-system = [ setuptools ];
  pyproject = true;
#  format = "pyproject";
  patches = [
    ./0001-relax_neo4j_version.patch
  ];

  dependencies = [
    neo4j
  ];

  pythonImportsCheck = [
    "neomodel"
  ];

#  postInstall = ''
#    cp -R surrealdb $out/${pkgs.python3.sitePackages}/
#    mv $out/${pkgs.python3.sitePackages}/rust_surrealdb $out/${pkgs.python3.sitePackages}/surrealdb/
#  '';

  #nativeBuildInputs = pkgs.python3.withPackages (ps: [ ps.setuptools ]);
#  buildInputs = pkgs.python3.withPackages (ps: [ ps.setuptools ]);
}
