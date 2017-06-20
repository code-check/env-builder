#!/bin/bash -e
readonly VERSION_CLANG="3.4"
readonly VERSION_GCC="4.8.4"
readonly VERSION_GO="1.6.3"
readonly VERSION_GPP="4.8.4"
readonly VERSION_HASKELL="7.6.3"
readonly VERSION_MONO="5.0.1.1"
readonly VERSION_NODE="v6.11.0"
readonly VERSION_PERL="v5.18.2"
readonly VERSION_PHP="5.6.30-12"
readonly VERSION_PYTHON2="2.7.11"
readonly VERSION_PYTHON3="3.6.1"
readonly VERSION_RUBY="2.3.4"
readonly VERSION_SBCL="1.1.14"

readonly VERSION_CABAL="1.22.6.0"
readonly VERSION_PIP2="9.0.1"
readonly VERSION_PIP3="9.0.1"

readonly VERSION_HSPEC="2.4.4"
readonly VERSION_RSPEC="3.4.4"

docker_run () {
	echo "===== command to run: $* =====" >&2
	docker run --rm -it all $*
}
docker_run_login () {
	echo "===== command to run: bash --login -c \"$*\" =====" >&2
	docker run --rm -it all bash --login -c "$*"
}

expect_to_include () {
	local cmd=$1
	local expect=$2
	local login=${3:-no}
	echo "** expect to include \"$expect\" **" >&2
	if [[ "$login" == "yes" ]]; then
		[[ "$(docker_run_login $cmd)" == *"$expect"* ]] && echo "as expected" >&2
	else
		[[ "$(docker_run $cmd)" == *"$expect"* ]] && echo "as expected" >&2
	fi
}

: "Environment related" && {
	: "Language" && {
		docker_run_login "test -n \$LANG"
		expect_to_include "echo \$LANG" "en_US.UTF-8" yes
	}
}

