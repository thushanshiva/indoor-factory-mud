%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Codebook = SCMA
% Overloading Ratio = 600%
% SNR = Based on the Measurments 
% Channel Model = BS height 210 cm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Empty workspace and close figures
close all;
clear;
clc

%Number of BSs
L = 1;

%Number of UEs per BS
K = 90;

%Number of RBs
RB = 15; 

%Number of active devices (change for simulations)
Ad = 4;

%Define the range of BS antennas
Mrange = 1; 

%Select the number of channel realizations per combination duing training
%Change based on the data file
nbrOfRealizations = 650; 

%Select the number of channel realizations per combination duing testing
%Change based on the data file
nbrOfRealizationstest = 151; 

%Select the number of testing combinations
nbrOfTesting = 100;

%% Channel Generation (Real data)

% Load the CSV file with complex numbers in a single column
data = readtable('Out_mes_24_Tx_Rx_Mob_3.csv');

% Extract complex numbers as strings
complexStrings = data.filteredData; % Adjust based on your column name


% Reshape the data into a 3D matrix
% Let's assume you want the 3rd dimension to have 10 slices:
% The reshape will be into [row_dimension, column_dimension, slice_dimension]
rows = 1; % For example, 300 rows in each slice
cols = 801;  % For example, 30 columns in each slice
slices = size(complexStrings, 1) / (rows * cols);

if mod(size(complexStrings, 1), (rows * cols)) == 0
    % Reshape into 3D matrix
    H_UL = reshape(complexStrings, [rows, cols, slices]);
else
    error('Data cannot be reshaped into the desired dimensions.');
end

%% CodeBook 

load('codebooks_CB.mat')

CB;

%% Active devices selection (Choose based on the activity level) 

%General case 
%R = nchoosek(1:K,Ad);

%When the combinations are higher 
AR = nchoosek(1:20,Ad);
nrows = 1000;
X = randi(size(AR,1),1,nrows);
R = AR(X,:);

%% Training data generation 

for k = 1:size(R,1) %for each activity combination
    r = R(k,:);
    
    for n = 1:nbrOfRealizations
     Y = zeros(RB,Mrange);
     aa = zeros(1,K);
     for t = 1:Ad
         Y(:,:) = Y(:,:) + CB(:,1,r(t))*H_UL(:,n,r(t)).';
         aa(r(t)) = 1;
         aa(1,:) = aa(1,:);
     end 
     noise = wgn(RB,Mrange,-110,1,'dbm','complex');
     Y = Y(:,:) + noise;
 
       rowDist = ones(1,size(Y.',1));
       Split_Y = mat2cell(Y.',rowDist);
       
       Data_sample = zeros(RB*2,1);
       for u = 1:Mrange
           Data_sample(:,u) = [real(cell2mat(Split_Y(u)))*10^6,imag(cell2mat(Split_Y(u)))*10^6];
       end 
       Data(:,:,n) = Data_sample;
       Ac_devices(:,:,n) = aa;
    end 
       
       Data_Totel(:,:,k) = reshape(Data,[RB*Mrange*2,nbrOfRealizations])';
       Label(:,:,k) = reshape(Ac_devices,[K,nbrOfRealizations])';    
       
      dlmwrite('Training_Data.csv',Data_Totel(:,:,k),'-append');
      dlmwrite('Training_Labels.csv',Label(:,:,k),'-append');       
end     

clear k r n Y aa t noise u Data Ac_devices Data_Totel Label Split_Y rowDist
%% Testing data generation 

for k = 1:nbrOfTesting %for each activity combination
    r = R(k,:);
   % r = randperm (K,Ad);
   %r = randperm (20,Ad);
    
    for n = 1:nbrOfRealizationstest 
     Y = zeros(RB,Mrange);
     aa = zeros(1,K);
     for t = 1:Ad
         Y(:,:) = Y(:,:) + CB(:,1,r(t))*H_UL(:,(nbrOfRealizations+n),r(t)).';
         aa(r(t)) = 1;
         aa(1,:) = aa(1,:);
     end 
     noise = wgn(RB,Mrange,-110,1,'dbm','complex');
     Y = Y(:,:) + noise;
 
       rowDist = ones(1,size(Y.',1));
       Split_Y = mat2cell(Y.',rowDist);
       
       Data_sample = zeros(RB*2,1);
       for u = 1:Mrange
           Data_sample(:,u) = [real(cell2mat(Split_Y(u)))*10^6,imag(cell2mat(Split_Y(u)))*10^6];
       end 
       Data(:,:,n) = Data_sample;
       Ac_devices(:,:,n) = aa;
    end 
       
       Data_Totel(:,:,k) = reshape(Data,[RB*Mrange*2,nbrOfRealizationstest])';
       Label(:,:,k) = reshape(Ac_devices,[K,nbrOfRealizationstest])';    
       
      dlmwrite('Testing_Data.csv',Data_Totel(:,:,k),'-append');
      dlmwrite('Testing_Labels.csv',Label(:,:,k),'-append');   
              
end   




