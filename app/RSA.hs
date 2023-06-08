module RSA where

import System.Random

-- Funcion que da los primeros n primos 
-- con el metodo de Eratosthenes.
primos:: Int -> [Int]
primos n = sieve [2..n] where
    -- Agregamos todos los numeros que no sean multiplos de un primo
    sieve [] = []
    sieve (x:xs) = x : sieve (filter (\y -> y `mod` x /= 0) xs) 

-- Funcion para obtener dos elementos aleatorios y diferentes de una lista
tuplaAleatorios :: [Int] -> StdGen -> (Int, Int, StdGen)
tuplaAleatorios lista gen = (elemento1, elemento2, gen2)
  where
    n = length lista
    (i, gen1) = randomR (0, n-1) gen -- Obtenemos el índice aleatorio 1
    (j, gen2) = randomR (0, n-2) gen1 -- Obtenemos el índice aleatorio 2 (distinto del primero)
    elemento1 = lista !! i
    elemento2 = if j >= i then lista !! (j+1) else lista !! j
