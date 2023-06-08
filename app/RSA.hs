module RSA where

import System.Random

-- Funcion que da los primeros n primos 
-- con el metodo de Eratosthenes.
primos:: Integer -> [Integer]
primos n = sieve [2..n] where
    -- Agregamos todos los numeros que no sean multiplos de un primo
    sieve [] = []
    sieve (x:xs) = x : sieve (filter (\y -> y `mod` x /= 0) xs) 

-- Funcion para obtener dos elementos aleatorios y diferentes de una lista
elementoAleatorio :: [Integer] -> StdGen -> (Integer, [Integer], StdGen)
elementoAleatorio lista gen = (elemento, actualizada, gen1) where
    n = length lista
    (i, gen1) = randomR (0, n-1) gen         -- Indice aleaotorio
    elemento = lista !! i                    -- Elemento en el indice aleatorio
    actualizada = filter (/= elemento) lista -- Lista sin el elemento tomado

