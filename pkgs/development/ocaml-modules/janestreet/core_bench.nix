{ lib
, buildOcamlJane
, core
, core_extended
, textutils
}:

buildOcamlJane {
  pname = "core_bench";
  hash = "1d1ainpakgsf5rg8dvar12ksgilqcc4465jr8gf7fz5mmn0mlifj";
  propagatedBuildInputs =
    [ core core_extended textutils ];

  meta = with lib; {
    homepage = "https://github.com/janestreet/core_bench";
    description = "Micro-benchmarking library for OCaml";
    license = licenses.asl20;
    maintainers = [ maintainers.pmahoney ];
  };
}
