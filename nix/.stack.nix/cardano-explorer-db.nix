{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "cardano-explorer-db"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "(c) 2019 IOHK";
      maintainer = "operations@iohk.io";
      author = "IOHK Engineering Team";
      homepage = "https://github.com/input-output-hk/cardano-explorer";
      url = "";
      synopsis = "A block explorer for the Cardano chain";
      description = "Code for the Cardano Block Explorer that is shared between the\ncardano-explorer-db-node and the cardano-explorer web application.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.aeson)
          (hsPkgs.base)
          (hsPkgs.base16-bytestring)
          (hsPkgs.bytestring)
          (hsPkgs.containers)
          (hsPkgs.conduit)
          (hsPkgs.conduit-extra)
          (hsPkgs.contra-tracer)
          (hsPkgs.directory)
          (hsPkgs.esqueleto)
          (hsPkgs.extra)
          (hsPkgs.fast-logger)
          (hsPkgs.filepath)
          (hsPkgs.iohk-monitoring)
          (hsPkgs.monad-logger)
          (hsPkgs.persistent)
          (hsPkgs.persistent-postgresql)
          (hsPkgs.persistent-template)
          (hsPkgs.postgresql-simple)
          (hsPkgs.resourcet)
          (hsPkgs.scientific)
          (hsPkgs.text)
          (hsPkgs.template-haskell)
          (hsPkgs.time)
          (hsPkgs.transformers)
          (hsPkgs.unix)
          ];
        };
      exes = {
        "cardano-explorer-db-manage" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.cardano-explorer-db)
            (hsPkgs.optparse-applicative)
            ];
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.aeson)
            (hsPkgs.cardano-explorer-db)
            (hsPkgs.cardano-ledger)
            (hsPkgs.hedgehog)
            ];
          };
        "test-db" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.bytestring)
            (hsPkgs.cardano-explorer-db)
            (hsPkgs.HUnit)
            (hsPkgs.persistent)
            (hsPkgs.tasty)
            (hsPkgs.tasty-hunit)
            (hsPkgs.text)
            (hsPkgs.time)
            (hsPkgs.transformers)
            ];
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.././cardano-explorer-db; }