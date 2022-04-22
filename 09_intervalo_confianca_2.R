# A média e desvio padrão de uma mostra de 10 elementos são 8.7 e 2.0
# Qual o IC da média com nível 95%

rm(list=ls())

## Definindo variáveis

n = 10

xbarra = 8.7

s = 2

## Não podemos usar a função t.test, pois as funções nativas do R exigem uma amostra, mas
## nós só temos as estatísticas, não temos as amostras.

## Por isso, nós vamos simular uma amostra usando as estatísticas.

amostra = rnorm(10) # 10 elementos vindos de uma normal com média 0 e desvio 1

## Observe os valores abaixo

mean(amostra)
sd(amostra)

## Vamos forçar essa amostra a ter média 0 e desvio 1 para depois adaptá-la para uma com nossas estatisticas

amostra = (amostra-mean(amostra))/sd(amostra)

## Agora, para obter uma amostra com mesmas estatísticas que do exemplo basta fazer um cálculo simples

amostra = amostra * s + xbarra

mean(amostra)

sd(amostra)

## Agora, conseguimos usar as funções nativas do R para calcular o intervalo de confiança

t.test(amostra)

## Usando bootstrap

## Definindo intervalo de confiança via bootstraping

xbarra_bs = vector()

## Repetindo diversas vezes amostragem

for (b in 1:10000) {
  amostra_bs = sample(amostra,length(amostra), replace = TRUE)
  xbarra_bs[b] = mean(amostra_bs)
}

## Visualizando a distribuição de médias amostrais

hist(xbarra_bs)

## Visualizando os quantis respectivos para 95%

quantile(xbarra_bs, c(0.025, 0.975))