: "Haskell related" && {
	: "haskell (ghc)" && {
		docker_run "which ghc"
		docker_run "ghc --version"
		docker_run_login "which ghc"
		docker_run_login "ghc --version"
		expect_to_include "ghc --version" $VERSION_HASKELL
	}
	: "cabal & hspec" && {
		docker_run "which cabal"
		# docker_run "test -f /usr/bin/cabal"
		docker_run "cabal --version"
		docker_run_login "which cabal"
		docker_run_login "cabal --version"
		expect_to_include "cabal info hspec" "Versions installed: $VERSION_HSPEC" yes
	}
}
: "C/C++ related" && {
	: "gcc" && {
		docker_run "which gcc"
		docker_run "gcc --version"
		docker_run_login "which gcc"
		docker_run_login "gcc --version"
		expect_to_include "gcc --version" $VERSION_GCC
	}
	: "g++" && {
		docker_run "which g++"
		docker_run "g++ --version"
		docker_run_login "which g++"
		docker_run_login "g++ --version"
		expect_to_include "g++ --version" $VERSION_GPP
	}
	: "clang" && {
		docker_run "which clang"
		docker_run "clang --version"
		docker_run_login "which clang"
		docker_run_login "clang --version"
		expect_to_include "clang --version" $VERSION_CLANG
	}
}
: "C# related" && {
	: "mono" && {
		docker_run "which mono"
		docker_run "mono --version"
		docker_run_login "which mono"
		docker_run_login "mono --version"
		expect_to_include "mono --version" $VERSION_MONO
	}
}
: "Java related" && {
	: "java" && {
		docker_run "which java"
		docker_run "java -version"
		docker_run_login "type java"
		docker_run_login "which java"
		docker_run_login "java -version"
	}
	: "scala" && {
		docker_run "which scala"
		docker_run "scala -version"
		docker_run_login "type scala"
		docker_run_login "which scala"
		docker_run_login "scala -version"
		: "sbt" && {
			docker_run "which sbt"
			docker_run "sbt sbt-version"
			docker_run_login "type sbt"
			docker_run_login "which sbt"
			docker_run_login "sbt sbt-version"
		}
		: "activator" && {
			docker_run "which activator"
			docker_run_login "type activator"
			docker_run_login "which activator"
		}
		# Fast Scala compiler
		: "fsc" && {
			docker_run "which fsc"
			docker_run "fsc -version"
			docker_run_login "type fsc"
			docker_run_login "which fsc"
			docker_run_login "fsc -version"
		}
	}
	: "groovy" && {
		docker_run "which groovy"
		docker_run "groovy --version"
		docker_run_login "which groovy"
		docker_run_login "groovy --version"
	}
	: "gradle" && {
		docker_run "which gradle"
		docker_run "gradle --version"
		docker_run_login "which gradle"
		docker_run_login "gradle --version"
	}
}
: "JavaScript related" && {
	: "node" && {
		docker_run "which node"
		docker_run "node --version"
		docker_run_login "which node"
		docker_run_login "node --version"
		expect_to_include "node --version" $VERSION_NODE yes
	}
	: "codecheck" && {
		docker_run "which codecheck"
		docker_run "codecheck"
		docker_run_login "which codecheck"
		docker_run_login "codecheck"
	}
}
: "Perl related" && {
	: "perl" && {
		docker_run "which perl"
		docker_run "perl --version"
		docker_run_login "which perl"
		docker_run_login "perl --version"
		expect_to_include "perl --version" $VERSION_PERL
	}
}
: "PHP related" && {
	: "php" && {
		docker_run "which php"
		docker_run "php --version"
		docker_run_login "which php"
		docker_run_login "php --version"
		expect_to_include "php --version" $VERSION_PHP
	}
	: "composer" && {
		docker_run "which composer"
		docker_run "composer --version"
		docker_run_login "type composer"
		docker_run_login "which composer"
		docker_run_login "composer --version"
	}
	: "phpunit" && {
		docker_run "which phpunit"
		docker_run "phpunit --version"
	}
}
: "Go related" && {
	: "go" && {
		docker_run "which go"
		docker_run "go version"
		docker_run_login "type go"
		docker_run_login "which go"
		docker_run_login "go version"
		expect_to_include "go version" $VERSION_GO
	}
}
: "Ruby related" && {
	: "ruby" && {
		docker_run "which ruby"
		docker_run "ruby --version"
		docker_run_login "type ruby"
		docker_run_login "which ruby"
		docker_run_login "ruby --version"
		expect_to_include "ruby --version" $VERSION_RUBY
	}
	: "rspec" && {
		docker_run "which rspec"
		docker_run "rspec --version"
		docker_run_login "which rspec"
		docker_run_login "rspec --version"
		expect_to_include "rspec --version" $VERSION_RSPEC
	}
}
: "Python related" && {
	: "python (python2)" && {
		docker_run "which python"
		docker_run "python --version"
		docker_run_login "which python"
		# python2 outputs its version to stderr,
		# but by running command through docker it will outputs in stdout
		# so we don't need to redirect the output in our script
		docker_run_login "python2 --version"
		: "pip (pip2)" && {
			docker_run "pip2 --version"
			docker_run_login "which pip2"
			docker_run_login "pip2 --version"
			expect_to_include "pip2 --version" $VERSION_PIP2
		}
	}
	: "python3" && {
		docker_run "which python3"
		docker_run "python3 --version"
		docker_run_login "which python3"
		docker_run_login "python3 --version"
		expect_to_include "python3 --version" $VERSION_PYTHON3
		: "pip3" && {
			docker_run "which pip3"
			docker_run "pip3 --version"
			docker_run_login "which pip3"
			docker_run_login "pip3 --version"
			expect_to_include "pip3 --version" $VERSION_PIP3
		}
	}
}
: "Lisp related" && {
	# Steel Bank Common Lisp (SBCL)
	: "sbcl" && {
		docker_run "which sbcl"
		docker_run "sbcl --version"
		docker_run_login "which sbcl"
		docker_run_login "sbcl --version"
		expect_to_include "sbcl --version" $VERSION_SBCL
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
