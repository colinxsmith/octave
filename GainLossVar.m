load GLOJOB.mat
if isempty(GLOJOB.C) || isempty(GLOJOB.gpower)
    [errorcode w gammaback]=MVLOptimiseR(GLOJOB.n,GLOJOB.nfac,GLOJOB.names,GLOJOB.tlen,GLOJOB.DATA,GLOJOB.R,GLOJOB.lambda,GLOJOB.lpower,GLOJOB.m,...
        GLOJOB.A,GLOJOB.L,GLOJOB.U,GLOJOB.alpha,GLOJOB.benchmark,GLOJOB.Q,GLOJOB.gamma,GLOJOB.initial,GLOJOB.delta,GLOJOB.basket,GLOJOB.trades,GLOJOB.revise,...
        GLOJOB.min_holding,GLOJOB.min_trade,GLOJOB.ls,GLOJOB.Fully_Invested,GLOJOB.Rmin,GLOJOB.Rmax,GLOJOB.LSValue,GLOJOB.nabs,GLOJOB.Abs_A,GLOJOB.mabs,...
        GLOJOB.I_A,GLOJOB.Abs_U,GLOJOB.FC,GLOJOB.FL,GLOJOB.SV,GLOJOB.mask,GLOJOB.log,GLOJOB.logfile,GLOJOB.longbasket,GLOJOB.shortbasket,GLOJOB.LSValuel,...
        GLOJOB.Abs_L,GLOJOB.minRisk,GLOJOB.maxRisk,GLOJOB.five,GLOJOB.ten,GLOJOB.forty,GLOJOB.issues);
    GLOJOB.gpower=1;
else
    [errorcode w gammaback]=GLOptimiseR(GLOJOB.n,GLOJOB.nfac,GLOJOB.names,GLOJOB.tlen,GLOJOB.DATA,GLOJOB.R,GLOJOB.C,GLOJOB.lambda,GLOJOB.gpower,GLOJOB.lpower,GLOJOB.m,...
        GLOJOB.A,GLOJOB.L,GLOJOB.U,GLOJOB.alpha,GLOJOB.benchmark,GLOJOB.Q,GLOJOB.gamma,GLOJOB.initial,GLOJOB.delta,GLOJOB.basket,GLOJOB.trades,GLOJOB.revise,...
        GLOJOB.min_holding,GLOJOB.min_trade,GLOJOB.ls,GLOJOB.Fully_Invested,GLOJOB.Rmin,GLOJOB.Rmax,GLOJOB.LSValue,GLOJOB.nabs,GLOJOB.Abs_A,GLOJOB.mabs,...
        GLOJOB.I_A,GLOJOB.Abs_U,GLOJOB.FC,GLOJOB.FL,GLOJOB.SV,GLOJOB.mask,GLOJOB.log,GLOJOB.logfile,GLOJOB.longbasket,GLOJOB.shortbasket,GLOJOB.LSValuel,...
        GLOJOB.Abs_L,GLOJOB.minRisk,GLOJOB.maxRisk,GLOJOB.five,GLOJOB.ten,GLOJOB.forty,GLOJOB.issues);
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
if isempty(GLOJOB.Q) && GLOJOB.nfac==-1
    [GLOJOB.Q GLOJOB.alpha]=GLO_internal_model(GLOJOB.n,GLOJOB.tlen,GLOJOB.DATA);
end
[arisk risk Rrisk brisk pbeta]=Get_RisksC(GLOJOB.n,GLOJOB.nfac,GLOJOB.Q,w,GLOJOB.benchmark,ncomp,Composite);
disp(sprintf('Absolute risk %20.8e, relative risk  %20.8e',arisk,risk));
GLOJOB.w=w
