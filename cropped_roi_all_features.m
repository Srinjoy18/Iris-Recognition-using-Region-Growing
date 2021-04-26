close all
clc
clear all
%progrmme will real all filrs one by one and extract the iris part and area
%of intrest and then features 

% to load all the images from the given folder into an array

folder = 'C:\Users\Pinchu\Dropbox\data set\Diabetic\images of left eye';
filePattern = fullfile(folder, '*.bmp');
f=dir(filePattern);
files={f.name};
for k=1:numel(files)
	fullFileName = fullfile(folder, files{k});
	images_in_arrey{k}=imread(fullFileName);
end
[row,column]=size(files);
feature_vector_allsubjects_roi=[];

%%
%now load the excel file in which center and radius information is given
[A] = xlsread('C:\Users\Pinchu\Dropbox\data set\Diabetic\images of left eye\diabetic subjects details of left eye.xlsx');
[rowxl, columanxl]=size(A);

%%
% loop is to run same code on all images present in the folder
for i=1:column 
 I2= images_in_arrey{1,i};
            %figure, imshow(I2)


%%
%%feature extraction for roi
%2dwt
wname = 'db2';
[CA,CH,CV,CD] = dwt2(roi,wname,'mode','per');
[rdwt,columndwt]=size(CA);
%combination
CACH=CA+CH;
CACV=CA+CV;
CACH=CA+CH;
CACD=CA+CD;
CHCV=CH+CV;
CHCD=CH+CD;
CVCD=CV+CD;
CACHCV=CA+CH+CV;
CACHCD=CA+CH+CD;
CHCVCD=CH+CV+CD;
CACHCVCD=CA+CH+CV+CD;

%features of roi
newroi=uint8(roi);
roistats = graycoprops(newroi); %GLCM properties
roicontrast=roistats.Contrast; % contrast
roicorrelation=roistats.Correlation; %correlation
roienergy=roistats.Energy; %energy
roihomogeneity=roistats.Homogeneity; %homogeneity
roimean=mean2(newroi); % mean intensity
roisd=std2(newroi); % standed deviation
roientropy=entropy(newroi); %entropy
roiintensityhisto=imhist(newroi,5); %intensity histogram 
roiintensityhisto=roiintensityhisto' % converting intensity histogram into row from column
feature_vector_roi=[roicontrast roicorrelation roienergy roihomogeneity roimean roisd roientropy roiintensityhisto];


%features of CA 
newCA=uint8(CA);
CAstats = graycoprops(newCA); %GLCM properties
CAcontrast=CAstats.Contrast; % contrast
CAcorrelation=CAstats.Correlation; %correlation
CAenergy=CAstats.Energy; %energy
CAhomogeneity=CAstats.Homogeneity; %homogeneity
CAmean=mean2(newCA); % mean intensity
CAsd=std2(newCA); % standed deviation
CAentropy=entropy(newCA); %entropy
CAintensityhisto=imhist(newCA,5); %intensity histogram 
CAintensityhisto=CAintensityhisto' % converting intensity histogram into row from column
feature_vector_CA=[CAcontrast CAcorrelation CAenergy CAhomogeneity CAmean CAsd CAentropy CAintensityhisto];


%features of CH
newCH=uint8(CH);
CHstats = graycoprops(newCH); %GLCM properties
CHcontrast=CHstats.Contrast; % contrast
CHcorrelation=CHstats.Correlation; %correlation
CHenergy=CHstats.Energy; %energy
CHhomogeneity=CHstats.Homogeneity; %homogeneity
CHmean=mean2(newCH); % mean intensity
CHsd=std2(newCH); % standed deviation
CHentropy=entropy(newCH); %entropy
CHintensityhisto=imhist(newCH,5); %intensity histogram 
CHintensityhisto=CHintensityhisto' % converting intensity histogram into row from column
feature_vector_CH=[CHcontrast CHcorrelation CHenergy CHhomogeneity CHmean CHsd CHentropy CHintensityhisto];


