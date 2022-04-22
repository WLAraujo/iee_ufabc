# Medidas de tendência central

x <- c(101, 109, 109, 113, 187, 187)

# Média

mean(x)

# Mediana

median(x)

# Moda - Não existe função, construir tabela de frequências ou função

table(x)
names(table(x))
names(table(x))[table(x) == max(table(x))]

moda = function(input){
  saida = names(table(input))[table(input) == max(table(input))]
  saida = as.numeric(saida)
  return(saida)
}
moda(x)

# Média com trim

mean(x, trim=0.2)

# Range dos dados

range(x)
max(range(x)) - min(range(x))
diff(range(x))

# Variância

var(x)

# Desvio padrão

sd(x)

# Intervalo interquartil

quantile(x, c(0.25, 0.75))
diff(quantile(x, c(0.25, 0.75)))
