#!/bin/bash -e

# Use `all` by default, but able to specify the image name if you want
[ $# -ne 0 ] && echo "Test using an image $1" >&2
readonly DOCKER_IMAGE=${1:-all}

readonly VERSION_CODECHECK="0.6.5"

readonly VERSION_CLANG="3.4"
readonly VERSION_GCC="4.8.4"
readonly VERSION_GPP="4.8.4"
readonly VERSION_MONO="5.8.0.108"

readonly VERSION_JAVA="1.8.0_161"
readonly VERSION_SCALA="2.11.7"
readonly VERSION_GROOVY="2.4.5"

readonly VERSION_NODE="v6.13.0"
readonly VERSION_NIGHTMARE="2.10.0"

readonly VERSION_GO="1.6.3"
readonly VERSION_HASKELL="7.6.3"

readonly VERSION_PERL="v5.18.2"
readonly VERSION_PHP="5.6.33"
readonly VERSION_PYTHON2="2.7.11"
readonly VERSION_PYTHON3="3.6.1"
readonly VERSION_RUBY="2.3.5"
readonly VERSION_SBCL="1.1.14"

readonly VERSION_CABAL="1.22.9.0"
readonly VERSION_PIP2="9.0.1"
readonly VERSION_PIP3="9.0.1"

readonly VERSION_HSPEC="2.4.8"
readonly VERSION_RSPEC="3.4.4"
readonly VERSION_PHPUNIT="5.7.21"

docker_run () {
	echo "===== command to run: $* =====" >&2
	docker run --rm=false -it ${DOCKER_IMAGE} $*
}
docker_run_login () {
	echo "===== command to run: bash --login -c \"$*\" =====" >&2
	docker run --rm=false -it ${DOCKER_IMAGE} bash --login -c "$*"
}

expect_to_include () {
	local cmd=$1
	local expect=$2
	local login=${3:-yes}
	echo "** expect to include \"$expect\" **" >&2
	if [[ "$login" == "yes" ]]; then
		[[ "$(docker_run_login $cmd)" == *"$expect"* ]] && echo "as expected" >&2
	else
		[[ "$(docker_run $cmd)" == *"$expect"* ]] && echo "as expected" >&2
	fi
}

: "Environment related" && {
	: "Language" && {
		expect_to_include "echo \$LANG" "en_US.UTF-8"
	}
}

: "Haskell related" && {
	: "haskell (ghc)" && {
		docker_run_login "which ghc"
		expect_to_include "ghc --version" "$VERSION_HASKELL"
	}
	: "cabal & hspec" && {
		docker_run_login "which cabal"
		expect_to_include "cabal --numeric-version" "$VERSION_CABAL"
		expect_to_include "cabal info hspec" "Versions installed: $VERSION_HSPEC"
	}
}
: "C/C++ related" && {
	: "gcc" && {
		docker_run_login "which gcc"
		expect_to_include "gcc --version" "$VERSION_GCC"
	}
	: "g++" && {
		docker_run_login "which g++"
		expect_to_include "g++ --version" "$VERSION_GPP"
	}
	: "clang" && {
		docker_run_login "which clang"
		expect_to_include "clang --version" "$VERSION_CLANG"
	}
}
: "C# related" && {
	: "mono" && {
		docker_run_login "which mono"
		expect_to_include "mono --version" "$VERSION_MONO"
	}
}
: "Java related" && {
	: "java" && {
		docker_run_login "which java"
		expect_to_include "java -version" "$VERSION_JAVA"
	}
	: "scala" && {
		docker_run_login "which scala"
		expect_to_include "scala -version" "$VERSION_SCALA"
		: "sbt" && {
			docker_run_login "which sbt"
			docker_run_login "sbt sbt-version"
		}
		: "activator" && {
			docker_run_login "which activator"
		}
		# Fast Scala compiler
		: "fsc" && {
			docker_run_login "which fsc"
			docker_run_login "fsc -version"
		}
	}
	: "groovy" && {
		docker_run_login "which groovy"
		docker_run_login "groovy --version"
		expect_to_include "groovy --version" "$VERSION_GROOVY"
	}
	: "gradle" && {
		docker_run_login "which gradle"
		docker_run_login "gradle --version"
	}
}
: "JavaScript related" && {
	: "node" && {
		docker_run_login "which node"
		expect_to_include "node --version" "$VERSION_NODE"
	}
	: "codecheck" && {
		docker_run_login "which codecheck"
		docker_run_login "codecheck"
		expect_to_include "codecheck" "$VERSION_CODECHECK"
	}
	: "nightmare" && {
		docker_run_login "npm ls nightmare --global"
		expect_to_include "npm ls nightmare --global" "$VERSION_NIGHTMARE"
	}
}
: "Perl related" && {
	: "perl" && {
		docker_run_login "which perl"
		expect_to_include "perl --version" "$VERSION_PERL"
	}
}
: "PHP related" && {
	: "php" && {
		docker_run_login "which php"
		expect_to_include "php --version" "$VERSION_PHP"
	}
	: "composer" && {
		docker_run_login "which composer"
		docker_run_login "composer --version"
	}
	: "phpunit" && {
		docker_run_login "which phpunit"
		expect_to_include "phpunit --version" "$VERSION_PHPUNIT"
	}
}
: "Go related" && {
	: "go" && {
		docker_run_login "which go"
		expect_to_include "go version" "$VERSION_GO"
	}
}
: "Ruby related" && {
	: "ruby" && {
		docker_run_login "which ruby"
		expect_to_include "ruby --version" "$VERSION_RUBY"
	}
	: "rspec" && {
		docker_run_login "which rspec"
		expect_to_include "rspec --version" "$VERSION_RSPEC"
	}
}
: "Python related" && {
	: "python (python2)" && {
		docker_run_login "which python"
		# python2 outputs its version to stderr,
		# but by running command through docker it will outputs in stdout
		# so we don't need to redirect the output in our script
		docker_run_login "python2 --version"
		: "pip (pip2)" && {
			docker_run_login "which pip2"
			expect_to_include "pip2 --version" "$VERSION_PIP2"
		}
	}
	: "python3" && {
		docker_run_login "which python3"
		expect_to_include "python3 --version" "$VERSION_PYTHON3"
		: "pip3" && {
			docker_run_login "which pip3"
			expect_to_include "pip3 --version" "$VERSION_PIP3"
		}
	}
}
: "Lisp related" && {
	# Steel Bank Common Lisp (SBCL)
	: "sbcl" && {
		docker_run_login "which sbcl"
		expect_to_include "sbcl --version" "$VERSION_SBCL"
	}
}
: "Rust related" && {
	: "rustc" && {
		docker_run_login "which rustc"
		docker_run_login "rustc --version"
	}
	: "cargo" && {
		docker_run_login "which cargo"
		docker_run_login "cargo --version"
	}
}
