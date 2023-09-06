%CLASSIFICADORES ___ SVM

close all
clear all

%load data

data= readmatrix('features_ranking_01.xlsx');

%FEATURES RELEVANTES

x=data(:,1:17);
y=data(:,18);
m=length(y);


%%Dividir o n random em 70% para treino e 30% para teste
vector=[];
for i=1:10
    x=data(:,1:17);
    y=data(:,18);
    P=0.7;           % 70% of the data for the trainning set
    
    idx=randperm(m)
    max(idx)
    X_train=x(idx(1:round(P*m)),:);
    y_train=y(idx(1:round(P*m)),:);

    X_test=x(idx(round(P*m)+1:end),:);
    y_test=y(idx(round(P*m)+1:end),:);


    %% standardização dos dados de treino e teste para features numericas 
    % -> media de cada feature e desvio padrão e aplicar formula xnorm=(x-m)/desvio padrao

  

    %idade
    mediai=mean(X_train(:,1));
    stdi=std(X_train(:,1));
    X_train(:,1) =(X_train(:,1)- mediai)/(stdi);
    X_test(:,1)=(X_test(:,1)-mediai)/(stdi);

    %imc
    mediaimc=mean(X_train(:,3));
    stdimc=std(X_train(:,3));
    X_train(:,3) =(X_train(:,3)- mediaimc)/(stdimc);
    X_test(:,3) =(X_test(:,3)- mediaimc)/(stdimc);
      
    %diferenca
    mediadif=mean(X_train(:,7));
    stddif=std(X_train(:,7));
    X_train(:,7)=(X_train(:,7)-mediadif)/(stddif);
    X_test(:,7)=(X_test(:,7)-mediadif)/(stddif);
      
    %raca
    mediar=mean(X_train(:,14));
    stdr=std(X_train(:,14));
    X_train(:,14)=(X_train(:,4)-mediar)/(stdr);
    X_test(:,14)=(X_test(:,4)-mediar)/(stdr);
  

    %%training set

    for j=2:17
        
        xTreino2=X_train(:,1:j);
        xTest2=X_test(:,1:j);
        
        mdl=fitcsvm(xTreino2,y_train);

        %% avaliação sujeita a teste

        Yp=predict(mdl,xTest2);

        %% matriz confusao
        confusionmat(y_test,Yp)
        tp = sum((Yp== 1) & (y_test == 1));
        fp = sum((Yp == 1) & (y_test == 0));
        tn = sum((Yp == 0) & (y_test == 1));
        fn = sum((Yp == 0) & (y_test == 0)) ;
        sensitivity = tp/(tp + fn)  %TPR
        specificity = tn/(tn + fp)  %TNR
        precision = tp / (tp + fp);
        Recall= tp/(tp + fn);
        Fmeasure= (2*Recall*precision)/(Recall + precision);
        FPR = fp/(tn+fp);

        vector=[vector;[j,sensitivity, specificity, Fmeasure]];
    


    end
    vector(:,1)
    Ms=mean(vector(:,2))
    Me=mean(vector(:,3))
    Mf=mean(vector(:,4))


       
end



for i=2:17
    ix=find(vector(:,1)==i);
    ssM(i-1)=mean(vector(ix,2));
    spM(i-1)=mean(vector(ix,3));
    fmM(i-1)=mean(vector(ix,4));
    ssSD(i-1)=std(vector(ix,2));
    spSD(i-1)=std(vector(ix,3));
    fmSD(i-1)=std(vector(ix,4));
end


errorbar([2:17],ssM,ssSD)
hold on
errorbar([2:17],spM,spSD)