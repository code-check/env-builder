{-# LANGUAGE QuasiQuotes #-}

import Test.Hspec
import Lib

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

element231 = Element "2.3.1" "https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz" "3.4.0"
element230 = Element "2.3.0" "https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz" "3.4.0"
main :: IO ()
main = hspec $ do
  describe "shakespeare" $ it "sbt" $
    helloWorld `shouldBe` (T.pack "Hello\nworld\n")
  describe "parse yaml" $ it "" $
    parseYaml (B8.pack "") `shouldBe` (Nothing :: Maybe [Element])
  describe "write Dockerfile" $ it "" $
    T.writeFile "Dockerfile" $ dockerfile element231
  describe "toElement" $ it "" $
    toElement "ruby.yml" >>= (`shouldBe` Just [element230, element231])

