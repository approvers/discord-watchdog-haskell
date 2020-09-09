{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad (when)
import Data.Text (isPrefixOf, toLower, pack, Text)
import qualified Data.Text.IO as TIO

import Discord
import Discord.Types
import qualified Discord.Requests as R

import System.Environment (getEnv)
import Configuration.Dotenv (loadFile, defaultConfig)

main :: IO ()
main = do
    loadFile defaultConfig
    token <- pack <$> getEnv "DISCORD_TOKEN"
    userFacingError <- runDiscord $ def
        { discordToken = token
        , discordOnEvent = eventHandler
        }
    TIO.putStrLn userFacingError

eventHandler :: Event -> DiscordHandler ()
eventHandler event = case event of
    MessageCreate m -> when (not (fromBot m) && isPing (messageText m)) $ do
        restCall $ R.CreateReaction (messageChannel m, messageId m) "eyes"
        restCall $ R.CreateMessage (messageChannel m) "Pong !"
        return ()
    _ -> return ()

fromBot :: Message -> Bool
fromBot m = userIsBot $ messageAuthor m

isPing :: Text -> Bool
isPing s = isPrefixOf "ping" $ toLower s