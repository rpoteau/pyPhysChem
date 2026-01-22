__author__ = "Romuald POTEAU"
__maintainer__ =  "Romuald POTEAU"
__email__ = "romuald.poteau@utoulouse.fr"
__status__ = "Development"

from visualID_Eng import color, fg, hl, bg 

############################################################
#          I N   H O U S E   F U N C T I O N S 
############################################################
#          Machine Learning
############################################################

def y2c(mc2i,y):
    import tensorflow as tf
    from tensorflow import keras
    #from keras.utils import np_utils
    from keras.utils import to_categorical
    y_array = y.copy()
    y_array = y_array.to_numpy() # transformation au format numpy
    # transformation des valeurs de y1 & y2 en entiers
    for x in range(len(y_array)):
        #print(x, y_array[x], mapc2i[y_array[x]])
        y_array[x] = mc2i[y_array[x]]
    yohe = to_categorical(y_array)
    del y_array
    return yohe

def categorizeY_2ohe(Ctot, y1, y2):
    """
    one-hot-encodes a pandas column of categorical data
    input:
        - Ctot is the reference pandas column, necessary to find all unique categories in this column
        - y1 and y2 are the actual pandas column that will be categorized. y1 and y2 are supposed to be the ytest and ytrain subsets of Ctot  
    output:
        - y1ohe and y2ohe are the numpy arrays returned by this routine
    """
    
    uv = Ctot.unique()
    print(f"Catégories uniques : {uv}") 
    mapc2i = {}
    for x in range(len(uv)):
        mapc2i[uv[x]] = x
    print(f"Correspondance entre chaque catégorie unique et un entier : {mapc2i}")
    y1ohe = y2c(mapc2i,y1)
    y2ohe = y2c(mapc2i,y2)
    print(f"Structure (shape) des tableaux renvoyés par categorize1C_2ohe. y1 : {y1ohe.shape}, y2 : {y2ohe.shape}")
    del mapc2i, uv
    return y1ohe, y2ohe

def centerTitle(content=None):
    '''
    centers and renders as HTML a text in the notebook
    font size = 16px, background color = dark grey, foreground color = white
    '''
    from IPython.display import display, HTML
    display(HTML(f"<div style='text-align:center; font-weight: bold; font-size:16px;background-color: #343132;color: #ffffff'>{content}</div>"))
    
    
def centertxt(content=None,font='sans', size=12,weight="normal",bgc="#000000",fgc="#ffffff"):
    '''
    centers and renders as HTML a text in the notebook
    input: 
        - content = the text to render (default: None)
        - font = font family (default: 'sans', values allowed =  'sans-serif' | 'serif' | 'monospace' | 'cursive' | 'fantasy' | ...)
        - size = font size (default: 12)
        - weight = font weight (default: 'normal', values allowed = 'normal' | 'bold' | 'bolder' | 'lighter' | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 )
        - bgc = background color (name or hex code, default = '#ffffff')
        - fgc = foreground color (name or hex code, default = '#000000')
    '''
    from IPython.display import display, HTML
    display(HTML(f"<div style='text-align:center; font-family: {font}; font-weight: {weight}; font-size:{size}px;background-color: {bgc};color: {fgc}'>{content}</div>"))

def e2Lists(eigenvectors, sort=False):
    '''
    returns two separate lists from the list of tuples returned by the eigenvects() function of SymPy
    input
        - the list of tuples returned by eigenvects
        - sort (default: False): returns sorted eigenvalues and corresponding eigenvectors if True
    output
        - list of eigenvalues, sorted or not
        - list of corresponding eigenvectors
    '''
    import numpy as np
    eps = list()
    MOs = list()
    for mo in eigenvectors:
        eps.extend(mo[0] for i in range(mo[1]))
        for eigvc in mo[2]:
            MOs.append(eigvc.normalized())
    if (sort):
        sortindex=[]
        for i,j in sorted(enumerate(eps), key=lambda j: j[1]):
            sortindex.append(i)
        eps = sorted(eps)
    
        MOs_sorted=[]
        for i, mo in enumerate(MOs):
            MOs_sorted.append(MOs[sortindex[i]])
        return eps,MOs_sorted
    else:
        return eps,MOs

def displayModel(fig,width):
    import PIL, io
    pfig = PIL.Image.open(io.BytesIO(fig.data))
    width0, height0 = pfig.size
    scale = width/width0
    pfig = pfig.resize((width, int(height0*scale)), PIL.Image.Resampling.LANCZOS)
    display(pfig)
    
############################################################
#                       Periodic Table
############################################################
import mendeleev

class TableauPeriodique:
    nomsFr=['Hydrogène','Hélium','Lithium','Béryllium','Bore','Carbone','Azote','Oxygène',
            'Fluor','Néon','Sodium','Magnésium','Aluminium','Silicium','Phosphore','Soufre',
            'Chlore','Argon','Potassium','Calcium','Scandium','Titane','Vanadium','Chrome',
            'Manganèse','Fer','Cobalt','Nickel','Cuivre','Zinc','Gallium','Germanium',
            'Arsenic','Sélénium','Brome','Krypton','Rubidium','Strontium','Yttrium',
            'Zirconium','Niobium','Molybdène','Technétium','Ruthénium','Rhodium',
            'Palladium','Argent','Cadmium','Indium',
            'Étain','Antimoine','Tellure','Iode','Xénon','Césium','Baryum','Lanthane','Cérium',
            'Praséodyme','Néodyme','Prométhium','Samarium','Europium','Gadolinium','Terbium',
            'Dysprosium','Holmium','Erbium','Thulium','Ytterbium','Lutetium','Hafnium','Tantale',
            'Tungstène','Rhénium','Osmium','Iridium','Platine','Or','Mercure','Thallium','Plomb',
            'Bismuth','Polonium','Astate','Radon','Francium','Radium','Actinium','Thorium','Protactinium',
            'Uranium','Neptunium','Plutonium','Americium','Curium','Berkelium','Californium','Einsteinium',
            'Fermium','Mendelevium','Nobelium','Lawrencium','Rutherfordium','Dubnium','Seaborgium','Bohrium',
            'Hassium','Meitnerium','Darmstadtium','Roentgenium','Copernicium','Nihonium','Flerovium',
            'Moscovium','Livermorium','Tennesse','Oganesson',
            ]
    trad = {'Nonmetals':'Non métal',
            'Noble gases':'Gaz noble',
            'Alkali metals':'Métal alcalin',
            'Alkaline earth metals':'Métal alcalino-terreux',
            'Metalloids':'Métalloïde',
            'Halogens':'Halogène',
            'Poor metals':'Métal pauvre',
            'Transition metals':'Métal de transition',
            'Lanthanides':'Lanthanide',
            'Actinides':'Actinide',
            'Metals':'Métal',
           }

    def __init__(self):
        from mendeleev.vis import create_vis_dataframe
        self.elements = create_vis_dataframe()
        self.patch_elements()

    def patch_elements(self):
        '''
        Ce patch, appliqué à self.elements, créé par l'appel à create_vis_dataframe(), va servir à :
        - ajouter des informations en français : les noms des éléments et des séries (familles) auxquelles ils appartiennent
        - retirer les éléments du groupe 12 de la famille des métaux de transition, qui est le choix CONTESTABLE par défaut de la bibliothèque mendeleev
        input : elements est un dataframe pandas préalablement créé par la fonction create_vis_dataframe() de mendeleev.vis
        output : elements avec deux nouvelles colonnes name_seriesFr et nom, qui contient dorénavant les noms des éléments en français
                        + correction des données name_series et series_id pour les éléments Zn, Cd, Hg, Cn
                        + de nouvelles colonnes qui contiennent l'énergie de première ionisation et les isotopes naturels
        '''
        def series_eng2fr(s):
            '''Correspondance entre nom des séries (familles) en anglais et en français'''
            s = TableauPeriodique.trad[s]
            return s

        def name_eng2fr():
            self.elements["nom"] = TableauPeriodique.nomsFr
            return

        def ajouter_donnees():
            import numpy as np
            from mendeleev.fetch import fetch_table, fetch_ionization_energies
            import pandas as pd
            # dfElts = fetch_table("elements")
            # display(dfElts)
            dfEi1 = fetch_ionization_energies(degree = 1)
            # display(dfEi1)
            b = pd.DataFrame({'atomic_number':[x for x in range(1, 119)]})
            dfEi1tot = pd.merge(left=dfEi1, right=b, on='atomic_number', how='outer').sort_values(by='atomic_number')
            self.elements["Ei1"] = dfEi1tot["IE1"]
        
        # les éléments du groupe 12 ne sont pas des métaux de transition
        self.elements.loc[29,"name_series"] = 'Metals'
        self.elements.loc[47,"name_series"] = 'Metals'
        self.elements.loc[79,"name_series"] = 'Metals'
        self.elements.loc[111,"name_series"] = 'Metals'
        self.elements.loc[29,"series_id"] = 11
        self.elements.loc[47,"series_id"] = 11
        self.elements.loc[79,"series_id"] = 11
        self.elements.loc[111,"series_id"] = 11
        self.elements.loc[29,"color"] = "#bbd3a5"
        self.elements.loc[47,"color"] =  "#bbd3a5"
        self.elements.loc[79,"color"] =  "#bbd3a5"
        self.elements.loc[111,"color"] =  "#bbd3a5"
        # english > français. Ajout d'une nouvelle colonne 
        self.elements["name_seriesFr"] = self.elements["name_series"].apply(series_eng2fr)
        # english > français. Noms des éléments en français changés dans la colonne name
        name_eng2fr()
        ajouter_donnees()
        return

    def prop(self,elt_id):
        from mendeleev import element

        elt = element(elt_id)
        print(f"Nom de l'élement = {TableauPeriodique.nomsFr[elt.atomic_number-1]} ({elt.symbol}, Z = {elt.atomic_number})")
        print(f"Nom en anglais = {elt.name}")
        print(f"Origine du nom = {elt.name_origin}")
        print()
        print(f"CEF = {elt.ec} = {elt.econf}")
        print(f"Nombre d'électrons célibataires = {elt.ec.unpaired_electrons()}")    
        print(f"Groupe {elt.group_id}, Période {elt.period}, bloc {elt.block}")
        print(f"Famille = {self.elements.loc[elt.atomic_number-1,'name_seriesFr']}")
        print()
        print(f"Masse molaire = {elt.atomic_weight} g/mol")
        isotopes = ""
        X = elt.symbol
        for i in elt.isotopes:
            if i.abundance is not None:
                isotopes = isotopes + str(i.mass_number)+ "^" + X + f"({i.abundance}%) / "
        print("Isotopes naturels = ",isotopes[:-2])
        print()
        if elt.electronegativity(scale='pauling') is None:
            print(f"Électronégativité de Pauling = Non définie")
        else:
            print(f"Électronégativité de Pauling = {elt.electronegativity(scale='pauling')}")
        print(f"Énergie de 1ère ionisation = {elt.ionenergies[1]:.2f} eV")
        if elt.electron_affinity is None:
            print(f"Affinité électronique = Non définie")
        else:
            print(f"Afinité électronique = {elt.electron_affinity:.2f} eV")
        print(f"Rayon atomique = {elt.atomic_radius:.1f} pm")
        print()
        print("▶ Description : ",elt.description)
        print("▶ Sources : ",elt.sources)
        print("▶ Utilisation : ",elt.uses)
        print("---------------------------------------------------------------------------------------")
        print()

    def afficher(self):
        from bokeh.plotting import show, output_notebook
        from mendeleev.vis import periodic_table_bokeh
        
        # Toute cette partie du code est une copie du module bokeh de mendeleev.vis
        # La fonction periodic_table_bokeh étant faiblement configurable avec des args/kwargs,
        # elle est adaptée ici pour un affichage personnalisé
        
        from collections import OrderedDict
        
        import pandas as pd
        from pandas.api.types import is_float_dtype
        
        from bokeh.plotting import figure
        from bokeh.models import HoverTool, ColumnDataSource, FixedTicker
        
        from mendeleev.vis.utils import colormap_column
        
        
        def periodic_table_bokeh(
            elements: pd.DataFrame,
            attribute: str = "atomic_weight",
            cmap: str = "RdBu_r",
            colorby: str = "color",
            decimals: int = 3,
            height: int = 800,
            missing: str = "#ffffff",
            title: str = "Periodic Table",
            wide_layout: bool = False,
            width: int = 1200,
        ):
            """
            Use Bokeh backend to plot the periodic table. Adaptation by Romuald Poteau (romuald.poteau@univ-tlse3.fr) of the orignal periodic_table_bokeh() function of the mendeleev library
        
            Args:
                elements : Pandas DataFrame with the elements data. Needs to have `x` and `y`
                    columns with coordianates for each tile.
                attribute : Name of the attribute to be displayed
                cmap : Colormap to use, see matplotlib colormaps
                colorby : Name of the column containig the colors
                decimals : Number of decimals to be displayed in the bottom row of each cell
                height : Height of the figure in pixels
                missing : Hex code of the color to be used for the missing values
                title : Title to appear above the periodic table
                wide_layout: wide layout variant of the periodic table
                width : Width of the figure in pixels
            """
        
            if any(col not in elements.columns for col in ["x", "y"]):
                raise ValueError(
                    "Coordinate columns named 'x' and 'y' are required "
                    "in 'elements' DataFrame. Consider using "
                    "'mendeleev.vis.utils.create_vis_dataframe' and try again."
                )
        
            # additional columns for positioning of the text
        
            elements.loc[:, "y_anumber"] = elements["y"] - 0.3
            elements.loc[:, "y_name"] = elements["y"] + 0.2
        
            if attribute:
                elements.loc[elements[attribute].notnull(), "y_prop"] = (
                    elements.loc[elements[attribute].notnull(), "y"] + 0.35
                )
            else:
                elements.loc[:, "y_prop"] = elements["y"] + 0.35
        
            ac = "display_attribute"
            if is_float_dtype(elements[attribute]):
                elements[ac] = elements[attribute].round(decimals=decimals)
            else:
                elements[ac] = elements[attribute]
        
            if colorby == "attribute":
                colored = colormap_column(elements, attribute, cmap=cmap, missing=missing)
                elements.loc[:, "attribute_color"] = colored
                colorby = "attribute_color"
        
            # bokeh configuration
        
            source = ColumnDataSource(data=elements)
        
            TOOLS = "hover,save,reset"
        
            fig = figure(
                title=title,
                tools=TOOLS,
                x_axis_location="above",
                x_range=(elements.x.min() - 0.5, elements.x.max() + 0.5),
                y_range=(elements.y.max() + 0.5, elements.y.min() - 0.5),
                width=width,
                height=height,
                toolbar_location="above",
                toolbar_sticky=False,
            )
        
            fig.rect("x", "y", 0.9, 0.9, source=source, color=colorby, fill_alpha=0.6)
        
            # adjust the ticks and axis bounds
            fig.yaxis.bounds = (1, 7)
            fig.axis[1].ticker.num_minor_ticks = 0
            if wide_layout:
                # Turn off tick labels
                fig.axis[0].major_label_text_font_size = "0pt"
                # Turn off tick marks
                fig.axis[0].major_tick_line_color = None  # turn off major ticks
                fig.axis[0].ticker.num_minor_ticks = 0  # turn off minor ticks
            else:
                fig.axis[0].ticker = FixedTicker(ticks=list(range(1, 19)))
        
            text_props = {
                "source": source,
                "angle": 0,
                "color": "black",
                "text_align": "center",
                "text_baseline": "middle",
            }
        
            fig.text(
                x="x",
                y="y",
                text="symbol",
                text_font_style="bold",
                text_font_size="15pt",
                **text_props,
            )
            fig.text(
                x="x", y="y_anumber", text="atomic_number", text_font_size="9pt", **text_props
            )
            fig.text(x="x", y="y_name", text="name", text_font_size="6pt", **text_props)
            fig.text(x="x", y="y_prop", text=ac, text_font_size="7pt", **text_props)
        
            fig.grid.grid_line_color = None
        
            hover = fig.select(dict(type=HoverTool))
            hover.tooltips = OrderedDict(
                [
                    ("nom", "@nom"),
                    ("name", "@name"),
                    ("famille", "@name_seriesFr"),
                    ("numéro atomique", "@atomic_number"),
                    ("masse molaire", "@atomic_weight"),
                    ("rayon atomique", "@atomic_radius"),
                    ("énergie de première ionisation", "@Ei1"),
                    ("affinité électronique", "@electron_affinity"),
                    ("EN Pauling", "@en_pauling"),
                    ("CEF", "@electronic_configuration"),
                ]
            )
        
            return fig

        output_notebook()

        fig = periodic_table_bokeh(self.elements, colorby="color")
        show(fig)

