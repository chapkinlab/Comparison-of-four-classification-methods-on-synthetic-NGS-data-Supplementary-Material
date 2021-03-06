clear all, clc

ParentFolder='C:\Users\Ultra\Desktop\BGSIAM20_Experiments\SyntheticDataBGSIAM20';
AllFile=dir(fullfile(ParentFolder,'Test*'));
FolderOnly=AllFile([AllFile.isdir]);
K=3;
hiddenLayerSize=[2,4,8];
rng('default');
rng(1);

tic;
for k=1:length(FolderOnly)
    fprintf('%s\n',fullfile(ParentFolder,FolderOnly(k).name));
    
    data = fullfile(ParentFolder,FolderOnly(k).name,'samples50_n.txt');
    X = importdata(data);
    Label=[repelem(-1,height(X)/2) repelem(1,height(X)/2)];

    TrainFeature=X;
    Train_Label=Label(1,:)';

    for i=1:100
        testdata = fullfile(ParentFolder,FolderOnly(k).name,'complement50_n.txt');
        Z = importdata(testdata);
        class1_ind = randsample(1:length(Z)/2, 150);
        class1 = Z(class1_ind,:);
        class2_ind = randsample(((length(Z)/2)+1):length(Z), 150);
        class2 = Z(class2_ind,:);
        TestFeature=vertcat(class1,class2);
        Test_Label=[repelem(-1,150) repelem(1,150)]';

        [LDAcp, KNNcp, SVMcp, NN]=Classification_Rules(TrainFeature, Train_Label, K, hiddenLayerSize, TestFeature, Test_Label);
    
        output = fullfile(ParentFolder,FolderOnly(k).name,'result50_n.txt');
        fileID = fopen(output,'a+');
        fprintf(fileID,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n', LDAcp.Sensitivity, LDAcp.Specificity, LDAcp.PositivePredictiveValue, LDAcp.ErrorRate, KNNcp.Sensitivity, KNNcp.Specificity, KNNcp.PositivePredictiveValue, KNNcp.ErrorRate, SVMcp.Sensitivity, SVMcp.Specificity, SVMcp.PositivePredictiveValue, SVMcp.ErrorRate, NN.Sensitivity, NN.Specificity, NN.PPV, NN.ER);
        fclose(fileID);
    end
    
    
    data = fullfile(ParentFolder,FolderOnly(k).name,'samples150_n.txt');
    X = importdata(data);
    Label=[repelem(-1,height(X)/2) repelem(1,height(X)/2)];

    TrainFeature=X;
    Train_Label=Label(1,:)';
    
    for i=1:100
        testdata = fullfile(ParentFolder,FolderOnly(k).name,'complement150_n.txt');
        Z = importdata(testdata);
        class1_ind = randsample(1:length(Z)/2, 150);
        class1 = Z(class1_ind,:);
        class2_ind = randsample(((length(Z)/2)+1):length(Z), 150);
        class2 = Z(class2_ind,:);
        TestFeature=vertcat(class1,class2);
        Test_Label=[repelem(-1,150) repelem(1,150)]';

        [LDAcp, KNNcp, SVMcp, NN]=Classification_Rules(TrainFeature, Train_Label, K, hiddenLayerSize, TestFeature, Test_Label);
    
        output = fullfile(ParentFolder,FolderOnly(k).name,'result150_n.txt');
        fileID = fopen(output,'a+');
        fprintf(fileID,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n', LDAcp.Sensitivity, LDAcp.Specificity, LDAcp.PositivePredictiveValue, LDAcp.ErrorRate, KNNcp.Sensitivity, KNNcp.Specificity, KNNcp.PositivePredictiveValue, KNNcp.ErrorRate, SVMcp.Sensitivity, SVMcp.Specificity, SVMcp.PositivePredictiveValue, SVMcp.ErrorRate, NN.Sensitivity, NN.Specificity, NN.PPV, NN.ER);
        fclose(fileID);
    end
    
    
    data = fullfile(ParentFolder,FolderOnly(k).name,'samples300_n.txt');
    X = importdata(data);
    Label=[repelem(-1,height(X)/2) repelem(1,height(X)/2)];

    TrainFeature=X;
    Train_Label=Label(1,:)';
    
    for i=1:100
        testdata = fullfile(ParentFolder,FolderOnly(k).name,'complement300_n.txt');
        Z = importdata(testdata);
        class1_ind = randsample(1:length(Z)/2, 150);
        class1 = Z(class1_ind,:);
        class2_ind = randsample(((length(Z)/2)+1):length(Z), 150);
        class2 = Z(class2_ind,:);
        TestFeature=vertcat(class1,class2);
        Test_Label=[repelem(-1,150) repelem(1,150)]';

        [LDAcp, KNNcp, SVMcp, NN]=Classification_Rules(TrainFeature, Train_Label, K, hiddenLayerSize, TestFeature, Test_Label);
    
        output = fullfile(ParentFolder,FolderOnly(k).name,'result300_n.txt');
        fileID = fopen(output,'a+');
        fprintf(fileID,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n', LDAcp.Sensitivity, LDAcp.Specificity, LDAcp.PositivePredictiveValue, LDAcp.ErrorRate, KNNcp.Sensitivity, KNNcp.Specificity, KNNcp.PositivePredictiveValue, KNNcp.ErrorRate, SVMcp.Sensitivity, SVMcp.Specificity, SVMcp.PositivePredictiveValue, SVMcp.ErrorRate, NN.Sensitivity, NN.Specificity, NN.PPV, NN.ER);
        fclose(fileID);
    end
end
toc;

