# Indoor-Factory-MUD-MTC

The measurement data files are as follows, along with the number of measurements:
You can adjust the training and testing sample sizes based on these numbers.

1) Out_mes_24_Tx_Rx_Mob_1: 746
2) Out_mes_24_Tx_Rx_Mob_2: 821
3) Out_mes_24_Tx_Rx_Mob_3: 801
4) Out_mes_24_Tx_Rx_Mob_4: 668
5) Out_mes_24_Tx_Rx_Mob_5: 884
   
The training and testing data generation files are as follows:
1) SCMA codebook with OR = 150%: Main_150
2) SCMA codebook with OR = 300%: Main_300
   
The proposed EDA-Net architectures are as follows:
1) SCMA codebook with OR = 150%: DNN_150
2) SCMA codebook with OR = 300%: DNN_300
   
Comparison with the ResNet model is as follows:
Reference: 
S. Thushan, S. Ali, N. H. Mahmood, N. Rajatheva and M. Latva-Aho, 
"Deep Learning-Based Blind Multiple User Detection for Grant-Free SCMA and MUSA Systems," 
in IEEE Transactions on Machine Learning in Communications and Networking, 
vol. 1, pp. 61-77, 2023, doi: 10.1109/TMLCN.2023.3283350.

1) SCMA codebook with OR = 150%: ResNet_150
2) SCMA codebook with OR = 300%: ResNet_300

Two additional measurement data files with diverse characteristics were collected throughout the entire factory area. 
1) out_mes_23_testMobility.csv: BS height to 2.2 m and the AGV height to 85 cm. Samples were collected from the entire factory. 
2) out_mes_23_testMobility3.csv: BS height to 2.2 m and the AGV height to 15 cm. Samples were collected from the entire factory.