%features of CV
newCV=uint8(CV);
CVstats = graycoprops(newCV); %GLCM properties
CVcontrast=CVstats.Contrast; % contrast
CVcorrelation=CVstats.Correlation; %correlation
CVenergy=CVstats.Energy; %energy
CVhomogeneity=CVstats.Homogeneity; %homogeneity
CVmean=mean2(newCV); % mean intensity
CVsd=std2(newCV); % standed deviation
CVentropy=entropy(newCV); %entropy
CVintensityhisto=imhist(newCV,5); %intensity histogram 
CVintensityhisto=CVintensityhisto' % converting intensity histogram into row from column
feature_vector_CV=[CVcontrast CVcorrelation CVenergy CVhomogeneity CVmean CVsd CVentropy CVintensityhisto];



%features of CD
newCD=uint8(CD);
CDstats = graycoprops(newCD); %GLCM properties
CDcontrast=CDstats.Contrast; % contrast
CDcorrelation=CDstats.Correlation; %correlation
CDenergy=CDstats.Energy; %energy
CDhomogeneity=CDstats.Homogeneity; %homogeneity
CDmean=mean2(newCD); % mean intensity
CDsd=std2(newCD); % standed deviation
CDentropy=entropy(newCD); %entropy
CDintensityhisto=imhist(newCD,5); %intensity histogram 
CDintensityhisto=CDintensityhisto' % converting intensity histogram into row from column
feature_vector_CD=[CDcontrast CDcorrelation CDenergy CDhomogeneity CDmean CDsd CDentropy CDintensityhisto];

%features of CACH
newCACH=uint8(CACH);
CACHstats = graycoprops(newCACH); %GLCM properties
CACHcontrast=CACHstats.Contrast; % contrast
CACHcorrelation=CACHstats.Correlation; %correlation
CACHenergy=CACHstats.Energy; %energy
CACHhomogeneity=CACHstats.Homogeneity; %homogeneity
CACHmean=mean2(newCACH); % mean intensity
CACHsd=std2(newCACH); % standed deviation
CACHentropy=entropy(newCACH); %entropy
CACHintensityhisto=imhist(newCACH,5); %intensity histogram 
CACHintensityhisto=CACHintensityhisto' % converting intensity histogram into row from column
feature_vector_CACH=[CACHcontrast CACHcorrelation CACHenergy CACHhomogeneity CACHmean CACHsd CACHentropy CACHintensityhisto];

%features of CACV
newCACV=uint8(CACV);
CACVstats = graycoprops(newCACV); %GLCM properties
CACVcontrast=CACVstats.Contrast; % contrast
CACVcorrelation=CACVstats.Correlation; %correlation
CACVenergy=CACVstats.Energy; %energy
CACVhomogeneity=CACVstats.Homogeneity; %homogeneity
CACVmean=mean2(newCACV); % mean intensity
CACVsd=std2(newCACV); % standed deviation
CACVentropy=entropy(newCACV); %entropy
CACVintensityhisto=imhist(newCACV,5); %intensity histogram 
CACVintensityhisto=CACVintensityhisto' % converting intensity histogram into row from column
feature_vector_CACV=[CACVcontrast CACVcorrelation CACVenergy CACVhomogeneity CACVmean CACVsd CACVentropy CACVintensityhisto];

%features of CACD
newCACD=uint8(CACD);
CACDstats = graycoprops(newCACD); %GLCM properties
CACDcontrast=CACDstats.Contrast; % contrast
CACDcorrelation=CACDstats.Correlation; %correlation
CACDenergy=CACDstats.Energy; %energy
CACDhomogeneity=CACDstats.Homogeneity; %homogeneity
CACDmean=mean2(newCACD); % mean intensity
CACDsd=std2(newCACD); % standed deviation
CACDentropy=entropy(newCACD); %entropy
CACDintensityhisto=imhist(newCACD,5); %intensity histogram 
CACDintensityhisto=CACDintensityhisto' % converting intensity histogram into row from column
feature_vector_CACD=[CACDcontrast CACDcorrelation CACDenergy CACDhomogeneity CACDmean CACDsd CACDentropy CACDintensityhisto];


