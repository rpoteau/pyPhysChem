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

### 1. Installer Jupyter ainsi qu'une distribution Python / *Install Jupyter as well as a Python distribution*

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

### 2. Cloner le dépôt (repository) PytChem / *Clone the PytChem repository*

* téléchargez l'archive zip / *download the zip archive*
* ou bien clonez ce dépôt, depuis le répertoire où vous voulez installer les notebooks / *or clone this repository, from the folder in which the notebooks will be installed*:  

    ```
    git clone https://github.com/rpoteau/PytChem.git
    ```  

    Vous avez maintenant un répertoire `PytChem` dans le répertoire depuis lequel vous avez lancé la commande `git` / *You now have a `PytChem` folder installed in the folder from which the `git` command was ran*

    PytChem étant un projet en évolution, il faut régulièrement vérifier qu'il n'y a pas de mise à jour. La commande suivante met si nécessaire à jour le contenu du répertoire `Pytchem` / *Pytchem being a work-in-progress project, it is necessary to regularly check for a possible update. The content of the `PytChem` folder is updated by using the following command*:  

    allez d'abord dans le répertoire PytChem / *first go into the `PytChem` folder*

    puis tapez / *and then*

    ```  
    git pull origin main
    ```  

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