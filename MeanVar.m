load COR.mat
[
    COR.ret ... Return Code; test this with Return_Message()
    COR.w ... Optimal weights
    COR.shake ... returns -1 for each asset whose weight is correctly rounded
    COR.ogamma ... the gamma used to get the correct risk
] = Optimise_internalCVPAFbl(
    COR.n, ... Number of assets
    COR.nfac, ... Number of factors (-1 for full covariance)
    COR.names, ... Asset Names
    COR.m, ... Number of linear constraints
    COR.A, ... Constraint matrix m by n
    COR.L, ... lower bounds for assets then lower bounds for constraints
    COR.U, ... upper bounds for assets then upper bounds for constraints
    COR.alpha, ... expected returns for assets
    COR.benchmark, ... benchmark weights
    Q, ... the covariance matrix if nfac is -1 (array length n*(n+1)/2; packed symmetric matrix)
    COR.gamma, ... the multiplier for return in the utility function is -gamma/(1-gamma) 
    COR.initial, ... initial portfolio weights
    COR.delta, ... desired turnover (turnover is 0.5 sum|initial-w|
    COR.buy, ... transaction buy costs for each asset (+ve)
    COR.sell, ... transaction sell costs for each asset (+ve)
    COR.kappa,... the multiplier for cost in the utility function is kappa/(1-kappa) if kappa is -1 set kappa to -gamma
    COR.basket, ... maximum desired number of non-zero asset weights
    COR.trades,... maximum desried number of non-zero trades
    COR.revise,... if revise is 1 we're doing a revision optimisation and initial must not be empty 
    COR.costs,... if costs is 0 ignore costs, if costs is 1 include costs, if costs is 2 include costs in  the budget constraint
    COR.min_holding,... smallest non-zero asset weight, empty means don't use
    COR.min_trade,... smallest non-zero trade, empty means don't use
    COR.ls,... if ls is 0 long only, if ls is 1 long short with long defining portfolio value, if ls is 2 long-short defines portfolio value
    COR.full,... if ls>0 upper portfolio value must be met
    COR.Rmin,... if ls>0 minimum short/long
    COR.Rmax,... if ls>0 maximum short/long
    COR.round,... use round lots if round is 1
    COR.min_lot,... lowest lot size for each asset
    COR.size_lot,... subsequent lot size for each asset
    COR.ncomp,... number for assets which are composite
    COR.Composite,... matrix defining composite assets weights for each asset
    COR.LSValueU,... if ls>0 upper bound for portfolio value
    COR.npiece,... if npiece is 1 use piecewise costs
    COR.hpiece,... matrix for x-coordinates for piecewise costs for each asset npiece by n
    COR.pgrad,... matrix piecewise cost gradients for each asset npiece by n
    COR.nabs,... if ls>0 number of absolute constraints
    COR.Abs_A,... if ls>0 absolute constraint matrix for each asset
    COR.mabs,... number of linear constraints in A to be made absolute
    COR.I_A,... integer array of constraint numbers in A to be made absolute
    COR.Abs_U,... upper bounds for absolute constraints (length nabs+mabs)
    COR.FC,... if nfac!=-1 factor covariances array length nfac*(nfac+1)/2 symmtric packed
    COR.FL,... matrix of factor loadings(betas) matrix n by nfac
    COR.SV,... array of specific variances
    COR.minRisk,... if positive minimum desired risk
    COR.maxRisk,... if positive maximum desried risk, gamma is varied to get the desrired risk and optimal gamma is returned in ogamma
    COR.mask,... array length n of 0s and 1s which is applied to initial to enable assets to be excluded from turnover constraint
    COR.log,... control log output
    COR.logfile,... name of logfile
    COR.downrisk,... experimental keep at 0
    COR.downfactor,... experimental keep at 3
    COR.longbasket,... if ls >0 maximum number of positive non-zero weights
    COR.shortbasket,... if ls>0 maximum number of negative non-zero weights
    COR.tradebuy,... maximum number of buys
    COR.tradesell,... maximum number of sells
    COR.zetaS,... experimental set to 1
    COR.zetaF,... experimental set to 1
    COR.ShortCostScale,... scale short costs by this (1 means same as long costs)
    COR.LSValueL,... if ls>0 lower bound for portfolio value
    COR.Abs_L... lower bounds for absolute constraints (length nabs+mabs)
    );

Return_Message(COR.ret)
%Get compressed risk model
if COR.nfac>-1
    if isempty(COR.FL)
    else
    COR.Q=factor_model_process(COR.n,COR.nfac,COR.FL,COR.FC,COR.SV);
    end
end
%Find absolute, relative, residual and benchmark risks and portfolio beta
[COR.arisk COR.risk COR.Rrisk COR.brisk COR.pbeta]=Get_RisksC(COR.n,COR.nfac,COR.Q,COR.w,COR.benchmark,COR.ncomp,COR.Composite);
%Find returns, risks, betas and marginal risk contributions.
%Find total cost, utility, utility gradients, utility per stock and cost
%per stock.
if COR.costs>=0
    [COR.tcost COR.utility COR.gradutility COR.utility_per_stock COR.cost_per_stock]=MarginalUtilityb(COR.n,COR.nfac,COR.names,COR.w,COR.benchmark,COR.initial,COR.Q,COR.ogamma,COR.kappa,COR.npiece,COR.hpiece,COR.pgrad,COR.buy,COR.sell,COR.alpha,COR.ncomp,COR.Composite,COR.ShortCostScale);
end
