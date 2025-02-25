
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Codebook = SCMA
% Overloading Ratio = 150%
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
RB = 60; 

%Number of active devices (change for simulations)
Ad = 3;

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

x1  = 1;
x2  = exp(1i*(2*pi)/24);
x3  = exp(1i*(4*pi)/24);
x4  = exp(1i*(6*pi)/24);
x5  = exp(1i*(8*pi)/24);
x6  = exp(1i*(10*pi)/24);

Ze = [0 0 0 0];

t1 = exp(1i*1*pi/16);
t2 = exp(1i*2*pi/16);
t3 = exp(1i*3*pi/16);


Mc = [3*(1+1i) 1*(1+1i) -1*(1+1i) -3*(1+1i);
  -1*(1+1i)*t1 3*(1+1i)*t1 -3*(1+1i)*t1 1*(1+1i)*t1;
  3*(1+1i)*t2 1*(1+1i)*t2 -1*(1+1i)*t2 -3*(1+1i)*t2;
  -1*(1+1i)*t3 3*(1+1i)*t3 -3*(1+1i)*t3 1*(1+1i)*t3];


CD = [x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(1,:)	x2*Mc(1,:)	x3*Mc(1,:)	x4*Mc(1,:)	x5*Mc(1,:)	x6*Mc(1,:)
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze
x5*Mc(2,:)	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)
Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	x5*Mc(2,:)	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze
Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	x1*Mc(2,:)	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	x5*Mc(2,:)	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	x3*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	Ze	Ze	Ze	Ze	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(2,:)	x2*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	x5*Mc(2,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(2,:)	Ze
x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	x3*Mc(3,:)	x4*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	x1*Mc(3,:)	Ze	x2*Mc(3,:)	Ze	x5*Mc(3,:)	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	x4*Mc(3,:)	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(3,:)	x1*Mc(3,:)	x5*Mc(3,:)	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(3,:)	Ze	Ze	Ze	Ze	x4*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(3,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(3,:)	Ze	Ze	Ze	Ze	Ze
Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(4,:)	x1*Mc(4,:)	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	x4*Mc(4,:)	x3*Mc(4,:)	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	x4*Mc(4,:)	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze
x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	x6*Mc(4,:)	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	x4*Mc(4,:)	x2*Mc(4,:)	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x3*Mc(4,:)	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze
Ze	Ze	Ze	Ze	x1*Mc(4,:)	Ze	Ze	Ze	Ze	x3*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x5*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x6*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x2*Mc(4,:)	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	Ze	x4*Mc(4,:)	Ze	Ze	Ze	Ze
];


%Code Books generation
for n =1:90
    CB(:,:,n) = [CD(:,((4*n)-3):(4*n))];
end 

%% Active devices selection (Choose based on the activity level) 

%General case 
%R = nchoosek(1:K,Ad);

%When the combinations are higher 
AR = nchoosek(1:K,Ad);
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

