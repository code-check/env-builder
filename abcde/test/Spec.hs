{-# LANGUAGE QuasiQuotes #-}

import Test.Hspec
import Lib

import Control.Monad
import Data.Maybe
import Data.Char
import Text.Shakespeare.Text
import Data.Text.Encoding
import Data.String.Here
import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8
import System.Directory

helloWorld :: T.Text
helloWorld = [sbt|Hello
|world
||]

variable231 = RubyVariable "2.3.1" "https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz" "3.4.0"
variable230 = RubyVariable "2.3.0" "https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz" "3.4.0"
element231 = RubyYml "ruby" [variable231]
element230 = RubyYml "ruby" [variable230]
main :: IO ()
main = hspec $ do
  describe "shakespeare" $ it "sbt" $
    helloWorld `shouldBe` T.pack "Hello\nworld\n"
  describe "parse yaml" $ it "" $
    parseYaml (B8.pack "") `shouldBe` (Nothing :: Maybe RubyYml)
  describe "write Dockerfile" $ it "" $ do
    forM_ (var element231) (T.writeFile "Dockerfile" . renderDockerfile)
    "" `shouldBe` ""
--  describe "toElement" $ it "" $
--    toElement "ruby.yml" >>= (`shouldBe` (RubyYml "ruby" [variable230, variable231]))

