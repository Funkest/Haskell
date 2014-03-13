type Birds = Int
type Pole = (Birds, Birds)

landleft :: Birds -> Pole -> Maybe Pole
landleft n (left, right) 
    | abs (left + n - right) < 4 = Just (left + n, right)
    | otherwise                  = Nothing
        
landright :: Birds -> Pole -> Maybe Pole
landright n (left, right)
    | abs (right + n - left) < 4 = Just (left, right + n)
    | otherwise                  = Nothing

banana :: Pole -> Maybe Pole
banana _ = Nothing

{--
 - p.288 - 295
 - like...
return (0, 0) >>= landleft 3 >>= banana
return (0, 0) >>= landleft 3 >>= banana >>= landright 3
--}
routine0 :: Maybe Pole
routine0 = return (0, 0) >>= landleft 3 >>= landright 5 >>= landright 1 >>= landleft 3

routine1 :: Maybe Pole
routine1 = do
    start <- return (0, 0)
    first <- landleft 3 start
    secnd <- landright 5 first
    third <- landright 1 secnd
    landleft 3 third

-----------------------------------

routine2 :: Maybe Pole
routine2 = return (0, 0) >>= landleft 3 >>= banana >>= landright 3

routine3 :: Maybe Pole
routine3 = do
    start <- return (0, 0)
    first <- landleft 3 start
    secnd <- banana first
    landright 3 secnd

