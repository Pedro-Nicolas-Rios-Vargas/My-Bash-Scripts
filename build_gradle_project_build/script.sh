#!/bin/bash

read -p "Subproject name: " subproject_name
read -p "Packages group: " raw_package_group
package_group=$(echo $raw_package_group | tr -s "." "/")

mkdir -p ${subproject_name}/src/main/java/${package_group}
mkdir -p ${subproject_name}/src/test/java/${package_group}

build_gradle_template="
plugins {\n
\tid 'java'\n
\tid 'application'\n
\tid 'eclipse'\n
}\n
\n
group = '${raw_package_group}'\n
version = '0.0.1-SNAPSHOT'\n
\n
repositories {\n
\tmavenCentral()\n
}\n
\n
dependencies {\n
\t\n
}\n
\n
java {\n
\tsourceCompatibility = '17'\n
\ttoolchain {\n
\t\tlanguageVersion = JavaLanguageVersion.of(19)\n
\t}\n
}\n
\n
tasks.named('test') {\n
\tuseJUnitPlatform()\n
}
"

echo -e ${build_gradle_template} > ${subproject_name}/build.gradle
actual_dir=$(echo "$PWD"/settings.gradle)
if [[ -f $actual_dir ]]; then
    echo "include('${subproject_name}')" >> settings.gradle
else
    echo "'settings.gradle' not found in current directory"
fi
