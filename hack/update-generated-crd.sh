#!/bin/bash
set -euo pipefail

function install_crd {
  local SRC="$1"
  local DST="$2"
  if ! diff -Naup "$SRC" "$DST"; then
    cp "$SRC" "$DST"
    echo "installed CRD: $SRC => $DST"
  fi
}

# Can't rely on associative arrays for old Bash versions (e.g. OSX)
install_crd \
  "vendor/github.com/openshift/api/operator/v1/0000_50_ingress-operator_00-custom-resource-definition.yaml" \
  "manifests/00-custom-resource-definition.yaml"

install_crd \
  "vendor/github.com/openshift/api/operatoringress/v1/0000_50_dns-record.yaml" \
  "manifests/00-custom-resource-definition-internal.yaml"