############################################################
#                       Chemistry
############################################################

import py3Dmol
import io, os
from ase import Atoms
from ase.io import read, write
from ase.data import vdw_radii, atomic_numbers
import requests
import numpy as np
from ipywidgets import GridspecLayout, VBox, Label, Layout
import CageCavityCalc as CCC

# ============================================================
# Jmol-like element color palette
# ============================================================
JMOL_COLORS = {
    'H':  '#FFFFFF',
    'C':  '#909090',
    'N':  '#3050F8',
    'O':  '#FF0D0D',
    'F':  '#90E050',
    'Cl': '#1FF01F',
    'Br': '#A62929',
    'I':  '#940094',
    'S':  '#FFFF30',
    'P':  '#FF8000',
    'B':  '#FFB5B5',
    'Si': '#F0C8A0',

    'Li': '#CC80FF',
    'Na': '#AB5CF2',
    'K':  '#8F40D4',
    'Mg': '#8AFF00',
    'Ca': '#3DFF00',

    'Fe': '#E06633',
    'Co': '#F090A0',
    'Ni': '#50D050',
    'Cu': '#C88033',
    'Zn': '#7D80B0',

    'Ru': '#248F8F',   # Ruthenium (Jmol faithful)
    'Rh': '#E000E0',
    'Pd': '#A0A0C0',
    'Ag': '#C0C0C0',
    'Pt': '#D0D0D0',
    'Au': '#FFD123',
    'Ir': '#175487',
    'Os': '#266696',
}

class XYZData:
    """
    Object containing molecular coordinates and symbols extracted by molView.
    Allows for geometric calculations without reloading data.
    """
    def __init__(self, symbols, positions):
        self.symbols = np.array(symbols)
        self.positions = np.array(positions, dtype=float)

    def get_center_of_mass(self):
        return np.mean(self.positions, axis=0)

    def get_center_of_geometry(self):
        """
        Calculates the arithmetic mean of the atomic positions (Centroid).
        """
        return np.mean(self.positions, axis=0)
        
    def get_bounding_sphere(self, include_vdw=True, scale=1.0):
        """
        Calculates the center and radius of the bounding sphere using ASE.
        scale: multiplication factor (e.g., 0.6 to match a reduced CPK style).
        """
        center = np.mean(self.positions, axis=0)
        distances = np.linalg.norm(self.positions - center, axis=1)
        
        if include_vdw:
            z_numbers = [atomic_numbers[s] for s in self.symbols]
            radii = vdw_radii[z_numbers] * scale
            radius = np.max(distances + radii)
        else:
            radius = np.max(distances)
            
        return center, radius

    def get_cage_volume(self, grid_spacing=0.5, return_spheres=False):
        """
        Calculates the internal cavity volume of a molecular cage using CageCavityCalc.
        
        This method interfaces with the CageCavityCalc library by generating a 
        temporary PDB file of the current structure. It can also retrieve the 
        coordinates of the 'dummy atoms' (points) that fill the detected void.

        Parameters
        ----------
        grid_spacing : float, optional
            The resolution of the grid used for volume integration in Å. 
            Smaller values provide higher precision (default: 0.5).
        return_spheres : bool, optional
            If True, returns both the volume and an ase.Atoms object 
            containing the dummy atoms representing the cavity (default: False).

        Returns
        -------
        volume : float or None
            The calculated cavity volume in Å³. Returns None if the 
            calculation fails.
        cavity_atoms : ase.Atoms, optional
            Returned only if return_spheres is True. An ASE Atoms object 
            representing the internal void space.
        """
        import tempfile
        import os
        from ase import Atoms
        from ase.io import read as ase_read, write as ase_write
            
        try:
            from CageCavityCalc.CageCavityCalc import cavity
            
            # 1. Fichier temporaire pour la cage
            with tempfile.NamedTemporaryFile(suffix=".pdb", delete=False) as tmp:
                cage_tmp = tmp.name
                temp_atoms = Atoms(symbols=self.symbols, positions=self.positions)
                ase_write(cage_tmp, temp_atoms)

            cav = cavity()
            cav.read_file(cage_tmp)
            cav.grid_spacing = float(grid_spacing)
            cav.dummy_atom_radii = float(grid_spacing)
            volume = cav.calculate_volume()
            
            cavity_atoms = None
            if return_spheres:
                with tempfile.NamedTemporaryFile(suffix=".pdb", delete=False) as tmp2:
                    cav_tmp = tmp2.name
                
                cav.print_to_file(cav_tmp) 
                
                # --- NOUVEAU : Correction pour ASE (remplace ' D ' par ' H ') ---
                with open(cav_tmp, 'r') as f:
                    content = f.read().replace(' D ', ' H ') # On transforme les Dummy en Hydrogène
                with open(cav_tmp, 'w') as f:
                    f.write(content)
                
                # Maintenant ASE peut lire le fichier sans erreur
                cavity_atoms = ase_read(cav_tmp)
                
                if os.path.exists(cav_tmp): 
                    os.remove(cav_tmp)
            
            # ... (fin de la fonction) ...
            if return_spheres:
                return volume, cavity_atoms
            return volume        
            
        except Exception as e:
            print(f"Erreur CageCavityCalc : {e}")
            return None
        
    def __repr__(self):
        return f"<XYZData: {len(self.symbols)} atoms>"        
        