%features of CHCV
newCHCV=uint8(CHCV);
CHCVstats = graycoprops(newCHCV); %GLCM properties
CHCVcontrast=CHCVstats.Contrast; % contrast
CHCVcorrelation=CHCVstats.Correlation; %correlation
CHCVenergy=CHCVstats.Energy; %energy
CHCVhomogeneity=CHCVstats.Homogeneity; %homogeneity
CHCVmean=mean2(newCHCV); % mean intensity
CHCVsd=std2(newCHCV); % standed deviation
CHCVentropy=entropy(newCHCV); %entropy
CHCVintensityhisto=imhist(newCHCV,5); %intensity histogram 
CHCVintensityhisto=CHCVintensityhisto' % converting intensity histogram into row from column
feature_vector_CHCV=[CHCVcontrast CHCVcorrelation CHCVenergy CHCVhomogeneity CHCVmean CHCVsd CHCVentropy CHCVintensityhisto];


%features of CHCD
newCHCD=uint8(CHCD);
CHCDstats = graycoprops(newCHCD); %GLCM properties
CHCDcontrast=CHCDstats.Contrast; % contrast
CHCDcorrelation=CHCDstats.Correlation; %correlation
CHCDenergy=CHCDstats.Energy; %energy
CHCDhomogeneity=CHCDstats.Homogeneity; %homogeneity
CHCDmean=mean2(newCHCD); % mean intensity
CHCDsd=std2(newCHCD); % standed deviation
CHCDentropy=entropy(newCHCD); %entropy
CHCDintensityhisto=imhist(newCHCD,5); %intensity histogram 
CHCDintensityhisto=CHCDintensityhisto' % converting intensity histogram into row from column
feature_vector_CHCD=[CHCDcontrast CHCDcorrelation CHCDenergy CHCDhomogeneity CHCDmean CHCDsd CHCDentropy CHCDintensityhisto];


%features of CVCD
newCVCD=uint8(CVCD);
CVCDstats = graycoprops(newCVCD); %GLCM properties
CVCDcontrast=CVCDstats.Contrast; % contrast
CVCDcorrelation=CVCDstats.Correlation; %correlation
CVCDenergy=CVCDstats.Energy; %energy
CVCDhomogeneity=CVCDstats.Homogeneity; %homogeneity
CVCDmean=mean2(newCVCD); % mean intensity
CVCDsd=std2(newCVCD); % standed deviation
CVCDentropy=entropy(newCVCD); %entropy
CVCDintensityhisto=imhist(newCVCD,5); %intensity histogram 
CVCDintensityhisto=CVCDintensityhisto' % converting intensity histogram into row from column
feature_vector_CVCD=[CVCDcontrast CVCDcorrelation CVCDenergy CVCDhomogeneity CVCDmean CVCDsd CVCDentropy CVCDintensityhisto];

%features of CACHCV
newCACHCV=uint8(CACHCV);
CACHCVstats = graycoprops(newCACHCV); %GLCM properties
CACHCVcontrast=CACHCVstats.Contrast; % contrast
CACHCVcorrelation=CACHCVstats.Correlation; %correlation
CACHCVenergy=CACHCVstats.Energy; %energy
CACHCVhomogeneity=CACHCVstats.Homogeneity; %homogeneity
CACHCVmean=mean2(newCACHCV); % mean intensity
CACHCVsd=std2(newCACHCV); % standed deviation
CACHCVentropy=entropy(newCACHCV); %entropy
CACHCVintensityhisto=imhist(newCACHCV,5); %intensity histogram 
CACHCVintensityhisto=CACHCVintensityhisto' % converting intensity histogram into row from column
feature_vector_CACHCV=[CACHCVcontrast CACHCVcorrelation CACHCVenergy CACHCVhomogeneity CACHCVmean CACHCVsd CACHCVentropy CACHCVintensityhisto];


