# Intenção de voto - 2897 entrevistados
# Covas - 23
# Boulos - 14
# França - 8
# Russomano - 6
# A margem de erro máxima da pesquisa é de 2 pontos
# O nível de confiança é 95%

# Vamos calcular o intervalo de confiança para os valores do Covas

rm(list = ls())

n = 2897

prob = 0.23

desvio = sqrt(prob*(1-prob)) # Fórmula de desvio da proporção

t = qt(c(0.025, 0.975), df = n-1) # Obtendo o valor de t

erro_padrao = desvio / sqrt(n)

IC95 = prob + t * erro_padrao

## Calculando a margem de erro a partir do intervalo de confiança

IC95 - prob # A margem de erro deu um pouco normal, lembrando que para cada candidato temos um teste

# Fizemos o processo de maneira bem manual, também podemos fazer ele usando uma função do r

## Criando amostra

amostra = c(rep(1,prob*n), rep(0, (1-prob)*n))

## Usando t.test

t.test(amostra)