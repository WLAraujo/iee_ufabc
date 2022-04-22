# Verificando a acurácia da estimação dos parâmetros mi e sigma^2 populacionais
# através da média e da variáncia amostral

# O objetivo da atividade é verificar que o cálculo da variância amostral com
# divisão por n acaba levando a um viés e por isso a divisão por n-1 é mais acurada

pop = c(rep(1,10000), rep(2,10000), rep(3,10000))

media_pop = sum(pop)/length(pop)

var_pop = sum((pop-media_pop)^2)/length(pop)

tam_amostra = 2


media_amostra = vector()
var_amostra_c_vies = vector()
var_amostra_s_vies = vector()

# Primeira amostra

i=1
amostra = sample(pop, tam_amostra, replace = F) # Amostra sem reposição
media_amostra[i] = sum(amostra)/tam_amostra
var_amostra_c_vies[i] = sum((amostra-media_amostra[i])^2)/tam_amostra
var_amostra_s_vies[i] = sum((amostra-media_amostra[i])^2)/(tam_amostra-1)

# Outras amostras

for(i in 2:10000){
  amostra = sample(pop, tam_amostra, replace = F)
  media_amostra[i] = sum(amostra)/tam_amostra
  var_amostra_c_vies[i] = sum((amostra-media_amostra[i])^2)/tam_amostra
  var_amostra_s_vies[i] = sum((amostra-media_amostra[i])^2)/(tam_amostra-1)
}

# Trabalhando com a média das amostras

hist(media_amostra)
mean(media_amostra)
media_pop

# Veja que os valores da média amostral e populacional são bem próximos
# Isso porque a média possui amostral possui boa acurácia

# Analisando variância com viés

hist(var_amostra_c_vies)
mean(var_amostra_c_vies)
var_pop

# A variância com viés se distância muito da variância populacional

# Analisando variância sem viés

hist(var_amostra_s_vies)
mean(var_amostra_s_vies)
var_pop

# Veja como a variância sem viés se aproxima muito mais da variância populacional