class molView:
    """
    Display molecular and crystal structures in py3Dmol from various sources:
    - XYZ/PDB/CIF local files
    - XYZ-format string
    - PubChem CID
    - ASE Atoms object
    - COD ID
    - RSCB PDB ID

    Three visualization styles are available:
      - 'bs'     : ball-and-stick (default)
      - 'cpk'    : CPK space-filling spheres (with adjustable size)
      - 'cartoon': protein backbone representation
      
    Upon creation, an interactive 3D viewer is shown directly in a Jupyter notebook cell.

    Parameters
    ----------
    mol : str or ase.Atoms
        The molecular structure to visualize.
        - If `source='file'`, this should be a path to a structure file (XYZ, PDB, etc.)
        - If `source='mol'`, this should be a string containing the structure (XYZ, PDB...)
        - If `source='cif'`, this should be a cif file (string)
        - If `source='cid'`, this should be a PubChem CID (string or int)
        - If `source='rscb'`, this should be a RSCB PDB ID (string)
        - If `source='cod'`, this should be a COD ID (string)
        - If `source='ase'`, this should be an `ase.Atoms` object
    source : {'file', 'mol', 'cif', 'cid', 'rscb', 'ase'}, optional
        The type of the input `mol` (default: 'file').
    style : {'bs', 'cpk', 'cartoon'}, optional
        Visualization style (default: 'bs').
        - 'bs'  → ball-and-stick
        - 'cpk' → CPK space-filling spheres
        - 'cartoon' → draws a smooth tube or ribbon through the protein backbone
                     (default for pdb structures)
    cpk_scale : float, optional
        Overall scaling factor for sphere size in CPK style (default: 0.5).
        Ignored when `style='bs'`.
    supercell : tuple of int
        Repetition of the unit cell (na, nb, nc). Default is (1, 1, 1).
    w : int, optional
        Width of the viewer in pixels (default: 600).
    h : int, optional
        Height of the viewer in pixels (default: 400).
    detect_BondOrders : bool, optional
        If True (default) and input is XYZ, uses RDKit to perceive connectivity 
        and bond orders (detects double/triple bonds). 
        Requires the `rdkit` library. If False, fallback to standard 3Dmol 
        distance-based single bonds.

    Examples
    --------
    >>> molView("molecule.xyz", source="file")
    >>> molView(xyz_string, source="mol")
    >>> molView(2244, source="cid")   # PubChem aspirin
    >>> from ase.build import molecule
    >>> molView(molecule("H2O"), source="ase")
    >>> molView.view_grid([2244, 2519, 702], n_cols=3, source='cid', style='bs')
    >>> molView.view_grid(xyzFiles, n_cols=3, source='file', style='bs', titles=titles, w=500, sync=True)
    """

    def __init__(self, mol, source='file', style='bs', cpk_scale=0.6, w=600, h=400,\
                 supercell=(1, 1, 1), display_now=True, detect_BondOrders=True):
        self.mol = mol
        self.source = source
        self.style = style
        self.cpk_scale = cpk_scale
        self.w = w
        self.h = h
        self.detect_bonds = detect_BondOrders # Store the option
        self.supercell = supercell
        self.v = py3Dmol.view(width=self.w, height=self.h) # Création du viewer une seule fois
        self._load_and_display(show=display_now)

    @classmethod
    def view_grid(cls, mol_list, n_cols=3, titles=None, **kwargs):
        """
        Displays a list of molecular structures in an interactive n_rows x n_cols grid.
        
        This method uses ipywidgets.GridspecLayout to organize multiple 3D viewers 
        into a clean matrix. It automatically calculates the required number of rows 
        based on the length of the input list.

        Parameters
        ----------
        mol_list : list
            A list containing the molecular data to visualize. Elements should 
            match the expected 'mol' input for the class (paths, CIDs, strings, etc.).
        n_cols : int, optional
            Number of columns in the grid (default: 3).
        titles : list of str, optional
            Custom labels for each cell. If None, the string representation 
            of the 'mol' input is used as the title.
        **kwargs : dict
            Additional arguments passed to the molView constructor:
            - source : {'file', 'mol', 'cif', 'cid', 'rscb', 'ase'}
            - style : {'bs', 'cpk', 'cartoon'}
            - w : width of each individual viewer in pixels (default: 300)
            - h : height of each individual viewer in pixels (default: 300)
            - supercell : tuple (na, nb, nc) for crystal structures
            - cpk_scale : scaling factor for space-filling spheres

        Returns
        -------
        ipywidgets.GridspecLayout
            A widget object containing the grid of molecular viewers.
            
        Examples
        --------
        >>> files = ["mol1.xyz", "mol2.xyz", "mol3.xyz", "mol4.xyz"]
        >>> labels = ["Reactant", "TS", "Intermediate", "Product"]
        >>> molView.view_grid(files, n_cols=2, titles=labels, source='file', w=400)
        """
        from ipywidgets import GridspecLayout, VBox, Label, Layout, Output
        from IPython.display import display

        # 1. Gestion des dimensions
        w_cell = kwargs.get('w', 300)
        h_cell = kwargs.get('h', 300)
        
        n_mol = len(mol_list)
        n_rows = (n_mol + n_cols - 1) // n_cols # Calcul automatique du nombre de lignes
        
        # Largeur totale pour éviter le scroll horizontal
        total_width = n_cols * (w_cell + 25) 
        grid = GridspecLayout(n_rows, n_cols, layout=Layout(width=f'{total_width}px'))
        
        kwargs['w'] = w_cell
        kwargs['h'] = h_cell
        kwargs['display_now'] = False # Indispensable pour garder le contrôle

        # 2. Remplissage de la grille
        for i, mol in enumerate(mol_list):
            row, col = i // n_cols, i % n_cols
            t = titles[i] if titles and i < len(titles) else str(mol)

            # Création de l'instance (charge les données et styles)
            obj = cls(mol, **kwargs)
            
            # Widget de sortie pour capturer le rendu JS de py3Dmol
            out = Output(layout=Layout(
                width=f'{w_cell}px', 
                height=f'{h_cell}px', 
                overflow='hidden'
            ))
            
            with out:
                obj.v.zoomTo()
                display(obj.v)
            
            # Assemblage Titre + Molécule dans la cellule
            grid[row, col] = VBox([
                Label(value=t, layout=Layout(display='flex', justify_content='center', width='100%')),
                out
            ], layout=Layout(
                width=f'{w_cell + 15}px', 
                align_items='center', 
                overflow='hidden',
                margin='5px'
            ))
            
        return grid

    def _get_ase_atoms(self, content, fmt):
        """Helper to convert string content to ASE Atoms and apply supercell."""
        # Use ASE to parse the structure (more robust for symmetry)
        atoms = read(io.StringIO(content), format=fmt)
        if self.supercell != (1, 1, 1):
            atoms = atoms * self.supercell
        return atoms

    def _draw_cell_vectors(self, cell, origin=(0, 0, 0),
                           radius=0.12, head_radius=0.25, head_length=0.6,
                           label_offset=0.15):
        """
        Draw crystallographic vectors a, b, c as colored arrows
        and add labels a, b, c at their tips.
        
        a = red, b = blue, c = green
        """
        a, b, c = np.array(cell, dtype=float)
        o = np.array(origin, dtype=float)
    
        vectors = {
            "a": (a, "red"),
            "b": (b, "blue"),
            "c": (c, "green")
        }
    
        for name, (vec, color) in vectors.items():
            end = o + vec
    
            # Arrow
            self.v.addArrow({
                "start": {
                    "x": float(o[0]), "y": float(o[1]), "z": float(o[2])
                },
                "end": {
                    "x": float(end[0]), "y": float(end[1]), "z": float(end[2])
                },
                "radius": float(radius),
                "radiusRatio": head_radius / radius,
                "mid": 0.85,
                "color": color
            })
    
            # Label slightly beyond the arrow tip
            label_pos = end + label_offset * vec / np.linalg.norm(vec)
    
            self.v.addLabel(
                name,
                {
                    "position": {
                        "x": float(label_pos[0]),
                        "y": float(label_pos[1]),
                        "z": float(label_pos[2])
                    },
                    "fontColor": color,
                    "backgroundColor": "white",
                    "backgroundOpacity": 0.,
                    "fontSize": 16,
                    "borderThickness": 0
                }
            )
    def _draw_lattice_wireframe(self, cell, reps, color="black", radius=0.05):
        """
        Draw all unit cells of a supercell lattice as wireframes.
        
        Parameters
        ----------
        cell : ase.Cell
            Primitive cell.
        reps : tuple(int,int,int)
            Supercell repetitions (na, nb, nc).
        """
        a, b, c = np.array(cell, dtype=float)
        na, nb, nc = reps
    
        for i in range(na):
            for j in range(nb):
                for k in range(nc):
                    origin = i*a + j*b + k*c
                    self._draw_cell_wireframe(
                        cell,
                        color=color,
                        radius=radius,
                        origin=origin
                    )

    def _draw_cell_wireframe(self, cell, color="black", radius=0.05, origin=(0, 0, 0)):
        """
        Draw a unit cell as a wireframe using py3Dmol lines.
        Works with XYZ or CIF models.
        """
        a, b, c = np.array(cell)
        o = np.array(origin)
    
        corners = [
            o,
            o + a,
            o + b,
            o + c,
            o + a + b,
            o + a + c,
            o + b + c,
            o + a + b + c
        ]
    
        edges = [
            (0,1), (0,2), (0,3),
            (1,4), (1,5),
            (2,4), (2,6),
            (3,5), (3,6),
            (4,7), (5,7), (6,7)
        ]
    
        for i, j in edges:
            self.v.addCylinder({
                "start": {
                    "x": float(corners[i][0]),
                    "y": float(corners[i][1]),
                    "z": float(corners[i][2]),
                },
                "end": {
                    "x": float(corners[j][0]),
                    "y": float(corners[j][1]),
                    "z": float(corners[j][2]),
                },
                "color": color,
                "radius": float(radius),
                "fromCap": True,
                "toCap": True
                })

    def _load_and_display(self, show):

        # --- 1. Handle External API Sources ---
        if self.source == 'cid':
            self.v = py3Dmol.view(query=f'cid:{self.mol}', width=self.w, height=self.h)
        
        elif self.source == 'rscb':
            self.v = py3Dmol.view(query=f'pdb:{self.mol}', width=self.w, height=self.h)

        elif self.source == 'cod':
            url = f"https://www.crystallography.net/cod/{self.mol}.cif"
            response = requests.get(url)
            if response.status_code == 200:
                self.mol = response.text
                self.source = 'cif'
            else:
                raise ValueError(f"Could not find COD ID: {self.mol}")

        # --- 2. Handle Logic for Files and Data ---
        content = ""
        fmt = "xyz"

        if self.source == 'file':
            if not os.path.exists(self.mol):
                raise FileNotFoundError(f"File not found: {self.mol}")
            ext = os.path.splitext(self.mol)[1].lower().replace('.', '')
            fmt = 'cif' if ext == 'cif' else ext
            with open(self.mol, 'r') as f:
                content = f.read()
        
        elif self.source == 'cif':
            content = self.mol
            fmt = 'cif'
        
        elif self.source == 'mol':
            content = self.mol
            fmt = 'xyz'

        # --- EXTRACTION XYZData (Interne) ---
        # On extrait les données ici avant toute modification (RDKit ou Supercell)
        try:
            if self.source == 'ase':
                temp_atoms = self.mol
            else:
                temp_atoms = read(io.StringIO(content), format=fmt)
            
            self.data = XYZData(
                symbols=temp_atoms.get_chemical_symbols(),
                positions=temp_atoms.get_positions()
            )
        except Exception as e:
            print(f"Note: Extraction des coordonnées impossible ({e})")
            self.data = None            
            
        # --- Modern Bond Perception with RDKit ---
        if self.detect_bonds and self.source in ['file', 'mol', 'xyz'] and fmt == 'xyz':
            try:
                from rdkit import Chem
                from rdkit.Chem import rdDetermineBonds
                
                raw_mol = Chem.MolFromXYZBlock(content)
                rdDetermineBonds.DetermineConnectivity(raw_mol)
                rdDetermineBonds.DetermineBondOrders(raw_mol, charge=0)
                
                content = Chem.MolToMolBlock(raw_mol)
                fmt = "sdf"
            except ImportError:
                # Silent skip if RDKit is missing
                pass
            except Exception as e:
                # Small warning if the geometry is the problem
                print(f"Note: Bond perception failed for {self.mol}. Falling back to standard XYZ.")
                
        # --- 3. Rendering Logic ---
        if fmt == 'cif' or self.supercell != (1, 1, 1) or self.source == 'ase':
            # Create ASE atoms object
            if self.source == 'ase':
                atoms = self.mol
            else:
                atoms = read(io.StringIO(content), format=fmt)
            
            # --- CRYSTAL LOGIC (Jmol packed-like) ---
            
            # 1. Read primitive cell (before supercell)
            atoms0 = atoms.copy()
            
            # 2. Apply supercell if requested
            if self.supercell != (1, 1, 1):
                atoms = atoms * self.supercell
            
            # 3. Send atoms to py3Dmol (XYZ, robust)
            xyz_buf = io.StringIO()
            write(xyz_buf, atoms, format="xyz")
            self.v.addModel(xyz_buf.getvalue(), "xyz")
            
            # 4. Draw supercell (optional, thick & gray)
            if self.supercell != (1, 1, 1):
                self._draw_lattice_wireframe(
                    atoms0.cell,
                    self.supercell,
                    color="gray",
                    radius=0.015
                )
                self._draw_cell_wireframe(
                    atoms.cell,
                    color="gray",
                    radius=0.015
                )
            
            # 5. Draw primitive cell (Jmol packed equivalent)
            self._draw_cell_wireframe(
                atoms0.cell,
                color="black",
                radius=0.03
            )
            # Vecteurs a, b, c
            self._draw_cell_vectors(
                atoms0.cell,
                radius=0.04
            )
 
        else:
            # Standard molecule (non-crystal)
            self.v.addModel(content, fmt)

        # Finalize
        self._apply_style()
        self._add_interactions()
        self.v.zoomTo()
        if self.source != 'cif': self.v.zoom(0.9)
        if show: self.v.show()

    def _apply_element_colors(self, color_table):
        """
        Override element colors without breaking the current style (bs / cpk).
        """
        for elem, color in color_table.items():
            if self.style == 'bs':
                self.v.setStyle(
                    {'elem': elem},
                    {
                        'sphere': {'color': color, 'scale': 0.25},
                        'stick':  {'color': color, 'radius': 0.15}
                    }
                )
    
            elif self.style == 'cpk':
                self.v.setStyle(
                    {'elem': elem},
                    {
                        'sphere': {'color': color, 'scale': self.cpk_scale}
                    }
                )

    def _apply_style(self):
        """Apply either ball-and-stick, cartoon or CPK style."""

        if self.style == 'bs':
            self.v.setStyle({'sphere': {'scale': 0.25, 'colorscheme': 'element'},
                        'stick': {'radius': 0.15, 'multibond': True}})
            self._apply_element_colors(JMOL_COLORS)
        elif self.style == 'cpk':
            self.v.setStyle({'sphere': {'scale': self.cpk_scale,
                                   'colorscheme': 'element'}})
            self._apply_element_colors(JMOL_COLORS)
        elif self.style == 'cartoon':
            self.v.setStyle({'cartoon': {'color': 'spectrum', 'style': 'rectangle', 'arrows': True}})
        else:
            raise ValueError("style must be 'bs', 'cpk' or 'cartoon'")

    def _add_interactions(self):
        """Add basic JavaScript Hover labels for atom identification."""
        label_js = "function(atom,viewer) { viewer.addLabel(atom.elem+atom.serial,{position:atom, backgroundColor:'black'}); }"
        reset_js = "function(atom,viewer) { viewer.removeAllLabels(); }"
        self.v.setHoverable({}, True, label_js, reset_js)

    def show_bounding_sphere(self, color='gray', opacity=0.2, scale=1.0):
        """Calculates and displays the VdW bounding sphere in one go."""
        if self.data:
            center, radius = self.data.get_bounding_sphere(include_vdw=True, scale=scale)
            self.v.addSphere({
                'center': {'x': float(center[0]), 'y': float(center[1]), 'z': float(center[2])},
                'radius': float(radius),
                'color': color,
                'opacity': opacity
            })
            print(f"Bounding Sphere: Radius = {radius:.2f} Å | Volume = {(4/3)*np.pi*radius**3:.2f} Å³")
        return self.v.show()

    def show_cage_cavity(self, grid_spacing=0.5, color='cyan', opacity=0.5):
        """Calculates cavity with CageCavityCalc and displays it as a single model."""
        if self.data:
            result = self.data.get_cage_volume(grid_spacing=grid_spacing, return_spheres=True)
            if result:
                volume, spheres = result
                # Création du modèle optimisé pour éviter le gel du navigateur
                xyz_cavity = f"{len(spheres)}\nCavity points\n"
                for pos in spheres.get_positions():
                    xyz_cavity += f"He {pos[0]:.3f} {pos[1]:.3f} {pos[2]:.3f}\n"
                
                self.v.addModel(xyz_cavity, "xyz")
                # On applique le style au dernier modèle ajouté
                self.v.setStyle({'model': -1}, {
                    'sphere': {'radius': grid_spacing/2, 'color': color, 'opacity': opacity}
                })
                print(f"Cavity Volume (CageCavityCalc): {volume:.2f} Å³")
        return self.v.show()
