{ lib
, pkgs
, buildPythonPackage
, fetchFromGitHub
, python
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

  build-system = [ python.pkgs.setuptools ];
  pyproject = true;
#  format = "pyproject";
  patches = [
    ./0001-relax_neo4j_version.patch
  ];

  dependencies = with python.pkgs; [
    neo4j
  ];

  pythonImportsCheck = [
    "neomodel"
  ];
}
