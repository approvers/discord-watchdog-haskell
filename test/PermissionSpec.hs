module PermissionSpec (spec) where

import Test.Hspec
import Permission

spec :: Spec
spec = do
    describe "fromFlag" $ do
        it "should be 0x00000001 when arg is CreateInstantInvite" $ do
            fromFlag CreateInstantInvite `shouldBe` 0x00000001
        it "should be 0x00000200 when arg is Stream" $ do
            fromFlag Stream `shouldBe` 0x00000200
        it "should not be 0x000004000 when arg is Administrator" $ do
            fromFlag Administrator `shouldNotBe` 0x00004000

    describe "fromBit" $ do
        it "should be BanMembers when arg is 0x00000004" $ do
            fromBit 0x00000004 `shouldBe` BanMembers
        it "should be AttachFiles when arg is 0x00008000" $ do
            fromBit 0x00008000 `shouldBe` AttachFiles
        it "should not be Connect when arg is 0x40000000" $ do
            fromBit 0x40000000 `shouldNotBe` Connect
