<a name="top"></a>

[<img width="700px" src="./config/svg/pyPhysChemBanner.svg"/>](#top)

## **2024.07.07 <span style='color:red'>release 1.9.0</span>**
- `ML-1DCNN.ipynb` finalized

## **2024.07.04 unreleased version**
### added
- RDF classification introduced in `ML-1DCNN.ipynb` (RDF profiles created with a in-house `pyNanoMatBuilder` library, still under developmment and not publicly available)
- new variant for the recurrent neural network (RNN) theme: `RNN-RNN_2.ipynb`

## **2024.06.30 unreleased version**
### changed
- previous `ML-1DCNN.ipynb` version renamed as `ML-1DCNN-v0-dev.ipynb` (private version only)

## **2024.06.28 unreleased version**
### added
- `ML-2DCNN.ipynb` updated by **I. C. Gerber**, with the classification of squares/triangles/circles, in relation with the shape of nanoparticles

### changed
- previous `ML-2DCNN.ipynb` version renamed as `ML-2DCNN-v0-dev.ipynb` (private version only)

## **2024.06.19**
### added
- `QCpy-1(FR)-Modele_d-Ising.ipynb` first Jupyter Notebook of the "Quantum Computing with python"
- `QCpy-1(FR)appendix-Modele_d-Ising.ipynb` appendix to this first Jupyter Notebook
- `QCpy-1(FR)correction-Modele_d-Ising.ipynb` correction to this first Jupyter Notebook
- `QCpy-additionalFiles/available_gates.ipynb` list of available quantum gates by default in the myQLM library for python
- `QCpy-additionalFiles/theoryReminderSheets(FR)/Transformation_de_Bogoliubov.pdf` quick course on the Bogoliubov transformation
- `QCpy-additionalFiles/theoryReminderSheets(FR)/Transformation_de_Jordan-Wigner.pdf` quick course on the Jordan-Wigner transformation
- `QCpy-additionalFiles/theoryReminderSheets(FR)/Transformees_de_Fourier_Quantiques.pdf` quick course on different variations of the Quantum Fourier Transform

all notebooks developped by a new co-author, **Matthieu Charnay**, with **I.C. Gerber**

## **2024.06.19**
### added
- `QCpy-1(FR)-Modele_d-Ising.ipynb` first Jupyter Notebook of the "Quantum Computing with python"
- `QCpy-1(FR)appendix-Modele_d-Ising.ipynb` appendix to this first Jupyter Notebook
- `QCpy-1(FR)correction-Modele_d-Ising.ipynb` correction to this first Jupyter Notebook
- `QCpy-additionalFiles/available_gates.ipynb` list of available quantum gates by default in the myQLM library for python
- `QCpy-additionalFiles/theoryReminderSheets(FR)/Transformation_de_Bogoliubov.pdf` quick course on the Bogoliubov transformation
- `QCpy-additionalFiles/theoryReminderSheets(FR)/Transformation_de_Jordan-Wigner.pdf` quick course on the Jordan-Wigner transformation
- `QCpy-additionalFiles/theoryReminderSheets(FR)/Transformees_de_Fourier_Quantiques.pdf` quick course on different variations of the Quantum Fourier Transform
(*all written and added by **Matthieu Charnay***)

## **2024.06.17**
### changed
- MNIST fashion dataset: latent space reduced to 28 instead of 30 (because imgs are 28x28)

## **2024.06.16 <span style='color:red'>release 1.9.0alpha</span>**
### added
- new *Autoencoders applied to SMILES* section in the [ML-autoencoder notebook](./ML-Autoencoders.ipynb) (**co-author**: *Nans Bernard*)
- new *meaning of Morgan fingerprints bits* sub-subsection in `MolecularRepresentations.ipynb`
- `ignoreLargeFiles.sh`, to be run before a `git add --all ` command

## **2024.05.26. unreleased version**
### added
- in-house `pipManagement.py` tool
- last `requirements.txt` files. Such files containing a list of libraries to be installed using pip install, or - even better - using `pipManagement.py`. See also the [pip documentation](https://pip.pypa.io/en/latest/user_guide/#requirements-files) 

### changed
- `ML-1DCNN.ipynb`, `ML-2DCNN.ipynb`, `ML-RNN.ipynb` made available, prior to new updates
- `CHANGE.md` renamed as `ChangeLog.md`, and new structuring with added/changed/fixed subsections

## **2024.02.22. unreleased version**
### added
- discussion about decision boundaries introduced in the [XAI iris4 notebook](./DS4B-Iris4.ipynb)

## **2024.12.02. unreleased version**
### added
- new [Physical Chemistry Problems and Solutions notebook](./PhysChem_ProblemsAndSolutions.ipynb)
  <br>first topic: rotational spectroscopy

## **2024.02.02. unreleased version**
### added
- new explainability topic introduced in a new [iris4 notebook](./DS4B-Iris4.ipynb)

### changed
- TOC changed accordingly

## **2023.12.02. <span style='color:red'>release 1.8.1</span>**
### added
- short exercises and new comments added to the [iris1 notebook](./DS4B-Iris1.ipynb)

### changed
- modification of the [CO2 solubility with ANN notebook](./DS4B-CO2_solubility-ANN.ipynb)
   - one model removed (with full standardization, GC descriptors included)
   - some comments are added to facilitate the self-learning
   - rdkit is now used to display the cations and anions
   - the last part was commented on because of a persistent bug (unimportant part - will be solved later) 

## **2023.12.02. unreleased version** 
### changed
- [Tight binding (TB) notebook](./TB.ipynb) updated with DOS plots (implementation of useful functions to enhance the capabilities of pybinding, including a Monkhorst-Pack mesh to plot DOS)

## **2023.11.28. unreleased version** 
### added
- [development version of an ML-autoencoder notebook (so far, very close to be a copy/paste of one of Aurelien Géron's tutorials)](./ML-Autoencoders.ipynb)

## **2023.11.22. <span style='color:red'>release 1.8.0</span>** 
### changed
- [NMR notebook finalized under the form of a student project](./NMR.ipynb)

## **2023.11.15. Unreleased version**

### changed
- [Tight binding (TB) notebook](./TB.ipynb) completed with graphene

## **2023.11.14. <span style='color:red'>release 1.7.5</span>** 

### changed
- [Tight binding (TB) notebook ](./TB.ipynb) completed with:
    - Peierls distortion of the linear chain of hydrogen atoms
    - 2&times;2 square lattice
    - 2&times;2 rectangular lattice
    - illustrations taken from R. Hoffmann (1991), Solids And Surfaces. A Chemist's View of Bonding in Extended Structures, Wiley-VCH, with &copy; Wiley 1991
 
## **2023.11.13. Unreleased version** 

### added
- new [harmonic oscillator project](Harmonic_Oscillator.ipynb), by **Th. Leininger**, @LCPQ (CNRS-UT3 lab)

## **2023.11.12. <span style='color:red'>release 1.7.4</span>** 

### added
- **new contributor**: I. C. Gerber, @LPCNO (CNRS-UT3-INSA lab)
- new [Tight binding (TB) theme ](./TB.ipynb), adapted from **IC Gerber**'s notebook on this topic
- ML notebooks dev versions still under heavy development and not made available
- [Basics of Artificial Neural Networks (ANNs) for supervised learning notebook](./DS4B-BasicsOfANN.ipynb) is now richly commented, and adapted to self-learning and talktorial format

### changed
- TOC updated

## **2023.11.08. <span style='color:red'>release 1.7.3</span>** 
- new 1.7.3 version released after a careful check that new pyPhysChem rebranding did not introduce major bugs

### added
- [ML-CNN-dev.ipynb notebook renamed as ML-1DCNN-dev.ipynb](ML-1DCNN-dev.ipynb). dev version not uploaded
- new [2D Convolutional Neural Network notebook](ML-2DCNN-dev.ipynb). dev version not uploaded
- new [Autoencoders notebook](ML-Autoencoders-dev). dev version not uploaded
- new [AdvancedPython notebook](AdvancedPython.ipynb). First topic: reshaping NumPy arrays

### changed
- TOC updated
- new BrainHalfHalf style added to the css file

## **2023.10.29. Unreleased version** 

### changed
- project renamed "pyPhysChem" instead of "pytChem"

## **2023.10.26. Unreleased version** 

### added
- new [Convolutional Neural Network notebook](ML-CNN-dev.ipynb). dev version not uploaded
- new [Neural Network notebook: combining regression and classification with Keras](ML-CombineRegressionAndClassification-dev.ipynb). dev version not uploaded

## **2023.10.12. Unreleased version** 

### added
- new [Recurrent Neural Network notebook](ML-RNN-dev.ipynb). dev version not uploaded

## **2023.10.05. <span style='color:red'>release 1.7.1</span>** 

### added
- **new contributor**: F. Jolibois, @LPCNO (CNRS-UT3-INSA lab)
- new [Velocity Verlet project](MD_VVERLET_Student.ipynb) (**author: *Franck Jolibois***)

## **2023.09.29. <span style='color:red'>release 1.7.0</span>** [10.5281/zenodo.8396813](https://doi.org/10.5281/zenodo.8396813)

### changed
- "talktorial" transformation of the ML part
    - pdf support splitted into a couple of pdf files
    - some slides are inserted in notebooks as jpeg images
    - MLChem.pdf updated with new cited studies
- copy of part of the [DS4B-appendix.ipynb](./DS4B-appendix.ipynb) as [DS4B-BasicsOfANN.ipynb](./DS4B-BasicsOfANN.ipynb)

## **2023.09.16. Unreleased version**

### added
- new [python-Computer Algebra System, pCAS, in a nutshell notebook](./pCAS.ipynb)

### changed
- H atom notebook converted into a [Schrödinger model of the Hydrogen atom exercise notebook](HydrogenAtom.ipynb)
 
## **2023.09.01. Unreleased version**

### changed
- [Unsupervised ML applied to the Iris dataset notebook](./DS4B-IrisUML.ipynb) now includes K-means in addition to PCA
- [Molecules notebook renamed MolecularRepresentations.ipynb](./MolecularRepresentations.ipynb)
    - better contextualization of the scripts
    - similarities calculated and plotted
    - fingerprint plots
    - selection of molecules that match a pattern

## **2023.06.22. <span style='color:red'>v1.6.1</span>** [10.5281/zenodo.8069824](https://doi.org/10.5281/zenodo.8069824)

### fixes
- various bug fix

## **2023.05.22. <span style='color:red'>v1.6.0**

### added
- new [Easter Egg notebook](./EasterEgg.ipynb)

### changed
- "Iris3" = [Régression logistique](./DS4B-Iris3.ipynb) is now also available in English (*Supervised Machine Learning applied to classification*)
- "Iris1" Exercise and Solution to exercise is now available in English

## **2023.05.20. <span style='color:red'>v1.5.9</span>**

### changed
- "Iris1" = [Lecture et analyse de la base de données par la librairie pandas](./Exercices-DS4B/DS4B-Iris1-Exercice.ipynb) is now also available in English (*Reading and analyzis of the "iris" database with the pandas library*)
- [Iris1](./DS4B-Iris1.ipynb):
    - default value for `corr()` changed in Pandas version 2.0.0: The default value of `numeric_only` is now `False` => script changed with `dfi.corr(numeric_only=True)`
- "Iris2" = [Statistiques et régression](./DS4B-Iris2.ipynb) is now also available in English (*Statistics and regression*)

## **2023.05.18. Unreleased version**

### added
- new contributor: S. Christodoulou, @LPCNO (CNRS-UT3-INSA lab)
- New [Molecules notebook](./Molecules.ipynb) (in English), mainly based on the ```RDKit``` library and on the ```jupyter_jsmol``` extension
- New [ML-SVR notebook](./DS4B-CO2_solubility-SVR.ipynb) (in English): Prediction of the solubility of CO<sub>2</sub> in ionic liquids with the Support Vector Regression (SVR) method. Illustration of an optimal hyperparameters search (**author: *Stella Christodoulou***)
- New [ML-SVR exercise](./DS4B-Exercices/DS4B-CO2_solubility-SVR-Exercise.ipynb), with the [solution](/DS4B-Exercices/DS4B-CO2_solubility-SVR-ExerciseWithAnswer.ipynb) (**author: *Stella Christodoulou***)

### changed
- The need for the [rdkit](https://www.rdkit.org/) and [jupyter-jsmol](https://pypi.org/project/jupyter-jsmol/) libraries is now indicated in the README.md document

## **2023.01.25. <span style='color:red'>v1.5.0beta2</span>**

### changed
- Install instructions more detailed in [README.md](./README.md) 

## **2023.01.24. <span style='color:red'>v1.5.0beta</span>**

### changed
- ["Python in the Physical Chemistry Lab (PPCL) in a nutshell"](./PPCL.ipynb) project completed, prior to a peer review

## **2023.01.16. <span style='color:red'>v1.5.0alpha</span>**

### added
- New [*Python in the Physical Chemistry Lab (PPCL) in a nutshell* notebook](./PPCL.ipynb) (in English)
- New or modified css classes (ex, app, rq - formerly warn), intro -formerly rq)

## **2022.12.11. Unreleased version**

### added
- New "Puits de potentiel infiniment profond" project (in French, aka "Particle in a box" project)

## **2022.11.29. <span style='color:red'>v1.4.0alpha</span>**

### added
- New release with a decent NMR notebook (although work is still in progress) and of the associated White Paper

### changed
- TOC updated (the Huckel.ipynb and InfiniteSquareWell.ipynb are not yet mentioned)

## **2022.11.27. not released**

### added
- New [*2nd-order NMR* notebook](./NMR.ipynb) (work in progress)

## **2022.11.26. not released**

### added
- New [*Infinite Square Well* notebook](./InfiniteSquareWell.ipynb) (work in progress)
- New [*Huckel* notebook](./Huckel.ipynb) (work in progress)

## **2022.11.06. v1.3.0alpha3**

### added
- New [*Hydrogen atom* notebook](./HydrogenAtom.ipynb) (work in progress)
 
## **2022.11.05. <span style='color:red'>v1.3.0alpha2</span>**

### added
- New [*Equations différentielles* notebook](./DeriveesIntegrales2.ipynb)
    - Requires [sympy module](https://www.sympy.org/en/index.html),as already needed for the [*Dérivées et Intégrales* notebook](./DeriveesIntegrales1.ipynb)
    - Version 0. Strong improvements are needed as well as the implementation of numerical solution of ODE

## **2022.11.02. <span style='color:red'>v1.3.0alpha</span></span>**

### added
- New [*Constantes Physiques et Mathématiques* notebook](./Constantes.ipynb)
- New [*Dérivées et Intégrales* notebook](./DeriveesIntegrales1.ipynb)
    - Requires sympy module
    - Version 0. Strong improvements are needed

### changed
- Reorganization of the folder(s) and file renaming (`DS4B*` prefix added to all *Data Science for Beginners* files and folders)
- Exercises and solution to exercises of the *Data Science for Beginners* topic entirely rewritten:
    - "Iris1" = [Lecture et analyse de la base de données par la librairie pandas](./Exercices-DS4B/DS4B-Iris1-Exercice.ipynb)
    - "Iris2" = [Statistiques et régression](./Exercices-DS4B/DS4B-Iris2-Exercice.ipynb)
    - "Iris3" = [Apprentissage supervisé (supervised Machine Learning) appliqué à la classification (régression logistique)](./Exercices-DS4B/DS4B-Iris3-Exercice.ipynb)

## **2022.08.19. <span style='color:red'>v1.2.1</span>**

### changed
- Comments added to the [PCA notebook](./DataSc4Beginners-IrisPCA.ipynb)

## **2022.06.27. <span style='color:red'>v1.2.0</span>**

### added
- New [Principal Component Analysis (PCA) topic](./DataSc4Beginners-IrisPCA.ipynb)<br>
Minimalistic comments (so far)<br>
Requires modules: keras, tensorflow, scikit-learn, pandas, **plotly**

[&#x1F51D; top &#x1F51D;](#top)