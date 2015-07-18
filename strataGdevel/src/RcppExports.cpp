// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// getMaxInt
int getMaxInt(NumericVector x);
RcppExport SEXP strataGdevel_getMaxInt(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    __result = Rcpp::wrap(getMaxInt(x));
    return __result;
END_RCPP
}
// table2D
NumericMatrix table2D(NumericVector x, NumericVector y);
RcppExport SEXP strataGdevel_table2D(SEXP xSEXP, SEXP ySEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    __result = Rcpp::wrap(table2D(x, y));
    return __result;
END_RCPP
}
// rowSumC
NumericVector rowSumC(NumericMatrix x);
RcppExport SEXP strataGdevel_rowSumC(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    __result = Rcpp::wrap(rowSumC(x));
    return __result;
END_RCPP
}
// colSumC
NumericVector colSumC(NumericMatrix x);
RcppExport SEXP strataGdevel_colSumC(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    __result = Rcpp::wrap(colSumC(x));
    return __result;
END_RCPP
}
// outerC
NumericMatrix outerC(NumericVector x, NumericVector y);
RcppExport SEXP strataGdevel_outerC(SEXP xSEXP, SEXP ySEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    __result = Rcpp::wrap(outerC(x, y));
    return __result;
END_RCPP
}
// statChi2_C
double statChi2_C(NumericMatrix loci, NumericVector strata);
RcppExport SEXP strataGdevel_statChi2_C(SEXP lociSEXP, SEXP strataSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type loci(lociSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type strata(strataSEXP);
    __result = Rcpp::wrap(statChi2_C(loci, strata));
    return __result;
END_RCPP
}
