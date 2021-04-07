%file=fopen('c:/users/colin/safeqp/seanmat1');
file=fopen('matglolog');
%file=fopen('c:/users/colin/safeqp/r/failure90');
GLOJOB.C=[];
GLOJOB.gpower=[];
GLOJOB.minRisk=-1;
GLOJOB.maxRisk=-1;
dd=textscan(file, '%s', 'delimiter', '\n' ,'bufSize',10000000);
ll=length(dd{1});
for i=1:ll
    if strcmp(dd{1}{i} , 'n')
        GLOJOB.n=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'm')
        GLOJOB.m=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'tlen')
        GLOJOB.tlen=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'nfac')
        GLOJOB.nfac=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'nabs')
        GLOJOB.nabs=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'mabs')
        GLOJOB.mabs=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'round')
        GLOJOB.round=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'ncomp')
        GLOJOB.ncomp=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'full')
        GLOJOB.Fully_Invested=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'gamma')
        GLOJOB.gamma=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'lambda')
        GLOJOB.lambda=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'gpower')
        GLOJOB.gpower=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'lpower')
        GLOJOB.lpower=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'R')
        GLOJOB.R=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'C')
        GLOJOB.C=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'kappa')
        GLOJOB.kappa=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'basket')
        GLOJOB.basket=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'shortbasket')
        GLOJOB.shortbasket=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'longbasket')
        GLOJOB.longbasket=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'trades')
        GLOJOB.trades=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'revise')
        GLOJOB.revise=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'costs')
        GLOJOB.costs=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'delta')
        GLOJOB.delta=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'ls')
        GLOJOB.ls=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'value')
        GLOJOB.LSValueU=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'LSValue')
        GLOJOB.LSValue=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'LSValuel')
        GLOJOB.LSValuel=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'valuel')
        GLOJOB.LSValueL=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'mintrade')
        GLOJOB.mintrade=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'Rmin')
        GLOJOB.Rmin=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'Rmax')
        GLOJOB.Rmax=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'minRisk')
        GLOJOB.minRisk=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'maxRisk')
        GLOJOB.maxRisk=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'min_holding')
        GLOJOB.min_holding=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'min_trade')
        GLOJOB.min_trade=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'npiece')
        GLOJOB.npiece=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'log')
        GLOJOB.log=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'DATA')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        GLOJOB.DATA=da{1};
    elseif strcmp(dd{1}{i} , 'alpha')
        if isempty(dd{1}{i+1})
            GLOJOB.alpha=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.alpha=da{1};
        end
    elseif strcmp(dd{1}{i} , 'A')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        GLOJOB.A=da{1};
    elseif strcmp(dd{1}{i} , 'Q')
        if isempty(dd{1}{i+1})
            GLOJOB.Q=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.Q=da{1};
        end
    elseif strcmp(dd{1}{i} , 'L')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        GLOJOB.L=da{1};
    elseif strcmp(dd{1}{i} , 'U')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        GLOJOB.U=da{1};
    elseif strcmp(dd{1}{i} , 'FC')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        GLOJOB.FC=da{1}';
    elseif strcmp(dd{1}{i} , 'SV')
        if isempty(dd{1}{i+1})
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.SV=da{1};
        end
    elseif strcmp(dd{1}{i} , 'FL')
        if isempty(dd{1}{i+1})
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.FL=da{1};
        end
    elseif strcmp(dd{1}{i} , 'initial')
        if isempty(dd{1}{i+1})
            GLOJOB.initial=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.initial=da{1};
        end
    elseif strcmp(dd{1}{i} , 'bench')
        if isempty(dd{1}{i+1})
            GLOJOB.benchmark=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.benchmark=da{1};
        end
    elseif strcmp(dd{1}{i} , 'min_lot')
        if isempty(dd{1}{i+1})
            GLOJOB.min_lot=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.min_lot=da{1};
        end
    elseif strcmp(dd{1}{i} , 'size_lot')
        if isempty(dd{1}{i+1})
            GLOJOB.size_lot=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.size_lot=da{1};
        end
    elseif strcmp(dd{1}{i} , 'Composites')
        if isempty(dd{1}{i+1})
            GLOJOB.Composite=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.Composite=da{1};
        end
    elseif strcmp(dd{1}{i} , 'names')
        if isempty(dd{1}{i+1})
            GLOJOB.names=[];
        else
            da=textscan(dd{1}{i+1},'%s','delimiter', ' ','bufSize',10000000);
            GLOJOB.names=da{1};
        end
    elseif strcmp(dd{1}{i} , 'hpiece')
        if isempty(dd{1}{i+1})
            GLOJOB.hpiece=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.hpiece=da{1};
        end
    elseif strcmp(dd{1}{i} , 'pgrad')
        if isempty(dd{1}{i+1})
            GLOJOB.pgrad=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.pgrad=da{1};
        end
    elseif strcmp(dd{1}{i} , 'buy')
        if isempty(dd{1}{i+1})
            GLOJOB.buy=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.buy=da{1};
        end
    elseif strcmp(dd{1}{i} , 'sell')
        if isempty(dd{1}{i+1})
            GLOJOB.sell=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.sell=da{1};
        end
    elseif strcmp(dd{1}{i} , 'Abs_A')
        if isempty(dd{1}{i+1})
            GLOJOB.Abs_A=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.Abs_A=da{1};
        end
    elseif strcmp(dd{1}{i} , 'I_A')
        if isempty(dd{1}{i+1})
            GLOJOB.I_A=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.I_A=da{1};
        end
    elseif strcmp(dd{1}{i} , 'Abs_U')
        if isempty(dd{1}{i+1})
            GLOJOB.Abs_U=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.Abs_U=da{1};
        end
    elseif strcmp(dd{1}{i} , 'mask')
        if isempty(dd{1}{i+1})
            GLOJOB.mask=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.mask=da{1};
        end
    elseif strcmp(dd{1}{i} , 'Abs_L')
        if isempty(dd{1}{i+1})
            GLOJOB.Abs_L=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.Abs_L=da{1};
        end
    elseif strcmp(dd{1}{i} , 'five')
        GLOJOB.five=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'ten')
        GLOJOB.ten=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'forty')
        GLOJOB.forty=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'issues')
        if isempty(dd{1}{i+1})
            GLOJOB.issues=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            GLOJOB.issues=da{1};
        end
    end
end

fclose('all');
GLOJOB.A=reshape(GLOJOB.A,GLOJOB.m,GLOJOB.n);
GLOJOB.DATA=reshape(GLOJOB.DATA,GLOJOB.tlen,GLOJOB.n);
if GLOJOB.nfac>-1
    if notisempty(GLOJOB.FL)
        GLOJOB.FL=reshape(GLOJOB.FL,GLOJOB.n,GLOJOB.nfac);
        GLOJOB.Q=[];
    end
else
    GLOJOB.FL=[];
    GLOJOB.SV=[];
    GLOJOB.FC=[];
end
GLOJOB.logfile='s:/matGLOlog';

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


save -mat7-binary GLOJOB.mat