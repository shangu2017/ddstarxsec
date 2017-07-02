#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4190/condor_sub_dd_data_xyz4190-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4190/jobOptions_dd_data_xyz4190-*.pbs -f

PBS_4190=${Work_Dir}/run/condor_pbs/data/4190
Sample_4190=${Work_Dir}/run/condor_samples/data/4190
Raw=${Work_Dir}/condor/raw
for num in {1..37}
do
    cp ${Raw}/condor_sub_dd_data_xyz4190.sh ${PBS_4190}/
    mv ${PBS_4190}/condor_sub_dd_data_xyz4190.sh ${PBS_4190}/condor_sub_dd_data_xyz4190-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4190.pbs/jobOptions_dd_data_xyz4190-${num}.pbs/g" ${PBS_4190}/condor_sub_dd_data_xyz4190-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4190.pbs ${Sample_4190}/
    sed -i "5s/data_664p01_xyz4190_10G.txt/data_664p01_xyz4190_10G-${num}.txt/g" ${Sample_4190}/jobOptions_dd_data_xyz4190.pbs
    sed -i "19s/dd_data_xyz4190.root/dd_data_xyz4190-${num}.root/g" ${Sample_4190}/jobOptions_dd_data_xyz4190.pbs
    mv ${Sample_4190}/jobOptions_dd_data_xyz4190.pbs  ${Sample_4190}/jobOptions_dd_data_xyz4190-${num}.pbs
    
    

done
