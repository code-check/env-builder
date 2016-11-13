{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Lib where

import qualified Data.ByteString as B
import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.Text.Lazy as TL
import Data.Text.Lazy.Builder
import qualified Data.Yaml as Y
import Data.Aeson (FromJSON)
import Data.Aeson.Types (genericParseJSON, defaultOptions, fieldLabelModifier)
import Data.Aeson.Casing (aesonPrefix, snakeCase)
import GHC.Generics (Generic)
import Text.Shakespeare.Text (toText, textFile)

data RubyVariable = RubyVariable { version, url, rspecVersion :: String } deriving (Show, Eq, Generic)
data RubyYml = RubyYml { name :: String, var :: [RubyVariable] } deriving (Show, Eq, Generic)

instance FromJSON RubyVariable where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = snakeCase }

instance FromJSON RubyYml where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = snakeCase }

parseYaml :: B.ByteString -> Maybe RubyYml
parseYaml x = Y.decode x :: Maybe RubyYml

toYml :: String -> IO (Maybe RubyYml)
toYml x = fmap parseYaml (B.readFile x)

renderDockerfile :: RubyVariable -> T.Text
renderDockerfile e = f . $(textFile "Dockerfile.template") $ e
  where
    f :: Builder -> T.Text
    f = TL.toStrict . toLazyText . toText

