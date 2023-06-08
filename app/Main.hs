import System.Environment
import System.IO
import RSA
import System.Random

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
      -- putStrLn $ show (generaLlaves 80000000)
      let llavePublica = 7
      let llavePrivada = 23
      let n = 187

      let cadena = "Hola cara de verga, te odio y te desprecio\nHueles a mierda rompe madres"
      putStrLn $ "\nTexto original: " ++ cadena
      
      -- Encriptar
      let textoEncriptadoCadena = encriptaCadena llavePublica n cadena
      putStrLn $ "Texto encriptado (cadena): " ++ show textoEncriptadoCadena
      
      -- Desencriptar
      let textoDesencriptadoCadena = desencriptaCadena llavePrivada n textoEncriptadoCadena
      putStrLn $ "Texto desencriptado (cadena): " ++ textoDesencriptadoCadena


    -- En caso de que no te proporcionen un archivo 
    _ -> putStrLn "Se debe proporcionar un archivo como argumento"

