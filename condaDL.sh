cd /sw/apps/mc3/latest/rackham/repo/noarch
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/main/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/bioconda/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/conda-forge/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/free/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/r/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/pro/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/main/noarch/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/bioconda/noarch/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/conda-forge/noarch/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/free/noarch/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/r/noarch/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/pro/noarch/
cd ..
mv noarch/repodata.json repodata.json.bak
mv noarch/.index.json .index.json.bak
conda index