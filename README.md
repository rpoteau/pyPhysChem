<a name="top"></a>

[<img width="700px" src="./config/svg/logoPytChem.svg"/>](#top)

Des exemples commentés et généralement illustrés sont disponibles sous forme de Jupyter Notebooks
  
*Commented and generally illustrated examples are available in the form of Jupyter Notebooks*

## Document principal / *Main document*
Il faut lire le fichier [`TOC.ipynb`](./TOC.ipynb), qui renvoie vers des sous-thèmes.
Chaque sous-thème est introduit par les objectifs de ces TP, ainsi qu'une table des matières qui permet d'accéder aux cours/TP et aux exercices.

*You have to read the [`TOC.ipynb`](./TOC.ipynb) file, which points to subtopics.
Each subtopic is introduced by the goals of the course, as well as a table of contents that allows access to the courses/tutorials and exercises*.

## Comment lire et utiliser ces notebooks ? / *How to read and use these notebooks?*

### **1.** Installer Jupyter ainsi qu'une distribution Python / *Install Jupyter as well as a Python distribution*

Il faut d'abord avoir installé [Jupyter](https://jupyter.org/) ainsi qu'une distribution python sur son PC. 

La solution la plus simple est d'installer et utiliser [Anaconda](https://www.anaconda.com/), qui est une distribution libre et open source du langage de programmation Python :

* Les versions de paquetages sont gérées par le système de gestion de paquets conda
* Elle comprend également Anaconda Navigator, qui est une interface graphique "user-friendly"
* Les applications suivantes sont disponibles par défaut dans le navigateur :
    * JupyterLab & Jupyter Notebook
    * Spyder
    * RStudio
    * ...
* Anaconda est disponible pour MacOS, Windows, Linux.

*First install [Jupyter](https://jupyter.org/) as well as a Python distribution on your PC.*

*A simple and easy possibility is to install [Anaconda](https://www.anaconda.com/), a free and opensource distribution of the Python programming language:*

- *Package versions are managed by the package management system conda*
- *It also includes a user friendly GUI, Anaconda Navigator*
- *The following applications are available by default in Navigator:*
    - *JupyterLab & Jupyter Notebook*
    - *Spyder*
    - *RStudio*
    - ...
- *Anaconda runs under MacOS, Windows, Linux.*

### **2.** Cloner ou Télécharger le dépôt (repository) PytChem / *Clone or Download the PytChem repository*

#### Télécharger / *Download*
Ce n'est pas la façon de faire qui est recommandée, bien que ce soit la plus simple / *It is not the recommended way, although it is the simplest*

Téléchargez l'archive zip / Download the zip archive

<img width="650px" src="./MiscImages/DownloadZip.png"/>

#### Cloner le dépôt / *Clone the repository*

**C'est la méthode recommandée**, car elle facilite la mise à jour des notebooks / ***This is the recommended way**, given the ease of updating notebooks*

##### Sous Linux / *Under Linux*

Ouvrez un terminal. Depuis le répertoire où vous voulez installer les notebooks, tapez la commande : / *Open a terminal. Go into the folder in which the notebooks will be installed, and type:*  

```
git clone https://github.com/rpoteau/PytChem.git
```  

Vous avez maintenant un répertoire `PytChem` dans le répertoire depuis lequel vous avez lancé la commande `git` / *You now have a `PytChem` folder installed in the folder from which the `git` command was ran*

PytChem étant un projet en évolution, il faut régulièrement vérifier qu'il n'y a pas de mise à jour. La commande suivante met si nécessaire à jour le contenu du répertoire `Pytchem` / *Pytchem being a work-in-progress project, it is necessary to regularly check for a possible update. The content of the `PytChem` folder is updated by using the following command*:  

allez d'abord dans le répertoire PytChem / *first go into the `PytChem` folder*

puis tapez / *and then enter*

```  
git pull origin main
```  

##### Sous Windows / Under Windows

Vous devez télécharger et installer [l'application  git](https://gitforwindows.org/). Ne changez aucune option par défaut, à l'exception de l'éditeur Nano au lieu de vi / *You must download and install [the git application](https://gitforwindows.org/). Do not change any default options, except for the Nano editor instead of vi*

Exécutez ensuite l'application Git GUI. Ça devrait ressembler à ça : / *Then run the Git GUI application. It should look like:*

<img width="400px" src="./MiscImages/GitGUI-Windows-0.png"/>

Cliquez sur "Clone existing repository". Collez l'adresse https://github.com/rpoteau/PytChem.git dans le champ "Source location". Choisissez un emplacement où cloner PytChem dans "Target Directory", ajoutez PytChem au chemin. Ce répertoire va être créé par Git GUI / *Click on "Clone existing repository". Paste the https://github.com/rpoteau/PytChem.git in the "Source location" field. Choose the local target folder. Add PytChem to the pathway. This folder will be created by Git GUI*

<img width="550px" src="./MiscImages/GitGUI-Windows-1.png"/>

Cliquez sur "Clone". Patientez. À la fin de l'installation, vous allez voir cette fenêtre : / *Click on "Clone". Wait. This window will appear after the installation is completed:* 

<img width="650px" src="./MiscImages/GitGUI-Windows-2.png"/>

Vous pouvez fermer cette application / *You can close this application*

### **3.** Exécuter ces notebooks à l'aide de JupyterLab / Run these notebooks with JupyterLab

#### Sous Linux / *Under Linux*

- Ouvrez un terminal / *Open a terminal*
- Allez (commande `cd chemin d'accès`) dans le répertoire qui contient PytChem / *Navigate to the folder that contains PytChem (`cd pathway`)*
- tapez la commande / *enter the command*

```
jupyter-lab TOC.ipynb
```

#### Sous Windows / *Under Windows*


Le plus simple est de passer par Anaconda Navigator, puis sélectionner JupyterLab / *The easiest way is to select jupyterLab from Anaconda Navigator*

<img width="700px" src="./MiscImages/Anaconda.png"/>

Il ne reste plus qu'à naviguer jusqu'au répertoire qui contient PytChem, et à charger la table des matières intitulé `TOC.ipynb` / *All that remains is to navigate to the directory that contains PytChem, and load the table of contents entitled `TOC.ipynb`.*

<img width="650px" src="./MiscImages/JupyterLab.png"/>

## Librairies nécessaires / *Required libraries*
Vous devez installer les librairies suivantes dans votre environnement Python / *You must install the following libraries in your Python environment*:  


- matplotlib
- numpy
- scipy
- sympy
- pandas
- seaborn
- scikit learn
- tensorflow
- keras
- plotly
- latex

## Liste des changements / *List of changes*

[Liste des changements / *List of changes*](./CHANGE.md)