#' @title Coincedente Mutation: Separe os itens nas regras para gerar uma matriz
#'
#' @description Função recebe um dataframe de coincedente \code{ruleDataFrameTB},
#' separe os itens nas regras do coincedente e gerar uma matriz de tal forma que
#' cada item virar uma coluna da matriz.
#'
#' @param \code{ruleDataFrameTB}
#'
#' @return Retornar uma matriz em dataframe \code{matrizCoincedente}.
#' @export


mutateFilesTBDR <- function(dataFrameTB){

  coincedente <- as.data.frame(dataFrameTB)
  df <- select(coincedente,a, LHSandRHS)

  dfMutated <- df %>% mutate(id =  row_number(), flg = 1) %>%
    separate_rows(LHSandRHS, sep = ",") %>%
    spread(LHSandRHS, flg)

  dfMutated$a=NULL
  a <- select(coincedente, Desfechos:support.y)
  matrizCoincedente <- cbind(dfMutated, a)

  return(matrizCoincedente)

}
