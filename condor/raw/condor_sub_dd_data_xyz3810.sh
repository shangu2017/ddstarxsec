#!/bin/bash


date

hostname

cd $HOME/bes/kpi/v0.2
source setup.sh 
cd run/condor_samples/data/3810/ 
boss.exe jobOptions_dd_data_xyz3810.pbs

date


