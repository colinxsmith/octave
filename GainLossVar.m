load GLOJOB.mat
if isempty(GLOJOB.C) || isempty(GLOJOB.gpower)
    [
        errorcode   ... Return Code; test this with Return_Message()
        w           ... Optimal weights
        gammaback   ... the gamma used to get the correct risk
        ]=MVLOptimiseR( ... Loss Return Variance utility
            GLOJOB.n, ...Number of assets
            GLOJOB.nfac, ...Number of factors (-1 for full covariance)
            GLOJOB.names, ...Asset Names
            GLOJOB.tlen, ...Number of dates for each asset (must be the same for each asset)
            GLOJOB.DATA, ...Historic return data matrix tlen by n
            GLOJOB.R, ...Target return (Gain is Return-R, Loss is R-Return)
            GLOJOB.lambda, ...strength of mean variance in utility
            GLOJOB.lpower, ...power of Loss in utility (experimental best set it to 1)
            GLOJOB.m, ...Number of linear constraints
            GLOJOB.A, ...Constraint matrix m by n
            GLOJOB.L, ...lower bounds for assets then lower bounds for constraints
            GLOJOB.U, ...upper bounds for assets then upper bounds for constraints
            GLOJOB.alpha, ...expected returns for assets
            GLOJOB.benchmark, ...benchmark weights
            GLOJOB.Q, ...the covariance matrix if nfac is -1 (array length n*(n+1)/2; packed symmetric matrix)
            GLOJOB.gamma, ...the multiplier for return in the mean variance utility function is -gamma/(1-gamma) 
            GLOJOB.initial, ...initial portfolio weights
            GLOJOB.delta, ...desired turnover (turnover is 0.5 sum|initial-w|
            GLOJOB.basket, ...maximum desired number of non-zero asset weights
            GLOJOB.trades, ...maximum desired number of non-zero asset trades
            GLOJOB.revise, ...if revise is 1 we're doing a revision optimisation and initial must not be empty 
            GLOJOB.min_holding, ...smallest non-zero asset weight, empty means don't use
            GLOJOB.min_trade, ...smallest non-zero trade, empty means don't use
            GLOJOB.ls, ...if ls is 0 long only, if ls is 1 long short with long defining portfolio value, if ls is 2 long-short defines portfolio value
            GLOJOB.Fully_Invested, ...if ls>0 upper portfolio value must be met
            GLOJOB.Rmin, ...if ls>0 minimum short/long
            GLOJOB.Rmax, ...if ls>0 maximum short/long
            GLOJOB.LSValue, ...if ls>0 upper bound for portfolio value
            GLOJOB.nabs, ...if ls>0 number of absolute constraints
            GLOJOB.Abs_A, ...if ls>0 absolute constraint matrix for each asset
            GLOJOB.mabs, ...number of linear constraints in A to be made absolute
            GLOJOB.I_A, ...integer array of constraint numbers in A to be made absolute
            GLOJOB.Abs_U, ...upper bounds for absolute constraints (length nabs+mabs)
            GLOJOB.FC, ...if nfac!=-1 factor covariances array length nfac*(nfac+1)/2 symmtric packed
            GLOJOB.FL, ...matrix of factor loadings(betas) matrix n by nfac
            GLOJOB.SV, ...array of specific variances
            GLOJOB.mask, ...array length n of 0s and 1s which is applied to initial to enable assets to be excluded from turnover constraint
            GLOJOB.log, ...control log output
            GLOJOB.logfile, ...name of logfile
            GLOJOB.longbasket, ...if ls >0 maximum number of positive non-zero weights
            GLOJOB.shortbasket, ...if ls>0 maximum number of negative non-zero weights
            GLOJOB.LSValuel, ...if ls>0 lower bound for portfolio value
            GLOJOB.Abs_L, ...lower bounds for absolute constraints (length nabs+mabs)
            GLOJOB.minRisk, ...if positive minimum desired risk
            GLOJOB.maxRisk, ...if positive maximum desired risk
            GLOJOB.five, ...experimental set to -1
            GLOJOB.ten, ...experimental set to -1
            GLOJOB.forty, ...experimental set to -1
            GLOJOB.issues...experimental set to empty
);
    GLOJOB.gpower=1;
else
    [
        errorcode   ... Return Code; test this with Return_Message()
        w           ... Optimal weights
        gammaback   ... the gamma used to get the correct risk
            ]=GLOptimiseR( ... Gain Loss Mean Variance utility
                GLOJOB.n, ...Number of assets
                GLOJOB.nfac, ...Number of factors (-1 for full covariance)
                GLOJOB.names, ...Asset Names
                GLOJOB.tlen, ...Number of dates for each asset (must be the same for each asset)
                GLOJOB.DATA, ...Historic return data matrix tlen by n
                GLOJOB.R, ...Target return (Gain is Return-R, Loss is R-Return)
                GLOJOB.C, ...Gain Loss utility is GAIN-C*LOSS
                GLOJOB.lambda, ...strength of mean variance in utility
                GLOJOB.gpower, ...power of Gain in utility (experimental best set it to 1)
                GLOJOB.lpower, ...power of Loss in utility (experimental best set it to 1)
                GLOJOB.m, ...Number of linear constraints
                GLOJOB.A, ...Constraint matrix m by n
                GLOJOB.L, ...lower bounds for assets then lower bounds for constraints
                GLOJOB.U, ...upper bounds for assets then upper bounds for constraints
                GLOJOB.alpha, ...expected returns for assets
                GLOJOB.benchmark, ...benchmark weights
                GLOJOB.Q, ...the covariance matrix if nfac is -1 (array length n*(n+1)/2; packed symmetric matrix)
                GLOJOB.gamma, ...the multiplier for return in the mean variance utility function is -gamma/(1-gamma) 
                GLOJOB.initial, ...initial portfolio weights
                GLOJOB.delta, ...desired turnover (turnover is 0.5 sum|initial-w|
                GLOJOB.basket, ...maximum desired number of non-zero asset weights
                GLOJOB.trades, ...maximum desired number of non-zero asset trades
                GLOJOB.revise, ...if revise is 1 we're doing a revision optimisation and initial must not be empty 
                GLOJOB.min_holding, ...smallest non-zero asset weight, empty means don't use
                GLOJOB.min_trade, ...smallest non-zero trade, empty means don't use
                GLOJOB.ls, ...if ls is 0 long only, if ls is 1 long short with long defining portfolio value, if ls is 2 long-short defines portfolio value
                GLOJOB.Fully_Invested, ...if ls>0 upper portfolio value must be met
                GLOJOB.Rmin, ...if ls>0 minimum short/long
                GLOJOB.Rmax, ...if ls>0 maximum short/long
                GLOJOB.LSValue, ...if ls>0 upper bound for portfolio value
                GLOJOB.nabs, ...if ls>0 number of absolute constraints
                GLOJOB.Abs_A, ...if ls>0 absolute constraint matrix for each asset
                GLOJOB.mabs, ...number of linear constraints in A to be made absolute
                GLOJOB.I_A, ...integer array of constraint numbers in A to be made absolute
                GLOJOB.Abs_U, ...upper bounds for absolute constraints (length nabs+mabs)
                GLOJOB.FC, ...if nfac!=-1 factor covariances array length nfac*(nfac+1)/2 symmtric packed
                GLOJOB.FL, ...matrix of factor loadings(betas) matrix n by nfac
                GLOJOB.SV, ...array of specific variances
                GLOJOB.mask, ...array length n of 0s and 1s which is applied to initial to enable assets to be excluded from turnover constraint
                GLOJOB.log, ...control log output
                GLOJOB.logfile, ...name of logfile
                GLOJOB.longbasket, ...if ls >0 maximum number of positive non-zero weights
                GLOJOB.shortbasket, ...if ls>0 maximum number of negative non-zero weights
                GLOJOB.LSValuel, ...if ls>0 lower bound for portfolio value
                GLOJOB.Abs_L, ...lower bounds for absolute constraints (length nabs+mabs)
                GLOJOB.minRisk, ...if positive minimum desired risk
                GLOJOB.maxRisk, ...if positive maximum desired risk
                GLOJOB.five, ...experimental set to -1
                GLOJOB.ten, ...experimental set to -1
                GLOJOB.forty, ...experimental set to -1
                GLOJOB.issues...experimental set to empty
);
end
disp(sprintf('%s',Return_Message(errorcode)));

[prob Gain Loss MargGain MargLoss]=GLProp(GLOJOB.n,GLOJOB.names,GLOJOB.tlen,GLOJOB.DATA,GLOJOB.R,GLOJOB.gpower,GLOJOB.lpower,w);

disp(sprintf('GAIN          %20.8e, LOSS           %20.8e',Gain,Loss));
disp(sprintf('Probability of hitting target return %20.8e',prob));
if GLOJOB.nfac>-1
    if notisempty(GLOJOB.FC)
        GLOJOB.Q=factor_model_process(GLOJOB.n,GLOJOB.nfac,GLOJOB.FL,GLOJOB.FC,GLOJOB.SV);
    end
end

ncomp=0;
Composite=[];
%Get Covariance matrix and historic alphas if necessary
if isempty(GLOJOB.Q) && GLOJOB.nfac==-1
    [GLOJOB.Q GLOJOB.alpha]=GLO_internal_model(GLOJOB.n,GLOJOB.tlen,GLOJOB.DATA);
end
[arisk risk Rrisk brisk pbeta]=Get_RisksC(GLOJOB.n,GLOJOB.nfac,GLOJOB.Q,w,GLOJOB.benchmark,ncomp,Composite);
disp(sprintf('Absolute risk %20.8e, relative risk  %20.8e',arisk,risk));
