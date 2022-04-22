# Exercício: 
# A distribuição de scores de QI populacional é normal com média 100 e desvio 15
# Selecionamenos aleatoriamente 100 indivíduos e avaliamos seus QIs
# Qual é a chance de obtermos a média da amostra 104 ou mais alta?

# Para fazermos isso temos que fazer a distribuição em questão chegar na distribuição padrão

# Calculando o valor de Z = (medida-media)/erro padrão
# Lembrando que erro padrão = desvio/raiz(amostra)

erro_padrao = 15/(100^0.5)

z = (104-100)/erro_padrao

prob_acumulada = pnorm(z)

prob_maior_104 = 1 - prob_acumulada

# prob_maior_104 = 0.0038

# A forma que acabamos de calcular foi usando o Teorema Central do Limite
# Vamos provar que se fizermos muitas amostras a porcentagem delas com média mior que 104 é um valor parecido

# Limpando as variáveis

rm(list=ls())

# Calculando vários pontos na normal do problema

pop = 100 + 15 * rnorm(100000)

# Plotando histograma dessa população

hist(pop, xlim = range(pop), co = 'gray', breaks = seq(min(pop), max(pop), length=100),
     xlab = "QI")

# Pegando 10000 amostras

n = 100

media_amostra = vector()

for (amostragem in 1:10000){
  amostra = sample(pop, n, replace = T)
  media_amostra[amostragem]=mean(amostra)
}

hist(media_amostra, xlim = range(pop), co = 'gray', 
     breaks = seq(min(pop), max(pop), length=100))

# Verificando a probabilidade

media_amostra >= 104

mean(media_amostra >= 104)

# Valores apresentados giram em torno de 0.0039 a 0.0045
