import Data.List (break)

type Name = String
type Data = String
data FSItem   = File Name Data | Folder Name [FSItem] deriving (Show)
data FSCrumb  = FSCrumb Name [FSItem] [FSItem] deriving (Show)
type FSZipper = (FSItem, [FSCrumb])

fsUp :: FSZipper -> FSZipper
fsUp (item, FSCrumb name ls rs:bs) =
    (Folder name (ls ++ [item] ++ rs), bs)

fsTo :: Name -> FSZipper -> FSZipper
fsTo name (Folder folderName items, bs) = 
    let (ls, item:rs) = break (nameIs name) items
    in  (item, FSCrumb folderName ls rs:bs)

nameIs :: Name -> FSItem -> Bool
nameIs name (Folder folderName _) = name == folderName
nameIs name (File   fileName _)   = name == fileName

x -: f = f x

myDisk :: FSItem
myDisk = 
    Folder "root" [
        　File   "music01.wmv" "peepee"
        , File   "time.avi" "god bless"
        , Folder "pics" [
            　File "pic.jpeg"   "bleargh"
            , File "gifPic.gif" "smash"
            , File "bmpPic.bmp" "bbb"]
        , File   "doc01.doc" "docdoc"
        , Folder "programs" [
              File   "mine.exe" "gogo"
            , File   "hshs.exe" "hshs"
            , Folder "source" [
                  File "cSharp.cs"  "main = print(fix error)"
                , File "haskell.hs" "main = print 4"]]]

-- | With Maybe Monad
goLeft :: Zipper a -> Maybe (Zipper a)
goLeft (Node x l r, bs) = Just (l, LeftCrumb x r:bs)
goLeft (Empty, _)       = Nothing
