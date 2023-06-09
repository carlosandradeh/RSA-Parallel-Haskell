import System.Environment
import System.IO
import System.Random
import RSA

appendLinesToFile :: FilePath -> [String] -> IO ()
appendLinesToFile filePath lines = do
  mapM_ (appendFile filePath) lines

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
      -- putStrLn contents
      --putStrLn $ show (primos 40)
      -- putStrLn $ show (generaLlaves 80000000)

      putStrLn $ "\nTexto original: " ++ contents

      -- Generar llaves !!
      putStrLn "Ingresa un numero cuaquiera para generar llaves:"
      semilla <- getLine
      let (llavePublica, llavePrivada, n) = generaLlaves (read semilla :: Int)
      let lineas = ["\nLlave Publica: " ++ show llavePublica, "\nLlave Privada: " ++ show llavePrivada, "\nn: " ++ show n]
      appendLinesToFile "llaves.txt" lineas
      putStrLn "Se ha generado el archivo con las LLAVES correctamente."


      -- Encriptar
      let textoEncriptadoCadena = encriptaCadena llavePublica n contents
      --putStrLn $ "Texto encriptado (cadena): " ++ show textoEncriptadoCadena
      writeFile "encriptado.txt" (show textoEncriptadoCadena)
      putStrLn "Se ha generado el archivo encriptado correctamente."

      -- Desencriptar
      let textoDesencriptadoCadena = desencriptaCadena llavePrivada n textoEncriptadoCadena
      --putStrLn $ "Texto desencriptado (cadena): " ++ textoDesencriptadoCadena
      writeFile "desencriptado.txt" textoDesencriptadoCadena
      putStrLn "Se ha generado el archivo desencriptado correctamente."
    
    -- En caso de que no te proporcionen un archivo 
    _ -> putStrLn "Se debe proporcionar un archivo como argumento"

