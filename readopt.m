file=fopen('matlog');
dd=textscan(file, '%s', 'delimiter', '\n' ,'bufSize',10000000);
ll=length(dd{1});
for i=1:ll
    if strcmp(dd{1}{i} , 'n')
        COR.n=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'm')
        COR.m=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'nfac')
        COR.nfac=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'nabs')
        COR.nabs=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'mabs')
        COR.mabs=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'round')
        COR.round=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'ncomp')
        COR.ncomp=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'full')
        COR.full=sscanf(dd{1}{i+1},'%d');
    elseif strcmp(dd{1}{i} , 'gamma')
        COR.gamma=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'kappa')
        COR.kappa=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'basket')
        COR.basket=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'tradenum')
        COR.trades=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'revise')
        COR.revise=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'costs')
        COR.costs=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'delta')
        COR.delta=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'ls')
        COR.ls=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'value')
        COR.LSValueU=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'valuel')
        COR.LSValueL=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'mintrade')
        COR.mintrade=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'rmin')
        COR.Rmin=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'rmax')
        COR.Rmax=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'minRisk')
        COR.minRisk=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'maxRisk')
        COR.maxRisk=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'min_holding')
        COR.min_holding=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'min_trade')
        COR.min_trade=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'npiece')
        COR.npiece=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'log')
        COR.log=sscanf(dd{1}{i+1},'%f');
    elseif strcmp(dd{1}{i} , 'alpha')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        COR.alpha=da{1};
    elseif strcmp(dd{1}{i} , 'A')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        COR.A=da{1};
    elseif strcmp(dd{1}{i} , 'Q')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        COR.Q=da{1};
    elseif strcmp(dd{1}{i} , 'L')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        COR.L=da{1};
    elseif strcmp(dd{1}{i} , 'U')
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        COR.U=da{1};
    elseif strcmp(dd{1}{i} , 'FC')
        if isempty(dd{1}{i+1})
            COR.FC=[];
        else
        da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
        COR.FC=da{1}';
        end
    elseif strcmp(dd{1}{i} , 'SV')
        if isempty(dd{1}{i+1})
            COR.SV=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.SV=da{1};
        end
    elseif strcmp(dd{1}{i} , 'FL')
        if isempty(dd{1}{i+1})
            COR.FL=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.FL=da{1};
        end
    elseif strcmp(dd{1}{i} , 'initial')
        if isempty(dd{1}{i+1})
            COR.initial=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.initial=da{1};
        end
    elseif strcmp(dd{1}{i} , 'bench')
        if isempty(dd{1}{i+1})
            COR.benchmark=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.benchmark=da{1};
        end
    elseif strcmp(dd{1}{i} , 'min_lot')
        if isempty(dd{1}{i+1})
            COR.min_lot=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.min_lot=da{1};
        end
    elseif strcmp(dd{1}{i} , 'size_lot')
        if isempty(dd{1}{i+1})
            COR.size_lot=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.size_lot=da{1};
        end
    elseif strcmp(dd{1}{i} , 'Composites')
        if isempty(dd{1}{i+1})
            COR.Composite=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.Composite=da{1};
        end
    elseif strcmp(dd{1}{i} , 'names')
        if isempty(dd{1}{i+1})
            COR.names=[];
        else
            da=textscan(dd{1}{i+1},'%s','delimiter', ' ','bufSize',10000000);
            COR.names=da{1};
        end
    elseif strcmp(dd{1}{i} , 'hpiece')
        if isempty(dd{1}{i+1})
            COR.hpiece=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.hpiece=da{1};
        end
    elseif strcmp(dd{1}{i} , 'pgrad')
        if isempty(dd{1}{i+1})
            COR.pgrad=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.pgrad=da{1};
        end
    elseif strcmp(dd{1}{i} , 'buy')
        if isempty(dd{1}{i+1})
            COR.buy=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.buy=da{1};
        end
    elseif strcmp(dd{1}{i} , 'sell')
        if isempty(dd{1}{i+1})
            COR.sell=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.sell=da{1};
        end
    elseif strcmp(dd{1}{i} , 'A_abs')
        if isempty(dd{1}{i+1})
            COR.Abs_A=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.Abs_A=da{1};
        end
    elseif strcmp(dd{1}{i} , 'I_A')
        if isempty(dd{1}{i+1})
            COR.I_A=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.I_A=da{1};
        end
    elseif strcmp(dd{1}{i} , 'Abs_U')
        if isempty(dd{1}{i+1})
            COR.Abs_U=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.Abs_U=da{1};
        end
    elseif strcmp(dd{1}{i} , 'mask')
        if isempty(dd{1}{i+1})
            COR.mask=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.mask=da{1};
        end
    elseif strcmp(dd{1}{i} , 'Abs_L')
        if isempty(dd{1}{i+1})
            COR.Abs_L=[];
        else
            da=textscan(dd{1}{i+1},'%f','delimiter', ' ','bufSize',10000000);
            COR.Abs_L=da{1};
        end
    end
end

fclose('all');
COR.A=reshape(COR.A,COR.m,COR.n);
if COR.nfac>-1 
    if isfield(COR,'FL')
        if isempty(COR.FL)
        else
        COR.FL=reshape(COR.FL,COR.n,COR.nfac);
        end
    else
        COR.FL=[];
        COR.SV=[];
        COR.FC=[];
    end
else
    COR.FL=[];
    COR.SV=[];
    COR.FC=[];
end
if COR.npiece>0
    COR.pgrad=reshape(COR.pgrad,COR.npiece,COR.n);
    COR.hpiece=reshape(COR.hpiece,COR.npiece,COR.n);
end
COR.logfile='s:/matlog';
COR.downrisk=0;
COR.downfactor=3;
COR.longbasket=-1;
COR.shortbasket=-1;
COR.tradebuy=-1;
COR.tradesell=-1;
COR.zetaS=1;
COR.zetaF=1;
COR.ShortCostScale=1;

COR.ogamma=1111111.0;
COR.log=2;

if COR.nfac==-1
    Q=COR.Q;
else
    Q=[];
end
[COR.ret COR.w COR.shake COR.ogamma]=Optimise_internalCVPAFbl(COR.n,COR.nfac,COR.names,COR.m,COR.A,COR.L,COR.U,COR.alpha,COR.benchmark,Q,...
    COR.gamma,COR.initial,COR.delta,COR.buy,COR.sell,COR.kappa,COR.basket,COR.trades,COR.revise,COR.costs,COR.min_holding,...
    COR.min_trade,COR.ls,COR.full,COR.Rmin,COR.Rmax,COR.round,COR.min_lot,COR.size_lot,COR.ncomp,COR.Composite,COR.LSValueU,...
    COR.npiece,COR.hpiece,COR.pgrad,COR.nabs,COR.Abs_A,COR.mabs,COR.I_A,COR.Abs_U,COR.FC,COR.FL,COR.SV,COR.minRisk,COR.maxRisk,...
    COR.mask,COR.log,COR.logfile,COR.downrisk,COR.downfactor,COR.longbasket,COR.shortbasket,COR.tradebuy,COR.tradesell,...
    COR.zetaS,COR.zetaF,COR.ShortCostScale,COR.LSValueL,COR.Abs_L);

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
save -mat7-binary COR.mat
