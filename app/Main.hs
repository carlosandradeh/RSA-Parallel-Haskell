import System.Environment
import System.IO
import RSA


-- FUNCION PRINCIPAL
main :: IO ()
main = do
  -- Obtenemos los argumentos
  args <- getArgs
  case args of
    [file] -> do
      -- Manipulamos al archivo aqui 
      putStrLn $ "Archivo proporcionado: " ++ file
      contents <- readFile file
      putStrLn contents
      putStrLn $ show (primos 40)
    -- En caso de que no te proporcionen un archivo 
    _ -> putStrLn "Se debe proporcionar un archivo como argumento"

