# Code for "Stability Experiments: The Overlooked Dual of Memory Experiments"

This repository contains the source code used to generate and benchmark circuits for the paper "Stability Experiments: The Overlooked Dual of Memory Experiments".
The circuits implement surface code memory experiments and stability experiments. 

Regenerating the plots in the paper, from scratch, can be done by running these commands
(with the caveat that I used an internal correlated min weight matching decoder, not pymatching):

```bash
# STEP 0: SETUP ENVIRONMENT
# This step heavily depends on your OS and preferences.
# These specific instructions create a python 3.9 virtualenv assuming a debian-like linux.
sudo apt install python3.9-venv
python3 -m venv .venv
source .venv/bin/activate
# Install python dependencies into venv:
pip install -r requirements.txt

# STEP 1: MAKE CIRCUITS.
./step1_make_circuits.sh out/circuits

# Step 2: SAMPLE CIRCUITS.
./step2_circuits_to_stats.sh out/circuits out/stats.csv 4 pymatching

# STEP 3: PLOT RESULTS.
./step3_stats_to_plots.sh out/stats.csv out/plots
```
