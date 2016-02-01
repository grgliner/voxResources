# voxResources


We have provided you with the data and some initial tools to get you started.

# Data folder 
The data folder consists of 10 folders corresponding to each of the 10 genres in the dataset:

1. Blues
2. Classical
3. Country
4. Disco
5. Hiphop
6. Jazz
7. Metal
8. Pop
9. Reggae
10. Rock

Each folder contains the data for 100 songs from the genre in .mat (Matlab) format.  We have 
provided scipts to load the data into Matlab.  

# Audio Files
The audio files for each song be downloaded from http://opihi.cs.uvic.ca/sound/genres.tar.gz
This file is quite large and may take about 10 minutes to fully download.  Once unpacked, this 
folder is organized exactly the same as the data folder.  

# Data
The data associated with each song is represented as a struct.  Each struct contains the following features:
* stat: [1x1 struct] 
* env: [1198x1 double]
* eng: [1x1198 double]
* mfc: [24x1198 double]
* chroma: [12x1198 double]
* centers: [1x1198 double]
* other: [1x1 struct]
* class: 1

The stat struct contains:
* flux: [1x1198 double]

The other struct contains:
* onsets: [155x1 double]
* keystrength: [12x1198 double]
* brightness: [1x1198 double]
* zerocross: [1x1198 double]
* roughness: [1x1198 double]
* pitches: [5x1198 double]
* inharmonic: [1x1198 double]
* tempo: 124.8970	
* key: 8
* hcdf: [1x1198 double]

GENDATA.mat can be downloaded from https://www.dropbox.com/s/emitp9kxbj7v9hw/GenreData1024n32wlb.mat?dl=0, which is a struct that looks like:

GENDATA = 
- classnames: {1x10 cell}
- class: [1x1000 double]
- mfcc: {1x1000 cell}

and contains the MFCC feature in a form that can be submitted directly to the FV/Exemplar transformation function.



# Tools folder 
We have included some matlab tools to help get started with the data.

* collectfeature.m
	- Extract a feature for all the songs
* demo_fv.m
	- Example use of the Fisher Vector function
* inferqgram.m
	- needed for the exemplar
* loadAll.m
	- Loads files in the data folder into a single structure in Matlab. 
* MAT2CSV.py
	- Writes arrays stored within a .mat file to .csv files

### Note: 
Matlab is avaliable free to all students through OIT.  Go here: http://www.princeton.edu/software/licenses/software/matlab/ for installation instructions.  For any problems with installation, please contact the OIT helpdesk.

### Note: 
mfcc and mfc are used interchangeably 

# Other Resources
To perform the Exemplar and Fisher Vector feature extraction you will need to:

1. Download vlfeat package for MATLAB from http://www.vlfeat.org/download.html
2. Install it in MATLAB using the following instructions: http://www.vlfeat.org/install-matlab.html
3. Refer to demo_fv.m as an example on how to compute Fisher vectors with exemplars
4. To compute FV on an exemplar of size 5+ you will probably need 16GB+ memory  

# Sample workflow

%Change this to the directory containing your data folder

dirn = '/Users/Gazelle/Documents/voxResources';

%import the data

[DAT, LB, FNS] = loadAll(dirn);

%extract the MFCC

mfcc = cell(1,1000);

for i =1:length(DAT)

	mfcc{i} = DAT{i}.mfc; 

end

GENDATA.mfcc = mfcc;

GENDATA.class = LB;

GENDATA.classnames = {'Blues', 'Classical', 'Country', 'Disco', 'Hiphop',...

	'Jazz', 'Metal', 'Pop', 'Reggae', 'Rock'}


%run fisher vector

demo_fv

