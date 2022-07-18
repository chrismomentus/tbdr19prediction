#' @title TBDR data preparation
#'
#' @description função para criar samples de uma base \code{dataFrameTB}
#'  de tamanho \code{sampleSize} de \code{0.0 a 1.0}
#'  e setar o Seed \code{seedValue} para reproduzir a partição
#'
#' @param \code{dataFrameTB} \code{sampleSize} e \code{seedValue}
#'
#' @return Retornar um dataframe de sample \code{dataFrameTB}
#' @export
#'
criarTabelaAmostragem <- function(dataFrameTB, seedValue, sampleSize){
  smp_size <- floor(sampleSize * nrow(dataFrameTB))
  #set.seed(seedValue)
  resultTable <- sample(seq_len(nrow(dataFrameTB)), size = smp_size)
  return(resultTable)
}
