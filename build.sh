#!/bin/bash
set -e

export OPAMYES=1

NCPU="$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1)"
OCAML_VERSION="5.0.0"
OPAM_SWITCH=test-"$OCAML_VERSION"
opam init --reinit --bare --no-setup

switch_exists=no
for installed_switch in $(opam switch list --short); do
  if [[ "$installed_switch" == "$OPAM_SWITCH" ]]; then
    switch_exists=yes
    break
  fi
done

if [ "$switch_exists" = "no" ]; then
  opam switch create $OPAM_SWITCH $OCAML_VERSION
else
  opam switch $OPAM_SWITCH
fi

eval $(SHELL=bash opam config env --switch=$OPAM_SWITCH)
opam install -j $NCPU llvm.16.0.6+nnp
opam install -j $NCPU dune z3 yojson domainslib progress ocamlgraph
opam install -j $NCPU ocamlformat.0.26.1 merlin ocp-index ocp-indent ocaml-lsp-server # for development
make
