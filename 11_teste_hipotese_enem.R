# Sabemos que a média do enem é 600 e o desvio padrão é 100
# Dito isso, um cursinho afirma que melhora as notas do enem
# A média dos alunos do cursinho é 618
# Isso é verdade?

# Passos para testar uma hipótese
# 1-) Estruturar hipótese nula
# 2-) Estruturar hipótese alternativa
# 3-) Estruturar distribuição se a hipótese nula for válida
# 4-) Identificar as regiões onde a hipótese nula é aceita ou rejeitada
# 5-) Concluir o teste de significância da hipótese nula

# Veja que só temos a média da amostra
# Vamos construir uma amostra para verificar a hipótese
# A amostra terá média 618 e desvio 100

amostra = rnorm(100) # Pontos da distribuição normal
amostra = (amostra-mean(amostra))/sd(amostra) # Forçando nosa amostra a ter média 0 e desvio 1
amostra = amostra * 100 + 618 # Caracterizando a amostra
mean(amostra)
sd(amostra)

# Agora vamos usar a função nativa do R para teste de hipótese

# Teste unicaudal, veja que a hipótese alternativa nesse caso é que a média da amostra é maior que a da população

t.test(amostra, mu = 600, alternative = "greater")

# Sobre o resultado apresentado pelo comando acima
## t -> Distância do limiar da hipótese nula em unidades de erro padrão (z)
## df -> Grau de liberdade
## p-value -> p-valor, probabilidade da hipótese testada ser ao acaso

# Teste bicaudal, veja que a hipótese alternativa nesse caso é que a média é diferente da do enem

t.test(amostra, mu = 600, alternative = "two.sided")

# Usamos a função nativa do R, agora, vamos fazer esse processo de forma mais manual

# 1) Hipótese nula: mu_curso = mu_não curso

# 2) Hipótese alternativa: mu_curso != mu_não curso

# 3) distrib hipotese nula

ep = 100 / sqrt(100) # Calculando erro padrão das médias
# Escala real    mu=600, EP=sigma/n^0.5=100/100^0.5=10
# Escala EP      0       1                      


# 4-) Verificando regiões de limiar da hipótese

t_critico = qt( c(0.025,0.975) , df=99 )
t_critico # Mostrando os limiares na escala de erro padrão

real_critico = t_critico * ep + 600
real_critico # Mostrando os limiares na escala real

# 5-) Verificando a significância da hipótese nula. 
#     Evidência empírica está na região de aceitação ou rejeição da hipótese nula?

real_observado = 618 # Média amostral
t_observado = (618-600)/10 # Média amostral levada à escala do erro padrão
t_observado

t_observado > min(t_critico) # O t_observado é maior do que o mínimo do intervalo?
t_observado < max(t_critico) # O t_observado é maior do que o mínimo do intervalo?
# Se o nosso t_observado estiver dentro do intervalo nós aceitamos a hipótese nula