#!/bin/bash
if [ -n "$GITHUB_BASE_REF" ] && [[ "$GITHUB_BASE_REF" == "latest" ]]; then
  VERSION=$(grep -oPm1 "(?<=<version>)[^<]+" pom.xml)
  echo "::set-env name=KEYCLOAK_VERSION::$VERSION"
else
  echo "::set-env name=KEYCLOAK_VERSION::$(mvn -f keycloak-dist/pom.xml -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec)"
fi
