import Text.Read (readMaybe)

-- Function to perform calculations
calculate :: Double -> Double -> String -> Either String Double
calculate num1 num2 operation =
    case operation of
        "+" -> Right (num1 + num2)
        "-" -> Right (num1 - num2)
        "*" -> Right (num1 * num2)
        "/" -> if num2 == 0
               then Left "Error: Division by zero"
               else Right (num1 / num2)
        _   -> Left "Error: Unsupported operation"

-- Main function
main :: IO ()
main = do
    putStrLn "Simple Calculator"

    let loop = do
            putStr "Enter first number: "
            input1 <- getLine
            case readMaybe input1 :: Maybe Double of
                Nothing -> putStrLn "Invalid number. Please try again." >> loop
                Just num1 -> do
                    putStr "Enter operation (+, -, *, /): "
                    operation <- getLine
                    putStr "Enter second number: "
                    input2 <- getLine
                    case readMaybe input2 :: Maybe Double of
                        Nothing -> putStrLn "Invalid number. Please try again." >> loop
                        Just num2 -> do
                            let result = calculate num1 num2 operation
                            case result of
                                Left errMsg -> putStrLn errMsg
                                Right res   -> putStrLn $ "Result: " ++ show res
                            putStrLn "Do you want to perform another calculation? (yes/no)"
                            continue <- getLine
                            if continue == "yes"
                                then loop
                                else putStrLn "Goodbye!"

    loop