%features of CACHCD
newCACHCD=uint8(CACHCD);
CACHCDstats = graycoprops(newCACHCD); %GLCM properties
CACHCDcontrast=CACHCDstats.Contrast; % contrast
CACHCDcorrelation=CACHCDstats.Correlation; %correlation
CACHCDenergy=CACHCDstats.Energy; %energy
CACHCDhomogeneity=CACHCDstats.Homogeneity; %homogeneity
CACHCDmean=mean2(newCACHCD); % mean intensity
CACHCDsd=std2(newCACHCD); % standed deviation
CACHCDentropy=entropy(newCACHCD); %entropy
CACHCDintensityhisto=imhist(newCACHCD,5); %intensity histogram 
CACHCDintensityhisto=CACHCDintensityhisto' % converting intensity histogram into row from column
feature_vector_CACHCD=[CACHCDcontrast CACHCDcorrelation CACHCDenergy CACHCDhomogeneity CACHCDmean CACHCDsd CACHCDentropy CACHCDintensityhisto];

%features of CHCVCD
newCHCVCD=uint8(CHCVCD);
CHCVCDstats = graycoprops(newCHCVCD); %GLCM properties
CHCVCDcontrast=CHCVCDstats.Contrast; % contrast
CHCVCDcorrelation=CHCVCDstats.Correlation; %correlation
CHCVCDenergy=CHCVCDstats.Energy; %energy
CHCVCDhomogeneity=CHCVCDstats.Homogeneity; %homogeneity
CHCVCDmean=mean2(newCHCVCD); % mean intensity
CHCVCDsd=std2(newCHCVCD); % standed deviation
CHCVCDentropy=entropy(newCHCVCD); %entropy
CHCVCDintensityhisto=imhist(newCHCVCD,5); %intensity histogram 
CHCVCDintensityhisto=CHCVCDintensityhisto' % converting intensity histogram into row from column
feature_vector_CHCVCD=[CHCVCDcontrast CHCVCDcorrelation CHCVCDenergy CHCVCDhomogeneity CHCVCDmean CHCVCDsd CHCVCDentropy CHCVCDintensityhisto];


%features of CACHCVCD
newCACHCVCD=uint8(CACHCVCD);
CACHCVCDstats = graycoprops(newCACHCVCD); %GLCM properties
CACHCVCDcontrast=CACHCVCDstats.Contrast; % contrast
CACHCVCDcorrelation=CACHCVCDstats.Correlation; %correlation
CACHCVCDenergy=CACHCVCDstats.Energy; %energy
CACHCVCDhomogeneity=CACHCVCDstats.Homogeneity; %homogeneity
CACHCVCDmean=mean2(newCACHCVCD); % mean intensity
CACHCVCDsd=std2(newCACHCVCD); % standed deviation
CACHCVCDentropy=entropy(newCACHCVCD); %entropy
CACHCVCDintensityhisto=imhist(newCACHCVCD,5); %intensity histogram 
CACHCVCDintensityhisto=CACHCVCDintensityhisto' % converting intensity histogram into row from column
feature_vector_CACHCVCD=[CACHCVCDcontrast CACHCVCDcorrelation CACHCVCDenergy CACHCVCDhomogeneity CACHCVCDmean CACHCVCDsd CACHCVCDentropy CACHCVCDintensityhisto];



%% contruction of complete feature vector
feature_vector=[feature_vector_roi feature_vector_CA feature_vector_CH feature_vector_CV feature_vector_CD feature_vector_CACH feature_vector_CACV feature_vector_CACD feature_vector_CHCV feature_vector_CHCD feature_vector_CVCD feature_vector_CACHCV feature_vector_CACHCD feature_vector_CHCVCD feature_vector_CACHCVCD]
feature_vector_allsubjects_roi=[feature_vector_allsubjects_roi; feature_vector]


end