# Image Processing and Data Analysis for Primate rDNA

This repository contains the code and resources used in the 2024 publication on Primate rDNA. The focus of this work is on the analysis and processing of fluorescence microscopy data to ascertain the fraction of total rDNA contained within each specific chromosome.

## Contents

- [Installation](#installation)
- [HG02080](#hg02080)
- [Orangutan](#orangutan)
- [Citation](#citation)

## Installation

1. **Clone the repository:**

```
git clone https://github.com/jouyun/2024_Primate_rDNA.git
```


2. **Create a Conda environment:**

After cloning the repository, navigate to the project directory:

```
cd 2024_Primate_rDNA
conda env create -f environment.yml
```

This will install all necessary dependencies in an isolated environment to avoid conflicts with other projects.


3. **Activate the Conda environment:**

Once the environment is created, activate it using:

```
conda activate 2024_Primate_Napari
```

## HG02080

ConvertRGB.ijm:  Run first in ImageJ on raw .nd2 files in order to convert to RGB for cellpose

Karyotyper_Acrocentric.ipynb:  Does segmentaton of acrocentric chromosomes using a custom cellpose model.  User can verify segmentation and then use FixManualLabeling.ipynb to make adjustments.  Separates these into karyograms.  These Karyograms are then ordered using Show.ijm in ImageJ (order being 13, 14, 15, 21, 22).  Once ordered continue analysis from "Analysis" section to generate plots.

Trainer_Acrocentric.ipynb:  Used for retraining cellpose model

Show.ijm:  Used to order karyograms as an intermediate step to Karyotyper_Acrocentric.ipynb above

## Orangutan and Bornean

Individual steps are broken down.  
1. Run ConvertRGB.ijm in ImageJ to convert to RGB.  
2. A-MakeAcroFromRGB.ipynb to segment acrocentrics 
3. B-FixManualLabeling.ipynb to add any acrocentrics that got missed, 
4. C-MakerDNAFromRGB.ipynb to segment the rDNA regions, 
5. E-ProcessResults.ipynb to combine the two and plot results.

## Citation

How to cite this work in academic publications.

