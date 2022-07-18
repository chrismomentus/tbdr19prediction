#' @title Regras Validas: Prepare as regras e separe por metricas e desfechos
#'
#' @description Função recebe um conjunto de regras \code{ruleDataFrameTB} logo
#' apos a aplicação do apriori, eliminação de '{' e '}', criar as colunas na ordem de
#' ("Regras", "count", "lift","confidence", "support","Desfechos")
#'
#' @param \code{ruleDataFrameTB}
#'
#' @return Retornar um dataframe \code{data_rules} de regras, metricas e desfechos.
#' @export

prepararRegrasValidas <- function(ruleDataFrameTB){
  h <- length(ruleDataFrameTB)
  lab_rules <- labels(ruleDataFrameTB)
  lhs_rules = unlist(strsplit(lab_rules,"=> "))[seq(1,2*h,by=2)]#extrai os items do lhs das regras
  rhs_rules = unlist(strsplit(lab_rules,"=> "))[seq(2,2*h,by=2)]#extrai os items do rhs das regras

  qual_rules <- cbind.data.frame(ruleDataFrameTB@quality$count, ruleDataFrameTB@quality$lift,
                                 ruleDataFrameTB@quality$confidence,ruleDataFrameTB@quality$support)

  res2 = gsub("{", "", lhs_rules, fixed = TRUE) #expressao regular pra eliminar "{LHS}"
  reg_lhs <-  as.data.frame( gsub("}", "", res2, fixed = TRUE))

  res3 = gsub("{", "", rhs_rules, fixed = TRUE)#expressao regular pra eliminar "{RHS}"
  reg_rhs <- as.data.frame(gsub("}", "", res3, fixed = TRUE))

  data_rules <- cbind.data.frame( reg_lhs, qual_rules, reg_rhs)
  data_rules <- data_rules[-c(1:109),]
  colnames(data_rules) <- c("Regras", "count", "lift","confidence", "support","Desfechos")
  data_rules$LHSandRHS = paste(data_rules$Regras, data_rules$Desfechos, sep = " ")
  return(data_rules)
}
