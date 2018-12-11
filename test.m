
TrainProjectedImages=load('F:\模式识别项目\自写\代码\TrainProjectedImages.mat');
TrainProjectedImages=TrainProjectedImages.TrainProjectedImages;%训练数据集（降维后的） 
Eigenfaces=load('F:\模式识别项目\自写\代码\Eigenfaces.mat');
Eigenfaces=Eigenfaces.Eigenfaces;%训练数据集（降维后的） 
% imgTrain=load('D:\Program Files\MATLAB\R2016a\bin\projects\face1\imgTrain.mat');
% imgTrain=imgTrain.imgTrain;%训练数据集（降维后的）
file_path='F:\\模式识别项目\\文件\\muct人脸数据库_项目\\待分类\\';% 图像文件夹路径 
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像
img_num = length(img_path_list);%获取图像总数量
imgTest = [];
Q = [];%列矩阵，一幅图像
testFace = [];%减去训练矩阵均值后的测试图像矩阵
%导入由训练数据集得到的  变换矩阵跟降维后的训练集

% 读取每一幅图像
%转化为灰度图像 并将每一幅图像转化为列向量 然后合并为矩阵T
for j=1:img_num %逐一读取图像
    image_name = img_path_list(j).name;%图像名
    img = imread(strcat(file_path,image_name));              
    img = rgb2gray(img);%转为灰度   
    %img=histeq(img);%直方图均衡化
    img=imadjust(img);%使得图像中 1% 的数据饱和至最低和最高亮度
     img = imresize(img, 0.2, 'nearest');%改变图像的大小，'nearest'（默认值）最近邻插值
    [irow,icol] = size(img);%得到图片大小
%     for m=1:irow
%         for n=1:icol
%             img(m,n) = 10*img(m,n);
%         end
%     end
    temp = reshape(img,irow*icol,1);%将二维图片转为一维向量
    Q = [Q,temp]; % 每张图片的信息做为V的一列  
   
    imgTest = [imgTest,temp];
   
end
%     imgTrain = imgTrain';
%     mMiu = mean(imgTrain,2);%求各行的均值
%     
%     mMiu = repmat(mMiu,1,icol);%复制成原有的行数N列的矩阵
%     testFace =double(imgTest')-mMiu;


TestProjectedImages = [];%测试集降维
for i = 1 : img_num%对于每一个训练特征
    temp = Eigenfaces'*double(Q(:,i));
    TestProjectedImages = [TestProjectedImages temp];  %得到 L_eig_vec;
end
% TsetProjectedImages1=trainFace*double(testFace' );
  save('F:\模式识别项目\自写\代码\TestProjectedImages.mat','TestProjectedImages');
% save('D:\Program Files\MATLAB\R2016a\bin\projects\face\testFace.mat','testFace');
