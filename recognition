clc;
clear;
m=0;
count=0;
% 加载降维后的样本和测试矩阵，进行最近邻法识别
TrainProjectedImages=load('F:\模式识别项目\自写\代码\TrainProjectedImages.mat');
TrainProjectedImages=TrainProjectedImages.TrainProjectedImages;%训练数据集（降维后的） *3479
TestProjectedImages=load('F:\模式识别项目\自写\代码\TestProjectedImages.mat');
TestProjectedImages=TestProjectedImages.TestProjectedImages;%测试数据集（降维后的）    *276
[Trainrows,Traincols] = size(TrainProjectedImages);%得到训练集的大小
[Testrows,Testcols] = size(TestProjectedImages);%得到测试集的大小
%将训练图片的名字存到以为矩阵里
img_name_train = [];
img_name_test = [];
file_path_train= 'F:\\模式识别项目\\文件\\muct人脸数据库_项目\\已知类别\\';
img_path_list_train = dir(strcat(file_path_train,'*.jpg'));
img_num_train = length(img_path_list_train);
% for k=1:img_num_train
% 	name2 = img_path_list_train(k).name;
%     img_name_train = [img_name_train,name2];
% end
%将测试图片的名字存到一维矩阵里
file_path_test= 'F:\\模式识别项目\\文件\\muct人脸数据库_项目\\待分类\\';
img_path_list_test = dir(strcat(file_path_test,'*.jpg'));
img_num_test = length(img_path_list_test);

% for g=1:img_num_test
% 	name1= img_path_list_test(g).name;
%     img_name_test = [img_name_test,name1];
% end
%循环，计算每张测试图片与训练图片的距离，找到距离最小的测试图，判断测试图片与训练图片名字是否一致，一致数量加一
for i=1:Testcols
    mImgTestCur = TestProjectedImages(:,i);
    vDisMin = 9999999999999;
    vClassMin = -1;
    for j=1:Traincols
        mImgTrainCur = TrainProjectedImages(:,j);
        mDis = mImgTestCur-mImgTrainCur;
        mDis = mDis.^2;
        vDis = sqrt(sum(mDis));
        if vDis<vDisMin
            vDisMin = vDis;
		    m=j;
        end
    end
%     name1=img_path_list_train(m).name;
%    name1 =name1(2:4);%取名字的第2到4位置的字符
%    name1=str2num(name1);
%     name2=img_path_list_test(i).name;
%      name2 =name2(2:4);
%       name2=str2num(name2);
    flag = strncmp(img_path_list_train(m).name,img_path_list_test(i).name,4);
    if flag ==1
	count=count+1;
    end
       
end

vRatio = count/Testcols*100;
sprintf('正确率:%.1f%%',vRatio)
