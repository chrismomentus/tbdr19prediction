#' @title Apriori: Uma regra de associação aplicado á base em TBDR
#'
#' @description Função aplica Apriori na base \code{dataFrameTB}
#'  e setar o Seed \code{seedValue} para reproduzir a partição.
#'
#' @param \code{dataFrameTB} e \code{seedValue}
#'
#' @return Retornar um dataframe \code{dataFrameTB} de regras (Apriori aplicado)
#' @export

#library(arules)

AprioriTBDR <- function(dataFrameTB, seedValue, sup, con){
  set.seed(seedValue)
  trans_treino <- as(dataFrameTB, "transactions")
  reg_treino <- apriori(data = trans_treino,
                        parameter = list(supp = sup, conf = con),
                        appearance = list(rhs=c("encerra2=0","encerra2=1", "encerra2=2","encerra2=3"), default = "lhs"),
                        control = list(verbose=F))
  return(reg_treino)
}
