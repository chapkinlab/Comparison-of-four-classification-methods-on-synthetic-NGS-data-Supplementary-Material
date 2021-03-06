function [ER, conf, NPV, PPV, Sensitivity, Specificity, F1]=CPE(tind, yind)
% CPE: Classifier Performance Evaluation
% FEB-27-2019
% tind: target
% yind: predicted output

        TP=length(find(tind==1 & yind==1));
        FP=length(find(tind==2 & yind==1));
        FN=length(find(tind==1 & yind==2));
        TN=length(find(tind==2 & yind==2));
        conf=[TP, FP; FN, TN];
        PPV=TP/(TP+FP);
        NPV=TN/(TN+FN);
        Sensitivity=TP/(TP+FN);
        Specificity=TN/(TN+FP);
        F1=2*TP/(2*TP+FP+FN);

        ER=sum(tind ~= yind)/numel(tind);

end