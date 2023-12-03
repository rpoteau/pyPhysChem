<a name="top"></a>

[<img width="700px" src="./config/svg/pyPhysChemBanner.svg"/>](#top)

##### **2023.12.02. release 1.8.1**
- short exercises and new comments added to the [iris1 notebook](DS4B-Iris1.ipynb)
- modification of the [CO2 solubility with ANN notebook](DS4B-CO2_solubility-ANN.ipynb)
   - one model removed (with full standardization, GC descriptors included)
   - some comments are added to facilitate the self-learning
   - rdkit is now used to display the cations and anions
   - the last part was commented on because of a persistent bug (unimportant part - will be solved later) 

##### **2023.12.02. unreleased version** 
- [Tight binding (TB) notebook](./TB.ipynb) updated with DOS plots (implementation of useful functions to enhance the capabilities of pybinding, including a Monkhorst-Pack mesh to plot DOS)

##### **2023.11.28. unreleased version** 
- [development version of an ML-autoencoder notebook (so far, very close to be a copy/paste of one of Aurelien Géron's tutorials)](./ML-Autoencoders.ipynb)

##### **2023.11.22. release 1.8.0** 
- [NMR notebook finalized under the form of a student project](./NMR.ipynb)

##### **2023.11.15. Unreleased version**
- [Tight binding (TB) notebook](./TB.ipynb) completed with graphene

##### **2023.11.14. release 1.7.5** 
- [Tight binding (TB) notebook ](./TB.ipynb) completed with:
    - Peierls distortion of the linear chain of hydrogen atoms
    - 2&times;2 square lattice
    - 2&times;2 rectangular lattice
    - illustrations taken from R. Hoffmann (1991), Solids And Surfaces. A Chemist's View of Bonding in Extended Structures, Wiley-VCH, with &copy; Wiley 1991
 
##### **2023.11.13. Unreleased version** 
- new [harmonic oscillator project](Harmonic_Oscillator.ipynb), by Th. Leininger, @LCPQ (CNRS-UT3 lab)

##### **2023.11.12. release 1.7.4.** 
- new contributor: I. C. Gerber, @LPCNO (CNRS-UT3-INSA lab)
- new [Tight binding (TB) theme ](./TB.ipynb), adapted from **IC Gerber**'s notebook on this topic
- ML notebooks dev versions still under heavy development and not made available
- [Basics of Artificial Neural Networks (ANNs) for supervised learning notebook](./DS4B-BasicsOfANN.ipynb) is now richly commented, and adapted to self-learning and talktorial format
- TOC updated

##### **2023.11.08. release 1.7.3.** 
- new 1.7.3 version released after a careful check that new pyPhysChem rebranding did not introduce major bugs
- [ML-CNN-dev.ipynb notebook renamed as ML-1DCNN-dev.ipynb](ML-1DCNN-dev.ipynb). dev version not uploaded
- new [2D Convolutional Neural Network notebook](ML-2DCNN-dev.ipynb). dev version not uploaded
- new [Autoencoders notebook](ML-Autoencoders-dev). dev version not uploaded
- TOC updated
- new [AdvancedPython notebook](AdvancedPython.ipynb). First topic: reshaping NumPy arrays
- new BrainHalfHalf style added to the css file

##### **2023.10.29. Unreleased version** 
- project renamed "pyPhysChem" instead of "pytChem"

##### **2023.10.26. Unreleased version** 
- new [Convolutional Neural Network notebook](ML-CNN-dev.ipynb). dev version not uploaded
- new [Neural Network notebook: combining regression and classification with Keras](ML-CombineRegressionAndClassification-dev.ipynb). dev version not uploaded

##### **2023.10.12. Unreleased version** 
- new [Recurrent Neural Network notebook](ML-RNN-dev.ipynb). dev version not uploaded

##### **2023.10.05. release 1.7.1** 
- new contributor: F. Jolibois, @LPCNO (CNRS-UT3-INSA lab)
- new [Velocity Verlet project](MD_VVERLET_Student.ipynb) (**author: *Franck Jolibois***)

##### **2023.09.29. release 1.7.0** [10.5281/zenodo.8396813](https://doi.org/10.5281/zenodo.8396813)
- "talktorial" transformation of the ML part
    - pdf support splitted into a couple of pdf files
    - some slides are inserted in notebooks as jpeg images
    - MLChem.pdf updated with new cited studies
- copy of part of the [DS4B-appendix.ipynb](./DS4B-appendix.ipynb) as [DS4B-BasicsOfANN.ipynb](./DS4B-BasicsOfANN.ipynb)

##### **2023.09.16. Unreleased version**
- new [python-Computer Algebra System, pCAS, in a nutshell notebook](./pCAS.ipynb)
- H atom notebook converted into a [Schrödinger model of the Hydrogen atom exercise notebook](HydrogenAtom.ipynb)
 
##### **2023.09.01. Unreleased version**
- [Unsupervised ML applied to the Iris dataset notebook](./DS4B-IrisUML.ipynb) now includes K-means in addition to PCA
- [Molecules notebook renamed MolecularRepresentations.ipynb](./MolecularRepresentations.ipynb)
    - better contextualization of the scripts
    - similarities calculated and plotted
    - fingerprint plots
    - selection of molecules that match a pattern

##### **2023.06.22. v1.6.1** [10.5281/zenodo.8069824](https://doi.org/10.5281/zenodo.8069824)
- various bug fix

##### **2023.05.22. v1.6.0**
- "Iris3" = [Régression logistique](./DS4B-Iris3.ipynb) is now also available in English (*Supervised Machine Learning applied to classification*)
- "Iris1" Exercise and Solution to exercise is now available in English
- new [Easter Egg notebook](./EasterEgg.ipynb)

##### **2023.05.20. v1.5.9**
- "Iris1" = [Lecture et analyse de la base de données par la librairie pandas](./Exercices-DS4B/DS4B-Iris1-Exercice.ipynb) is now also available in English (*Reading and analyzis of the "iris" database with the pandas library*)
- [Iris1](./DS4B-Iris1.ipynb):
    - default value for `corr()` changed in Pandas version 2.0.0: The default value of `numeric_only` is now `False` => script changed with `dfi.corr(numeric_only=True)`
- "Iris2" = [Statistiques et régression](./DS4B-Iris2.ipynb) is now also available in English (*Statistics and regression*)

##### **2023.05.18. Unreleased version**
- new contributor: S. Christodoulou, @LPCNO (CNRS-UT3-INSA lab)
- New [Molecules notebook](./Molecules.ipynb) (in English), mainly based on the ```RDKit``` library and on the ```jupyter_jsmol``` extension
- New [ML-SVR notebook](./DS4B-CO2_solubility-SVR.ipynb) (in English): Prediction of the solubility of CO<sub>2</sub> in ionic liquids with the Support Vector Regression (SVR) method. Illustration of an optimal hyperparameters search (**author: *Stella Christodoulou***)
- New [ML-SVR exercise](./DS4B-Exercices/DS4B-CO2_solubility-SVR-Exercise.ipynb), with the [solution](/DS4B-Exercices/DS4B-CO2_solubility-SVR-ExerciseWithAnswer.ipynb) (**author: *Stella Christodoulou***)
- The need for the [rdkit](https://www.rdkit.org/) and [jupyter-jsmol](https://pypi.org/project/jupyter-jsmol/) libraries is now indicated in the README.md document

##### **2023.01.25. v1.5.0beta2**
- Install instructions more detailed in [README.md](./README.md) 

##### **2023.01.24. v1.5.0beta**
- ["Python in the Physical Chemistry Lab (PPCL) in a nutshell"](./PPCL.ipynb) project completed, prior to a peer review

##### **2023.01.16. v1.5.0alpha**
- New [*Python in the Physical Chemistry Lab (PPCL) in a nutshell* notebook](./PPCL.ipynb) (in English)
- New or modified css classes (ex, app, rq - formerly warn), intro -formerly rq)

##### **2022.12.11. Unreleased version**
- New "Puits de potentiel infiniment profond" project (in French, aka "Particle in a box" project)

##### **2022.11.29. v1.4.0alpha**
- New release with a decent NMR notebook (although work is still in progress) and of the associated White Paper
- TOC updated (the Huckel.ipynb and InfiniteSquareWell.ipynb are not yet mentioned)

##### **2022.11.27. not released**
- New [*2nd-order NMR* notebook](./NMR.ipynb) (work in progress)

##### **2022.11.26. not released**
- New [*Infinite Square Well* notebook](./InfiniteSquareWell.ipynb) (work in progress)
- New [*Huckel* notebook](./Huckel.ipynb) (work in progress)

##### **2022.11.06. v1.3.0alpha3**
- New [*Hydrogen atom* notebook](./HydrogenAtom.ipynb) (work in progress)
 
##### **2022.11.05. v1.3.0alpha2**
- New [*Equations différentielles* notebook](./DeriveesIntegrales2.ipynb)
    - Requires [sympy module](https://www.sympy.org/en/index.html),as already needed for the [*Dérivées et Intégrales* notebook](./DeriveesIntegrales1.ipynb)
    - Version 0. Strong improvements are needed as well as the implementation of numerical solution of ODE

##### **2022.11.02. v1.3.0alpha**

- Reorganization of the folder(s) and file renaming (`DS4B*` prefix added to all *Data Science for Beginners* files and folders)
- Exercises and solution to exercises of the *Data Science for Beginners* topic entirely rewritten:
    - "Iris1" = [Lecture et analyse de la base de données par la librairie pandas](./Exercices-DS4B/DS4B-Iris1-Exercice.ipynb)
    - "Iris2" = [Statistiques et régression](./Exercices-DS4B/DS4B-Iris2-Exercice.ipynb)
    - "Iris3" = [Apprentissage supervisé (supervised Machine Learning) appliqué à la classification (régression logistique)](./Exercices-DS4B/DS4B-Iris3-Exercice.ipynb)
- New [*Constantes Physiques et Mathématiques* notebook](./Constantes.ipynb)
- New [*Dérivées et Intégrales* notebook](./DeriveesIntegrales1.ipynb)
    - Requires sympy module
    - Version 0. Strong improvements are needed

##### **2022.08.19. v1.2.1**

- Comments added to the [PCA notebook](./DataSc4Beginners-IrisPCA.ipynb)

##### **2022.06.27. v1.2.0**

- New [Principal Component Analysis (PCA) topic](./DataSc4Beginners-IrisPCA.ipynb)<br>
Minimalistic comments (so far)<br>
Requires modules: keras, tensorflow, scikit-learn, pandas, **plotly**