############################################################
#                       easy_rdkit
############################################################
import rdkit
from rdkit import Chem
from rdkit.Chem.rdchem import GetPeriodicTable
import pandas as pd

class easy_rdkit():

    def __init__(self,smiles):
        self.mol=Chem.MolFromSmiles(smiles)
        self.smiles = smiles
        
    def analyze_lewis(self):
        if self.mol is None:
            raise ValueError(f"Molécule invalide pour {self.smiles} (SMILES incorrect ?)")
        
        pt = GetPeriodicTable()
        rows = []
    
        for atom in self.mol.GetAtoms():
            Z = atom.GetAtomicNum()
            valence_e = pt.GetNOuterElecs(Z)
            bonding_e = atom.GetTotalValence()
            formal_charge = atom.GetFormalCharge()
            num_bonds = int(sum(bond.GetBondTypeAsDouble() for bond in atom.GetBonds()))
            # hybridization = atom.GetHybridization()
            nonbonding = valence_e - bonding_e - formal_charge
    
            lone_pairs = max(0, nonbonding // 2)
    
            if Z==1 or Z==2:  # règle du duet
                target = 2
            else:       # règle de l’octet
                target = 8
    
            missing_e = max(0, target/2 - (bonding_e + 2*lone_pairs))
            vacancies = int(missing_e)
            total_e = 2*(lone_pairs + bonding_e)
    
            if total_e > 8:
                octet_msg = "❌ hypercoordiné"
            elif total_e < 8 and Z > 2:
                octet_msg = "❌ électron-déficient"
            elif total_e == 8:
                octet_msg = "✅ octet"    
            elif total_e == 2 and (Z == 1 or Z == 2):
                octet_msg = "✅ duet"
            else:
                octet_msg = "🤔"
            rows.append({
                "index atome": atom.GetIdx(),
                "symbole": atom.GetSymbol(),
                "e- valence": valence_e,
                "e- liants": bonding_e,
                "charge formelle": formal_charge,
                "doublets non-liants (DNL)": lone_pairs,
                "lacunes ([])": vacancies,
                "nombre de liaisons": num_bonds,
                "e- total (octet ?)": total_e,
                "O/H/D ?": octet_msg
            })
        return pd.DataFrame(rows)    
            
    def show_mol(self,
                 size: tuple=(400,400),
                 show_Lewis: bool=False,
                 plot_conjugation: bool=False,
                 plot_aromatic: bool=False,
                 show_n: bool=False,
                 show_hybrid: bool=False,
                 show_H: bool=False,
                 rep3D: bool=False,
                 macrocycle: bool=False,
                 highlightAtoms: list=[],
                 legend: str=''
                ):
        '''
        Exploite les outils d'affichage 2D de RDKit, et permet de superposer certaines propriétés
        Ne peut afficher qu'une molécule à la fois
        - size : dimension de la figure en pixels (défaut : 400x400)
        - show_Lewis : analyse la structure de Lewis et ajout de labels sur chaque atome (défaut : False)
        - plot_conjugation : surligne les liaisons conjuguées (défaut : False)
        - plot_aromatic : surligne les atomes et liaisons des fragments moléculaires aromatiques (défaut : False)
        - show_n : ajoute le numéro de chaque atome (défaut : False)
        - show_hybrid : ajoute l'état d'hybridation des atomes non terminaux (défaut : False)
        - show_H : ajoute les hydrogènes, considérés comme implicites par défaut (défaut : False)
        - rep3D : pseudo dessin 3D qui prend en compte les conflits stériques entre atomes (défaut : False). Active show_H à True 
        - macrocycle: si vrai, active une meilleure représentation de macrocycles (par CoordGen)
        - highlightAtoms : liste des numéros des atomes qu'on souhaite surligner
        - legend : ajoute le contenu de la variable comme légende du dessin
        '''
        from rdkit.Chem.Draw import rdMolDraw2D
        from rdkit import Chem
        from rdkit.Chem import GetPeriodicTable, Draw
        from rdkit.Chem import AllChem
        from rdkit.Chem import rdCoordGen
        import pandas as pd
        from IPython.display import SVG
        from PIL import Image

        def safe_add_hs():
            try:
                return Chem.AddHs(self.mol)
            except Exception as e:
                print(f"[Warning] Impossible d'ajouter les H pour {self.smiles} ({e}), on garde la version brute.")
                return mol      
        
        if show_H and not show_Lewis:
            mol = Chem.AddHs(self.mol)
        else:
            mol = self.mol
        if show_Lewis:
            mol = safe_add_hs()
            self.mol = mol
            df = self.analyze_lewis()
            lewis_info = {row["index atome"]: (row["doublets non-liants (DNL)"], row["lacunes ([])"])
                          for _, row in df.iterrows()}
        else:
            df = None
            
        if rep3D:
            mol = Chem.AddHs(self.mol)
            self.mol = mol
            AllChem.EmbedMolecule(mol)

        if macrocycle:
            rdCoordGen.AddCoords(self.mol)
                
        d2d = rdMolDraw2D.MolDraw2DSVG(size[0],size[1])
        
        atoms = list(mol.GetAtoms())
    
        if plot_conjugation:
            from collections import defaultdict
            Chem.SetConjugation(mol)
            colors = [(0.0, 0.0, 1.0, 0.4)]
            athighlights = defaultdict(list)
            arads = {}
            bndhighlights = defaultdict(list)
            for bond in mol.GetBonds():
                aid1 = bond.GetBeginAtomIdx()
                aid2 = bond.GetEndAtomIdx()
            
                if bond.GetIsConjugated():
                    bid = mol.GetBondBetweenAtoms(aid1,aid2).GetIdx()
                    bndhighlights[bid].append(colors[0])
            
        if plot_aromatic:
            from collections import defaultdict
            colors = [(1.0, 0.0, 0.0, 0.4)]
            athighlights = defaultdict(list)
            arads = {}
            for a in atoms:
                if a.GetIsAromatic():
                    aid = a.GetIdx()
                    athighlights[aid].append(colors[0])
                    arads[aid] = 0.3
                    
            bndhighlights = defaultdict(list)
            for bond in mol.GetBonds():
                aid1 = bond.GetBeginAtomIdx()
                aid2 = bond.GetEndAtomIdx()
            
                if bond.GetIsAromatic():
                    bid = mol.GetBondBetweenAtoms(aid1,aid2).GetIdx()
                    bndhighlights[bid].append(colors[0])
            
        if show_hybrid or show_Lewis:
            for i,atom in enumerate(atoms):
                # print(i,atom.GetDegree(),atom.GetImplicitValence())
                note_parts = []
                if show_hybrid and(atom.GetValence(rdkit.Chem.rdchem.ValenceType.IMPLICIT) > 0 or atom.GetDegree() > 1):
                    note_parts.append(str(atom.GetHybridization()))
                if show_Lewis and i in lewis_info:
                    lp, vac = lewis_info[i]
                    if lp > 0:
                        note_parts.append(f" {lp}DNL")
                    if vac > 0:
                        note_parts.append(f" {vac}[]")
                if note_parts:
                    mol.GetAtomWithIdx(i).SetProp('atomNote',"".join(note_parts))
                # print(f"Atom {i+1:3}: {atom.GetAtomicNum():3} {atom.GetSymbol():>2} {atom.GetHybridization()}")
            if show_Lewis:
                display(df)
    
        if show_n:
            d2d.drawOptions().addAtomIndices=show_n
    
        if plot_aromatic or plot_conjugation:
            d2d.DrawMoleculeWithHighlights(mol,legend,dict(athighlights),dict(bndhighlights),arads,{})
        else:
            d2d.DrawMolecule(mol,legend=legend, highlightAtoms=highlightAtoms)
            
        d2d.FinishDrawing()
        display(SVG(d2d.GetDrawingText()))

        return

############################################################
#                       Sympy
############################################################

def PrintLatexStyleSymPyEquation(spe):
    """
    Function that displays a SymPy expression (spe) in a jupyter notebbok after its conversion into a LaTeX / Math output

    Input:
    spe: SymPy expression

    Output:
    Pretty printing of spe

    """
    from IPython.display import display,Math
    import sympy as sym
    display(Math(sym.latex(spe)))
    return


######################################################################
#                       Survey
######################################################################

import os, json, yaml, pandas as pd
from datetime import datetime
from IPython.display import display
from ipywidgets import VBox, HTML, Button, IntSlider, Text, Textarea, Layout, HBox, Dropdown
from textwrap import wrap
import numpy as np
import matplotlib.pyplot as plt

class SurveyApp:
    def __init__(self, mode="participant", base_dir="ML-survey"):
        self.mode = mode
        self.base_dir = base_dir
        self.responses_dir = os.path.join(base_dir, "responses")
        self.summary_dir = os.path.join(base_dir, "summary")
        os.makedirs(self.responses_dir, exist_ok=True)
        os.makedirs(self.summary_dir, exist_ok=True)
        self.questions, self.blocks = self.load_questions()

    def enable_slider_css(self):
        """Inject CSS for hover/active color effects on sliders."""
        from IPython.display import HTML, display
        display(HTML("""
        <style>
        /* Hover: track + rail */
        .jp-InputSlider:hover .MuiSlider-track,
        .jp-InputSlider:hover .MuiSlider-rail {
            background-color: #1E90FF55 !important;
        }
    
        /* Hover: thumb */
        .jp-InputSlider:hover .MuiSlider-thumb {
            background-color: #1E90FF !important;
            box-shadow: 0px 0px 4px #1E90FF !important;
        }
    
        /* Active: thumb when clicked or dragged */
        .jp-InputSlider .MuiSlider-thumb.Mui-active {
            background-color: #FF4500 !important;
            box-shadow: 0px 0px 6px #FF4500 !important;
        }
        </style>
        """))

    def get_or_create_user_id(self):
        """Return a persistent anonymous ID (stored in .survey_id)."""
        id_path = os.path.join(self.base_dir, ".survey_id")
    
        # If ID file already exists, read it
        if os.path.exists(id_path):
            with open(id_path, "r") as f:
                user_id = f.read().strip()
            if user_id:
                return user_id
    
        # Otherwise, create a new one
        import secrets
        user_id = f"UID_{datetime.now().strftime('%Y%m%d')}_{secrets.token_hex(3).upper()}"
        with open(id_path, "w") as f:
            f.write(user_id)
        return user_id

    def load_questions(self):
        yaml_path = os.path.join(self.base_dir, "survey_questions.yaml")
        with open(yaml_path, "r") as f:
            data = yaml.safe_load(f)
    
        questions, blocks = {}, {}
        
        for b, v in data["blocks"].items():
            blocks[b] = (v["title"], v["subtitle"])
            
            for qid, qinfo in v["questions"].items():
                questions[qid] = {
                    "text": qinfo["text"],
                    "required": qinfo.get("required", True)  # default = required
                }
                
        return questions, blocks

    # === Helper: Print Summary ===
    def print_questions_summary(self):
        """Affiche la liste des questions par bloc et leur type (Numérique/Texte)."""
        print("\n#####################################################")
        print("#         RÉPARTITION DES QUESTIONS PAR BLOC        #")
        print("#####################################################")

        num_total, text_total = 0, 0

        for block_id, (title, subtitle) in self.blocks.items():
            print(f"\n--- {block_id}. {title} ---")

            num_in_block, text_in_block = 0, 0

            # Filtre les questions appartenant à ce bloc
            block_questions = {
                qid: qinfo for qid, qinfo in self.questions.items() 
                if qid.startswith(block_id)
            }

            for qid, qinfo in block_questions.items():
                text = qinfo["text"]

                # Reproduction de la logique de détection des types
                if "(1 =" in text:
                    q_type = "NUMÉ(Slider)"
                    num_in_block += 1
                else:
                    q_type = "TEXTE(Libre)"
                    text_in_block += 1

                print(f"  [{qid:4}] {q_type:12} : {text.split('(1 =')[0].strip()}")

            num_total += num_in_block
            text_total += text_in_block

        print("\n-----------------------------------------------------")
        print(f"TOTAL : {num_total} questions numériques, {text_total} questions à champ libre.")
        print("-----------------------------------------------------")
    
    # === UI Builder ===
    def run(self):
        if self.mode == "participant":
            self.build_participant_form()
        elif self.mode == "admin":
            self.build_admin_dashboard()

    # === Participant Mode ===
    def build_participant_form(self):
        self.enable_slider_css()   # ← inject CSS automatically
        colors = ["#f7f9fc", "#f0f0f0"]
        base_styles = {
            "title": "font-size:18px;font-weight:bold;margin-top:5px;",
            "subtitle": "color:#444;font-style:italic;font-size:13px;margin-bottom:8px;",
            "warn": "color:#CC0000;font-size:12px;font-style:italic;",
        }
        
        self.user_id = self.get_or_create_user_id()
        self.full_form = [
            HTML(f"<b>🆔 Your anonymous ID:</b> <code>{self.user_id}</code><br>"
                 f"<span style='color:#777;font-size:12px'>(This ID is stored locally in a hidden file .survey_id)</span>")
        ]
        self.input_controls, self.warn_labels = [], []

        block_index = 0
        for block in self.blocks.keys():
            color = colors[block_index % len(colors)]
            title, subtitle = self.blocks[block]
            header_html = f"""
            <div style='background-color:{color};border:1px solid #ccc;border-radius:8px;padding:15px 20px;margin:12px 0'>
            <div style='{base_styles['title']}color:#1E90FF'>{title}</div>
            <div style='{base_styles['subtitle']}'>{subtitle}</div><div style='margin-left:15px;'>
            """
            footer_html = "</div></div>"
            block_widgets = [HTML(header_html)]
            for q, qinfo in self.questions.items():
                if q.startswith(block):      # ← IMPORTANT, à garder absolument
                    txt = qinfo["text"]
                    required = qinfo["required"]
                    
                    # Affichage + astérisque
                    star = "<span style='color:#a00'>*</span>" if required else ""
                    block_widgets.append(HTML(f"<b>{txt}</b> {star}"))
            
                    # Détection slider vs textarea (inchangée)
                    if "(1 =" in txt:
                        w = IntSlider(
                            value=0, min=0, max=5, step=1,
                            description='', layout=Layout(width="35%")
                        )
                        w.slider_behavior = "drag-tap"
                    else:
                        w = Textarea(
                            placeholder="Write your answer here...",
                            layout=Layout(width="85%", height="60px")
                        )
            
                    warn = HTML("")
            
                    # Stockage widget + required
                    self.input_controls.append((w, required))
                    self.warn_labels.append(warn)
            
                    # Ajout dans le layout
                    block_widgets.extend([w, warn])
            block_widgets.append(HTML(footer_html))
            self.full_form.extend(block_widgets)
            block_index += 1

        # === Buttons ===
        btn_layout = Layout(width="220px", height="40px", margin="3px 6px 3px 0")
        self.save_button = Button(description="💾 Save draft", button_style="info", layout=btn_layout)
        self.load_button = Button(description="📂 Load selected draft", button_style="warning", layout=btn_layout)
        self.submit_button = Button(description="✅ Submit", button_style="success", layout=btn_layout)
        self.status_label = HTML(value="", layout=Layout(margin="10px 0px"))
        self.draft_status_label = HTML(value="", layout=Layout(margin="5px 0px"))

        # === Dropdown to select which draft to load ===
        self.draft_dropdown = Dropdown(
            options=self.list_drafts(),
            description="Drafts:",
            layout=Layout(width="70%")
        )

        self.save_button.on_click(self.save_draft)
        self.load_button.on_click(self.load_draft)
        self.submit_button.on_click(self.submit_form)

        self.full_form.append(
            VBox([
                self.save_button,
                HBox([self.load_button, self.draft_dropdown]),           # ✅ ici à la place de self.load_button
                self.draft_status_label,
                self.submit_button,
                self.status_label
            ])
        )
        display(VBox(self.full_form))


    # === Helper: list available drafts ===
    def list_drafts(self):
        if not os.path.exists(self.responses_dir):
            return ["No drafts found"]
        drafts = sorted([f for f in os.listdir(self.responses_dir) if f.endswith(".json")])
        return ["Select a draft to load and then click on the Load Selected Draft button"] + drafts if drafts else ["No drafts found"]
    
    # === Actions ===
    def save_draft(self, b):
        data = self._collect_data()
        base_name = f"FallSchool_Draft_{self.user_id}"
        existing = [f for f in os.listdir(self.responses_dir) if f.startswith(base_name)]
        filename = os.path.join(self.responses_dir, f"{base_name}_v{len(existing)+1}.json")
        with open(filename, "w") as f: json.dump(data, f, indent=2)
        self.status_label.value = f"<div style='background:#fff4e5;color:#b35900;padding:6px;border:1px solid #b35900;border-radius:6px'>💾 Draft saved as <code>{os.path.basename(filename)}</code></div>"
        self.draft_dropdown.options = self.list_drafts()

    def load_draft(self, b):
        selected = self.draft_dropdown.value
        # --- Sécurité : rien sélectionné ou placeholder ---
        if not selected or selected.startswith("Select") or selected.startswith("No drafts"):
            self.status_label.value = (
                "<div style='color:#a00'>⚠ Please select a valid draft from the dropdown.</div>"
            )
            return
        filename = os.path.join(self.responses_dir, selected)

        with open(filename, "r") as f:
            data = json.load(f)

        if "id" in data:
            self.user_id = data["id"]
    
        for i, (q, _) in enumerate(self.questions.items()):
            if q in data:
                w, required = self.input_controls[i]
                val = data[q]
                if isinstance(w, IntSlider): w.value = int(val)
                else: w.value = str(val)
        self.status_label.value = (f"<div style='background:#fff4e5;color:#b35900;padding:6px;"
                                   f"border:1px solid #b35900;border-radius:6px'>📂 Loaded "
                                   f"{os.path.basename(filename)}</div>")

    def submit_form(self, b):
        incomplete = False
        data = {}
    
        for i, (q, _) in enumerate(self.questions.items()):
            w, required = self.input_controls[i]
            val = w.value
            warn_label = self.warn_labels[i]  # 🔴 label d’avertissement sous chaque question
    
            # --- Vérification des sliders ---
            if isinstance(w, IntSlider):
                if required and val == 0:
                    warn_label.value = (
                        "<span style='color:#a00;font-size:12px;font-style:italic;'>⚠ Please answer this question.</span>"
                    )
                    w.style.handle_color = "red"
                    incomplete = True
                else:
                    warn_label.value = ""
                    w.style.handle_color = None
                data[q] = int(val)
    
            # --- Vérification des champs texte ---
            else:
                if required and not str(val).strip():
                    warn_label.value = (
                        "<span style='color:#a00;font-size:12px;font-style:italic;'>⚠ Please provide an answer.</span>"
                    )
                    incomplete = True
                else:
                    warn_label.value = ""
                data[q] = val
    
        data["id"] = getattr(self, "user_id", "Anonymous")
    
        # === Si des réponses manquent ===
        if incomplete:
            self.status_label.value = (
                "<div style='background:#ffe6e6;color:#a00;border:1px solid #a00;"
                "padding:8px;border-radius:6px;'>❌ Some questions are missing. "
                "Please check the red warnings above.</div>"
            )
            return
    
        # === Si tout est rempli ===
        filename = os.path.join(
            self.responses_dir,
            f"Response_{data['id']}_{datetime.now().strftime('%Y%m%d_%H%M')}.csv"
        )
        pd.DataFrame([data]).to_csv(filename, index=False)
        self.status_label.value = (
            f"<div style='background:#e6ffe6;color:#060;border:1px solid #060;"
            f"padding:8px;border-radius:6px;'>✅ Response saved to "
            f"<code>{os.path.basename(filename)}</code></div>"
        )


    def _collect_data(self):
        data = {}
        for q, (w, required) in zip(self.questions.keys(), self.input_controls):
            data[q] = w.value
        data["id"] = self.user_id
        return data

    # === Admin mode ===================================================================================
    #=== Helper
    # === Admin mode ===================================================================================

    def plot_spider_multi(self, df, title="Participant and Mean Scores per Block", savepath=None, figsize=(12,8)):
        """
        Draw radar (spider) chart with per-participant transparency
        and block names instead of A–F.
        """
    
        # --- Compute averages ---
        avg = df.mean(axis=0)
        labels = avg.index.tolist()
        N = len(labels)
        angles = np.linspace(0, 2 * np.pi, N, endpoint=False).tolist()
        angles += [angles[0]]
    
        # === Replace A–F with block titles ===
        # → only use the first sentence (shortened title)
        label_map = {b: self.blocks[b][0].replace(f"Block {b}. ", "") for b in self.blocks.keys()}
        display_labels = [label_map.get(lbl, lbl) for lbl in labels]
        
        # === Auto linebreak: split labels into two roughly equal parts ===
        def split_label(text):
            words = text.split()
            if len(words) <= 2:
                return text
            mid = len(words) // 2
            return " ".join(words[:mid]) + "\n" + " ".join(words[mid:])    
            
        display_labels = [split_label(lbl) for lbl in display_labels]

        # --- Create figure ---
        fig, ax = plt.subplots(figsize=figsize, subplot_kw=dict(polar=True))
    
        # --- Plot all participants ---
        for i in range(len(df)):
            values = df.iloc[i].values.tolist()
            values += [values[0]]
            ax.plot(angles, values, linewidth=1, alpha=0.25, color="gray")
            ax.fill(angles, values, alpha=0.05, color="gray")
    
        # --- Mean polygon ---
        mean_values = avg.values.tolist() + [avg.values[0]]
        ax.plot(angles, mean_values, color='navy', linewidth=2.5)
        ax.fill(angles, mean_values, color='navy', alpha=0.25)
    
        # --- Axis style ---
        ax.set_xticks(angles[:-1])
        ax.set_xticklabels(display_labels, fontsize=11, fontweight='bold', wrap=True)
        ax.set_yticks([1,2,3,4,5])
        ax.set_yticklabels(["1","2","3","4","5"], fontsize=10, fontweight='bold', color="gray")
        ax.set_ylim(0,5)
        ax.set_title(title, size=14, weight='bold', pad=25)

        # --- Grid and outer circle ---
        ax.grid(True, linestyle='--', color='gray', alpha=0.4, linewidth=0.8)
        ax.spines['polar'].set_visible(False)  # remove the black frame
        outer_circle = plt.Circle((0,0), 5, transform=ax.transData._b, fill=False, lw=5, color="red", alpha=0.4)
        ax.add_artist(outer_circle)
        
        plt.tight_layout()
    
        # --- Save plot if requested ---
        if savepath:
            plt.savefig(savepath, dpi=300, bbox_inches='tight')
            print(f"💾 Saved radar plot to {savepath}")
    
        plt.show()

    def summarize_by_block(self, df):
        """Compute average score per block (A–F) for numeric questions."""
        import re
        num_df = df.select_dtypes(include=["number"])
        block_means = {}
        for col in num_df.columns:
            match = re.match(r"([A-F])\d+", col)
            if match:
                block = match.group(1)
                block_means.setdefault(block, []).append(num_df[col])
        # Mean per block (ignores missing NaN)
        block_avg = {b: pd.concat(cols, axis=1).mean(axis=1) for b, cols in block_means.items()}
        return pd.DataFrame(block_avg)
    

    ############################################################
    # 🔍 TEXTUAL & SEMANTIC ANALYSIS METHODS
    ############################################################

    def load_all_responses(self):
        """Load and merge all .csv survey responses into a DataFrame."""
        import pandas as pd, os
        files = [f for f in os.listdir(self.responses_dir) if f.endswith(".csv")]
        if not files:
            print("⚠ No responses found.")
            return None
        df = pd.concat([pd.read_csv(os.path.join(self.responses_dir, f)) for f in files], ignore_index=True)
        df.reset_index(drop=True, inplace=True)
        print(f"✅ Loaded {len(df)} responses ({len(df.columns)} columns)")
        return df


    def analyze_text_columns(self, df=None, columns=None, top_n=20):
        """
        Basic textual analysis: show frequent words, word clouds, and per-question summary.
        """
        import matplotlib.pyplot as plt
        from sklearn.feature_extraction.text import CountVectorizer
        from wordcloud import WordCloud
        import pandas as pd
        import os

        if df is None:
            df = self.load_all_responses()
        if df is None:
            return

        # auto-detect textual columns if not provided
        if columns is None:
            columns = [c for c in df.columns if df[c].dtype == 'object']
        if not columns:
            print("⚠ No text columns found.")
            return

        os.makedirs(self.summary_dir, exist_ok=True)
        print(f"🧩 Textual questions detected: {columns}")

        for col in columns:
            texts = df[col].dropna().astype(str)
            if len(texts) == 0:
                continue

            # vectorize text
            vectorizer = CountVectorizer(stop_words='english')
            X = vectorizer.fit_transform(texts)
            word_freq = pd.DataFrame(X.toarray(), columns=vectorizer.get_feature_names_out()).sum().sort_values(ascending=False)

            # show top words
            print(f"\n📝 Top {top_n} words for '{col}':")
            display(word_freq.head(top_n))

            # wordcloud
            wc = WordCloud(width=800, height=400, background_color='white').generate(" ".join(texts))
            plt.figure(figsize=(8, 4))
            plt.imshow(wc, interpolation="bilinear")
            plt.axis("off")
            plt.title(f"Word Cloud: {col}")
            savepath = os.path.join(self.summary_dir, f"WordCloud_{col}.png")
            plt.savefig(savepath, dpi=300, bbox_inches="tight")
            print(f"💾 Saved {savepath}")
            plt.show()


    def semantic_analysis(self, df=None, columns=None, n_clusters=3):
        """
        Perform semantic clustering on open-ended responses using sentence-transformers.
        """
        from sentence_transformers import SentenceTransformer
        from sklearn.cluster import KMeans
        import matplotlib.pyplot as plt
        import umap
        import numpy as np
        import os

        if df is None:
            df = self.load_all_responses()
        if df is None:
            return

        if columns is None:
            columns = [c for c in df.columns if df[c].dtype == 'object']
        texts = []
        meta = []
        for col in columns:
            for t in df[col].dropna():
                texts.append(str(t))
                meta.append(col)

        if len(texts) < 2:
            print("⚠ Not enough text to perform semantic analysis.")
            return

        print(f"🧠 Encoding {len(texts)} responses from {len(columns)} text questions...")
        model = SentenceTransformer('all-MiniLM-L6-v2')
        embeddings = model.encode(texts)

        reducer = umap.UMAP(random_state=0)
        emb_2d = reducer.fit_transform(embeddings)

        kmeans = KMeans(n_clusters=n_clusters, random_state=0)
        labels = kmeans.fit_predict(embeddings)

        plt.figure(figsize=(8, 6))
        plt.scatter(emb_2d[:, 0], emb_2d[:, 1], c=labels, cmap='tab10', alpha=0.7)
        plt.title("Semantic Clusters of Open Responses", fontsize=14, weight='bold')
        for i, (x, y) in enumerate(emb_2d):
            plt.text(x, y, meta[i], fontsize=8, alpha=0.6)
        plt.tight_layout()

        savepath = os.path.join(self.summary_dir, "SemanticClusters.png")
        plt.savefig(savepath, dpi=300, bbox_inches="tight")
        print(f"💾 Saved semantic clustering plot to {savepath}")
        plt.show()


    def build_admin_dashboard(self):

        # === APPEL AJOUTÉ ICI ! ===
        self.print_questions_summary()

        # === Load all responses ===
        df = self.load_all_responses()
        if df is None:
            return

        # --- CODE POUR SAUVEGARDER EN EXCEL ---
        excel_path = os.path.join(self.summary_dir, f"All_Responses_{datetime.now().strftime('%Y%m%d_%H%M')}.xlsx")
        df.to_excel(excel_path, index=False)
        print(f"✅ Saved all responses to Excel: {excel_path}")
        # ---------------------------------------------

        display(HTML("<h4>📊 All collected responses</h3>"))
        display(df)

        # === Summary statistics ===
        display(HTML("<h4>📈 Summary statistics</h4>"))
        display(df.describe())

        # === Missing values report ===
        html_summary = "<h4>🕳 Missing values per column:</h4><div style='font-family:monospace;font-size:14px;'>"
        missing = df.isna().sum()
        for col, val in missing.items():
            if val > 0:
                html_summary += f"<span style='color:red;font-weight:bold;'>{col}={val}</span> | "
            else:
                html_summary += f"{col}=0 | "
        html_summary = html_summary.rstrip(" | ") + "</div>"
        display(HTML(html_summary))

        # === 🧩 Textual analysis ===
        text_cols = [c for c in df.columns if df[c].dtype == 'object' and c not in ['id']]
        if text_cols:
            display(HTML("<h4>🧠 Textual Analysis</h4>"))
            self.analyze_text_columns(df=df, columns=text_cols, top_n=15)
        else:
            print("ℹ️ No open-ended text columns found for analysis.")

        # 🕸 Radar plot
        block_avg_df = self.summarize_by_block(df)
        self.plot_spider_multi(
            block_avg_df,
            title="",
            savepath=os.path.join(self.summary_dir, "Radar_BlockScores.png")
        )

        # === 🧭 Semantic map of text answers ===
        display(HTML("<h4>🧭 Semantic Clustering Map</h4>"))
        try:
            self.semantic_analysis(df=df, columns=text_cols, n_clusters=4)
        except Exception as e:
            print(f"⚠️ Skipped semantic clustering (reason: {e})")

        display(HTML(
            "<h4>✅ Dashboard summary saved in:</h4>"
            f"<code>{os.path.abspath(self.summary_dir)}</code>"
        ))

############################################################
#                       Absorption spectra
############################################################

import numpy as np
import matplotlib.pyplot as plt
import scipy.constants as sc

class SpectrumSimulator:

    def __init__(self, sigma_ev=0.3, plotWH=(12,8), \
                 fontSize_axisText=14, fontSize_axisLabels=14, fontSize_legends=12,
                 fontsize_peaks=12,
                 colorS='#3e89be',colorVT='#469cd6'
                ):
        """
        Initializes the spectrum simulator

        Args:
            - sigma_ev (float): Gaussian half-width at half-maximum in electron-volts (eV).
                                Default is 0.3 eV (GaussView default is 0.4 eV).
            - plotWH (tuple(int,int)): Width and Height of the matplotlib figures in inches. Default is (12,8).
            - colorS: color of the simulated spectrum (default ='#3e89be')
            - colorVT: color of the vertical transition line (default = '#469cd6')

        Returns:
            None: This method initializes the instance attributes.
        Calculates:
            - sigmanm = half-width of the Gaussian band, in nm
        """
        self.sigma_ev = sigma_ev
        # Conversion constante eV -> nm sigma
        self.ev2nm_const = (sc.h * sc.c) * 1e9 / sc.e
        self.sigmanm = self.ev2nm_const / self.sigma_ev
        self.plotW = plotWH[0]
        self.plotH = plotWH[1]
        self.colorS = colorS
        self.colorVT = colorVT
        self.fig = None
        self.graph = None
        self.fontSize_axisText = fontSize_axisText
        self.fontSize_axisLabels = fontSize_axisLabels
        self.fontSize_legends = fontSize_legends
        self.fontsize_peaks = fontsize_peaks

        print(f"sigma = {sigma_ev} eV -> sigmanm = {self.sigmanm:.1f} nm")
    
    def _initializePlot(self):
        fig, graph = plt.subplots(figsize=(self.plotW,self.plotH))
        plt.subplots_adjust(wspace=0)
        plt.xticks(fontsize=self.fontSize_axisText,fontweight='bold')
        plt.yticks(fontsize=self.fontSize_axisText,fontweight='bold')
        return fig, graph
    
    def _calc_epsiG(self,lambdaX,lambdai,fi):
        '''
        calculates a Gaussian band shape around a vertical transition
        input:
            - lambdaX = wavelength variable, in nm
            - lambdai = vertical excitation wavelength for i_th state, in nm
            - fi = oscillator strength for state i (dimensionless)
        output :
            molar absorption coefficient, in L mol-1 cm-1
        '''
        import scipy.constants as sc
        import numpy as np
        c = sc.c*1e2 #cm-1
        NA = sc.N_A #mol-1
        me = sc.m_e*1000 #g
        e = sc.e*sc.c*10 #elementary charge in esu 
        pf = np.sqrt(np.pi)*e**2*NA/(1000*np.log(10)*c**2*me)
        nubarX = 1e7 / lambdaX # nm to cm-1
        nubari = 1e7 / lambdai
        sigmabar = 1e7 / self.sigmanm
        epsi = pf * (fi / sigmabar) * np.exp(-((nubarX - nubari)/sigmabar)**2)
        return epsi
    
    def _Absorbance(self,eps,opl,cc):
        '''
        Calculates the Absorbance with the Beer-Lambert law
        input:
            - eps = molar absorption coefficient, in L mol-1 cm-1
            - opl = optical path length, in cm
            - cc = concentration of the attenuating species, in mol.L-1
        output :
            Absorbance, A (dimensionless)
        '''
        return eps*opl*cc
    
    def _sumStatesWithGf(self,wavel,wavelTAB,feTAB):
        '''
        '''
        import numpy as np
        sumInt = np.zeros(len(wavel))
        for l in wavel:
            for i in range(len(wavelTAB)):
                sumInt[np.argwhere(l==wavel)[0][0]] += self._calc_epsiG(l,wavelTAB[i],feTAB[i])
        return sumInt
    
    def _FindPeaks(self,sumInt,height,prom=1):
        '''
        Finds local maxima within the spectrum based on height and prominence.
        
        Prominence is crucial when switching between linear and logarithmic scales:
        - In Linear mode: A large prominence (e.g., 1 to 1000) filters out noise.
        - In Log mode: Data is compressed into a range of ~0 to 5. A large 
          prominence will 'hide' real peaks. A smaller value (0.01 to 0.1) 
          is required to detect shoulders and overlapping bands.

        Input:
            - sumInt: Array of intensities (Epsilon or Absorbance).
            - height: Minimum height a peak must reach to be considered.
            - prom: Required vertical distance between the peak and its lowest contour line.
        
        Returns:
            - PeakIndex: Indices of the detected peaks in the wavelength array.
            - PeakHeight: The intensity values at these peak positions.
        '''
        from scipy.signal import find_peaks
        peaks = find_peaks(sumInt, height = height, threshold = None, distance = 1, prominence=prom)
        PeakIndex = peaks[0]
        # Check if 'peak_heights' exists in the properties dictionary
        if 'peak_heights' in peaks[1]:
            PeakHeight = peaks[1]['peak_heights']
        else:
            # If height=None, we extract values manually from the input data
            PeakHeight = sumInt[PeakIndex]
        return PeakIndex,PeakHeight

    def _FindShoulders(self, data, tP):
        '''
        ###not working
        Detects shoulders using the second derivative.
        A shoulder appears as a peak in the negative second derivative.
        
        Note on scales:
        - If ylog is True: data should be log10(sumInt) and tP should be log10(tP).
          The second derivative on log data is much more sensitive to subtle 
          inflection points in weak transitions (like n -> pi*).
        - If ylog is False: data is linear sumInt and tP is linear.
        
        Returns:
            - shoulder_idx (ndarray): Array of indices where shoulders were found.
            - shoulder_heights (ndarray): The intensity values at these positions 
              extracted from the input data.
        '''
        import numpy as np
        # Calculate the second derivative (rate of change of the slope)
        d2 = np.gradient(np.gradient(data))
        
        # We search for peaks in the opposite of the second derivative (-d2).
        # A local maximum in -d2 corresponds to a point of maximum curvature 
        # (inflection), which identifies a shoulder.
        # We use a very low prominence threshold to capture subtle inflections.
        shoulder_idx, _ = self._FindPeaks(-d2, height=None, prom=0.0001)
        shoulder_heights = data[shoulder_idx]
        print(shoulder_idx, shoulder_heights )
        
        return shoulder_idx, shoulder_heights 
    
    def _pickPeak(self,wavel,peaksIndex,peaksH,color,\
                  shift=500,height=500,posAnnotation=200, ylog=False):
        '''
        Annotates peaks with a small vertical tick and the wavelength value.
        Adjusts offsets based on whether the plot is in log10 scale or linear.
        In log mode, peaksH must already be log10 values.
        '''
        s=shift
        h=height
        a=posAnnotation
        

        for i in range(len(peaksIndex)):
            x = wavel[peaksIndex[i]]
            y = peaksH[i]
            if ylog:
                # In log scale, we use multipliers to keep the same visual distance
                # 1.1 means "10% above the peak"
                # Adjust these factors based on your preference
                y_s = y * 1.1
                y_h = y * 1.3
                y_a = y * 1.5
                self.graph.vlines(x, y_s, y_h, colors=color, linestyles='solid')
                self.graph.annotate(f"{x:.1f}",xy=(x,y),xytext=(x,y_a),rotation=90,size=self.fontsize_peaks,ha='center',va='bottom', color=color)
            else:
                # Classic linear offsets
                self.graph.vlines(x, y+s, y+s+h, colors=color, linestyles='solid')
                self.graph.annotate(f"{x:.1f}",xy=(x,y),xytext=(x,y+s+h+a),rotation=90,size=self.fontsize_peaks,ha='center',va='bottom',color=color)
        return

    def _setup_axes(self, lambdamin, lambdamax, ymax, ylabel="Absorbance"):
            self.graph.set_xlabel('wavelength / nm', size=self.fontSize_axisLabels, fontweight='bold', color='#2f6b91')
            self.graph.set_ylabel(ylabel, size=self.fontSize_axisLabels, fontweight='bold', color='#2f6b91')
            self.graph.set_xlim(lambdamin, lambdamax)
            self.graph.set_ylim(0, ymax)
            self.graph.tick_params(axis='both', labelsize=self.fontSize_axisText,labelcolor='black')
            for tick in self.graph.xaxis.get_majorticklabels(): tick.set_fontweight('bold') #it is both powerful
                                                # (you can specify the type of a specific tick) and annoying
            for tick in self.graph.yaxis.get_majorticklabels(): tick.set_fontweight('bold')
    
    def plotTDDFTSpectrum(self,wavel,sumInt,wavelTAB,feTAB,tP,ylog,labelSpectrum,colorS='#0000ff',colorT='#0000cf'):
        
        '''
        Called by plotEps_lambda_TDDFT. Plots a single simulated UV-Vis spectrum, i.e. after
        gaussian broadening, together with the TDDFT vertical transitions (i.e. plotted as lines)
        
        input:
            - wavel = array of gaussian-broadened wavelengths, in nm
            - sumInt = corresponding molar absorptiopn coefficients, in L. mol-1 cm-1
            - wavelTAB = wavelength of TDDFT, e.g. discretized, transitions
            - ylog = log plot of epsilon
            - tP: threshold for finding the peaks
            - feTAB = TDDFT oscillator strength for each transition of wavelTAB
            - labelSpectrum = title for the spectrum
        '''

        # # --- DEBUG START ---
        # if ylog:
        #     print(f"\n--- DEBUG LOG MODE ---")
        #     print(f"Max sumInt (linear): {np.max(sumInt):.2f}")
        #     print(f"Max sumInt (log10):  {np.log10(max(np.max(sumInt), 1e-5)):.2f}")
        # # --- DEBUG END ---
        if ylog:
            # Apply safety floor to the entire array
            self.graph.set_yscale('log')
            ymin_val = 1.0 # Epsilon = 1
        else:
            self.graph.set_yscale('linear')
            ymin_val = 0
            
        # vertical lines
        for i in range(len(wavelTAB)):
            val_eps = self._calc_epsiG(wavelTAB[i],wavelTAB[i],feTAB[i])
            self.graph.vlines(x=wavelTAB[i], ymin=ymin_val, ymax=max(val_eps, ymin_val), colors=colorT)

        self.graph.plot(wavel,sumInt,linewidth=3,linestyle='-',color=colorS,label=labelSpectrum)

        self.graph.legend(fontsize=self.fontSize_legends)
        if ylog:
            # Use log-transformed data and log-transformed threshold
            # Clipping tP to 1e-5 ensures we don't take log of 0 or negative
            tPlog = np.log10(max(tP, 1e-5))
            # prom=0.05 allows detection of peaks that are close in log-magnitude
            peaks, peaksH_log = self._FindPeaks(np.log10(np.clip(sumInt, 1e-5, None)), tPlog, prom=0.05)
            peaksH = 10**peaksH_log
            # shoulders, shouldersH_log = self._FindShoulders(np.log10(np.clip(sumInt, 1e-5, None)), tPlog)
            # all_idx = np.concatenate((peaks, shoulders))
            # allH_log = np.concatenate((peaksH_log, shouldersH_log))
            # allH = 10**allH_log
        else:
            peaks, peaksH = self._FindPeaks(sumInt,tP)
            # shoulders, shouldersH = self._FindShoulders(wavel, sumInt, tP)
            # all_idx = np.concatenate((peaks, shoulders))
            # allH = np.concatenate((peaksH, shouldersH))
        self._pickPeak(wavel,peaks,peaksH,colorS,500,500,200,ylog)
        
    
    def plotEps_lambda_TDDFT(self,datFile,lambdamin=200,lambdamax=800,\
                             epsMax=None, titles=None, tP = 10, \
                             ylog=False,\
                             filename=None):
        '''
        Plots a TDDFT VUV simulated spectrum (vertical transitions and transitions summed with gaussian functions)
        between lambdamin and lambdamax (sum of states done in the range [lambdamin-50, lambdamlax+50] nm)
        input:
            - datFile: list of pathway/names to files generated by 'GParser Gaussian.log -S'
            - lambdamin, lambdamax: plot range
            - epsMax: y axis graph limit
            - titles: list of titles (1 per spectrum plot)
            - tP: threshold for finding the peaks (default = 10 L. mol-1 cm-1)
            - ylog: y logarithmic axis (default: False).
            - save: saves in a png file (300 dpi) if True (default = False)
            - filename: saves figure in a 300 dpi png file if not None (default), with filename=full pathway
        '''
        if self.fig is not None:
            graph = self.graph
            fig = self.fig
            lambdamin = self.lambdamin
            lambdamax = self.lambdamax
            epsMax = self.epsMax
        else:
            fig, graph = self._initializePlot()

        graph.set_prop_cycle(None)

        if self.fig is None:
            self.fig = fig
            self.graph = graph
            self.lambdamin = lambdamin
            self.lambdamax = lambdamax
            self.epsMax = epsMax
            
            graph.set_xlabel('wavelength / nm',size=self.fontSize_axisLabels,fontweight='bold',color='#2f6b91')

            graph.set_xlim(lambdamin,lambdamax)

            import matplotlib.ticker as ticker
            graph.xaxis.set_major_locator(ticker.MultipleLocator(50)) # sets a tick for every integer multiple of the base (here 250) within the view interval
        
        istate,state,wavel,fe,SSq = np.genfromtxt(datFile,skip_header=1,dtype="<U20,<U20,float,float,<U20",unpack=True)
        wavel = np.array(wavel)
        fe = np.array(fe)
        if wavel.size == 1:
            wavel = np.array([wavel])
            fe = np.array([fe])
        wvl = np.arange(lambdamin-50,lambdamax+50,1)
        sumInt = self._sumStatesWithGf(wvl,wavel,fe)
        self.plotTDDFTSpectrum(wvl,sumInt,wavel,fe,tP,ylog,titles,self.colorS,self.colorVT)
        if ylog:
            graph.set_ylabel('log(molar absorption coefficient / L mol$^{-1}$ cm$^{-1})$',size=self.fontSize_axisLabels,fontweight='bold',color='#2f6b91')
            graph.set_ylim(1, epsMax * 5 if epsMax else None)
        else:
            graph.set_yscale('linear')
            graph.set_ylabel('molar absorption coefficient / L mol$^{-1}$ cm$^{-1}$',size=self.fontSize_axisLabels,fontweight='bold',color='#2f6b91')
            graph.set_ylim(0, epsMax if epsMax else np.max(sumInt)*1.18)
        if filename is not None: self.fig.savefig(filename, dpi=300, bbox_inches='tight')
        plt.show()

        peaksI, peaksH = self._FindPeaks(sumInt,tP)
        print(f"{bg.LIGHTREDB}{titles}{bg.OFF}")
        for i in range(len(peaksI)):
            print(f"peak {i:3}. {wvl[peaksI[i]]:4} nm. epsilon_max = {peaksH[i]:.1f} L mol-1 cm-1")
        if ylog:
            print()
            # prom=0.05 allows detection of peaks that are close in log-magnitude
            peaksI, peaksH = self._FindPeaks(np.log10(np.clip(sumInt, 1e-5, None)), np.log10(max(tP, 1e-5)), prom=0.05)
            for i in range(len(peaksI)):
                print(f"peak {i:3}. {wvl[peaksI[i]]:4} nm. log10(epsilon_max) = {peaksH[i]:.1f}")

    def plotAbs_lambda_TDDFT(self, datFiles=None, C0=1e-5, lambdamin=200, lambdamax=800, Amax=2.0,\
                             titles=None, linestyles=[], annotateP=[], tP = 0.1,\
                             resetColors=False,\
                             filename=None):
        '''
        Plots a simulated TDDFT VUV absorbance spectrum (transitions summed with gaussian functions)
        between lambdamin and lambdamax (sum of states done in the range [lambdamin-50, lambdamlax+50] nm)
        input:
            - datFiles: list of pathway/name to files generated by 'GParser Gaussian.log -S'
            - C0: list of concentrations needed to calculate A = epsilon x l x c (in mol.L-1)
            - lambdamin, lambdamax: plot range (x axis)
            - Amax: y axis graph limit
            - titles: list of titles (1 per spectrum plot)
            - linestyles: list of line styles(default = "-", i.e. a continuous line)
            - annotateP: list of Boolean (annotate lambda max True or False. Default = True)
            - tP: threshold for finding the peaks (default = 0.1)
            - resetColors (bool): If True, resets the matplotlib color cycle 
                                 to the first color. This allows different series 
                                 (e.g., gas phase vs. solvent) to share the same 
                                 color coding for each molecule across multiple calls. Default: False
            - save: saves in a png file (300 dpi) if True (default = False)
            - filename: saves figure in a 300 dpi png file if not None (default), with filename=full pathway
        '''

        if self.fig is None:
            fig, graph = self._initializePlot()
            self.fig = fig
            self.graph = graph
            self.lambdamin = lambdamin
            self.lambdamax = lambdamax
            self.Amax = Amax
        else:
            graph = self.graph
            fig = self.fig
            lambdamin = self.lambdamin
            lambdamax = self.lambdamax
            Amax = self.Amax
            if resetColors: graph.set_prop_cycle(None)
            
        if linestyles == []: linestyles = len(datFiles)*['-']
        if annotateP == []: annotateP = len(datFiles)*[True]

        self._setup_axes(lambdamin, lambdamax, self.Amax, ylabel="Absorbance")
        
        wvl = np.arange(lambdamin-50,lambdamax+50,1)
        for f in range(len(datFiles)):
            istate,state,wavel,fe,SSq = np.genfromtxt(datFiles[f],skip_header=1,dtype="<U20,<U20,float,float,<U20",unpack=True)
            sumInt = self._sumStatesWithGf(wvl,wavel,fe)
            Abs = self._Absorbance(sumInt,1,C0[f])
            plot=self.graph.plot(wvl,Abs,linewidth=3,linestyle=linestyles[f],label=f"{titles[f]}. TDDFT ($C_0$={C0[f]} mol/L)")
            peaksI, peaksH = self._FindPeaks(Abs,tP,0.01)
            if (annotateP[f]): self._pickPeak(wvl,peaksI,peaksH,plot[0].get_color(),0.01,0.04,0.02)
            print(f"{bg.LIGHTREDB}TDDFT. {titles[f]}{bg.OFF}")
            for i in range(len(peaksI)):
                print(f"peak {i:3}. {wvl[peaksI[i]]:4} nm. A = {peaksH[i]:.2f}")
                
        self.graph.legend(fontsize=self.fontSize_legends)

        if filename is not None: self.fig.savefig(filename, dpi=300, bbox_inches='tight')

        return
    
    def plotAbs_lambda_exp(self, csvFiles, C0, lambdamin=200, lambdamax=800,\
                             Amax=2.0, titles=None, linestyles=[], annotateP=[], tP = 0.1,\
                             filename=None):
        '''
        Plots an experimental VUV absorbance spectrum read from a csv file between lambdamin and lambdamax
        input:
            - superpose: False = plots a new graph, otherwise the plot is superposed to a previously created one
                         (probably with plotAbs_lambda_TDDFT())
            - csvfiles: list of pathway/name to experimental csvFiles (see examples for the format)
            - C0: list of experimental concentrations, i.e. for each sample
            - lambdamin, lambdamax: plot range (x axis)
            - Amax: graph limit (y axis)
            - titles: list of titles (1 per spectrum plot)
            - linestyles: list of line styles(default = "--", i.e. a dashed line)
            - annotateP: list of Boolean (annotate lambda max True or False. Default = True)
            - tP: threshold for finding the peaks (default = 0.1)
            - save: saves in a png file (300 dpi) if True (default = False)
            - filename: saves figure in a 300 dpi png file if not None (default), with filename=full pathway
        '''
        if linestyles == []: linestyles = len(csvFiles)*['--']
        if annotateP == []: annotateP = len(csvFiles)*[True]

        if self.fig is not None:
            graph = self.graph
            fig = self.fig
            lambdamin = self.lambdamin
            lambdamax = self.lambdamax
            Amax = self.Amax
        else:
            fig, graph = self._initializePlot()
            
        graph.set_prop_cycle(None)
        
        if self.fig is None:
            self.graph = graph
            self.fig = fig
            self.lambdamin = lambdamin
            self.lambdamax = lambdamax
            self.Amax = Amax
            
        self._setup_axes(lambdamin, lambdamax, self.Amax, ylabel="Absorbance")
                
        for f in range(len(csvFiles)):
            wavel,Abs = np.genfromtxt(csvFiles[f],skip_header=1,unpack=True,delimiter=";")
            wavel *= 1e9
            plot=graph.plot(wavel,Abs,linewidth=3,linestyle=linestyles[f],label=f"{titles[f]}. exp ($C_0$={C0[f]} mol/L)")
            peaksI, peaksH = self._FindPeaks(Abs,tP,0.01)
            if (annotateP[f]): self._pickPeak(wavel,peaksI,peaksH,plot[0].get_color(),0.01,0.04,0.02)
            print(f"{bg.LIGHTREDB}exp. {titles[f]}{bg.OFF}")
            for i in range(len(peaksI)):
                print(f"peak {i:3}. {wavel[peaksI[i]]:4} nm. A = {peaksH[i]:.2f}")

        graph.legend(fontsize=self.fontSize_legends)

        if filename is not None: self.fig.savefig(filename, dpi=300, bbox_inches='tight')
    
        return
        
