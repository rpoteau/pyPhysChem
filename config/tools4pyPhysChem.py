__author__ = "Romuald POTEAU"
__maintainer__ =  "Romuald POTEAU"
__email__ = "romuald.poteau@utoulouse.fr"
__status__ = "Development"

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
#                       Chemistry
############################################################

import py3Dmol
import io
from ase import Atoms

class molView:
    """
    Display molecular structures in py3Dmol from various sources:
    - XYZ/PDB/etc. file
    - XYZ-format string
    - PubChem CID
    - ASE Atoms object

    Two visualization styles are available:
      - 'bs'  : ball-and-stick (default)
      - 'cpk' : CPK space-filling spheres (with adjustable size)
      
    Upon creation, an interactive 3D viewer is shown directly
    in a Jupyter notebook cell.

    Parameters
    ----------
    mol : str or ase.Atoms
        The molecular structure to visualize.
        - If `source='file'`, this should be a path to a structure file (XYZ, PDB, etc.)
        - If `source='mol'`, this should be a string containing the structure (XYZ, PDB...)
        - If `source='cid'`, this should be a PubChem CID (string or int)
        - If `source='ase'`, this should be an `ase.Atoms` object
    source : {'file', 'mol', 'cid', 'ase'}, optional
        The type of the input `mol` (default: 'file').
    style : {'bs', 'cpk'}, optional
        Visualization style (default: 'bs').
        - 'bs'  → ball-and-stick
        - 'cpk' → CPK space-filling spheres
    cpk_scale : float, optional
        Overall scaling factor for sphere size in CPK style (default: 0.5).
        Ignored when `style='bs'`.
    w : int, optional
        Width of the viewer in pixels (default: 600).
    h : int, optional
        Height of the viewer in pixels (default: 400).

    Examples
    --------
    >>> molView("molecule.xyz", source="file")
    >>> molView(xyz_string, source="mol")
    >>> molView("2244", source="cid")   # PubChem benzene
    >>> from ase.build import molecule
    >>> molView(molecule("H2O"), source="ase")
    """

    def __init__(self, mol, source='file', style='bs', cpk_scale=0.6, w=600, h=400):
        self.mol = mol
        self.source = source
        self.style = style
        self.cpk_scale = cpk_scale
        self.w = w
        self.h = h
        self.view()

    def view(self):
        def ase2xyz(atoms: Atoms) -> str:
            """
            Convert an ASE Atoms object into an XYZ-format string.
        
            This is useful when you want to pass atomic structures directly
            to visualization tools such as py3Dmol without creating a file on disk.
        
            Parameters
            ----------
            atoms : ase.Atoms
                The atomic structure to export.
        
            Returns
            -------
            str
                The XYZ-formatted structure as a string.
            """
            buf = io.StringIO()
            write(buf, atoms, format="xyz")
            xyz_string = buf.getvalue()
            buf.close()
            return xyz_string

        # Create viewer for all but CID
        if self.source == 'file':
            v = py3Dmol.view(width=self.w, height=self.h)
            with open(self.mol) as ifile:
                moltxt = ifile.read()
            v.addModel(moltxt)

        elif self.source == 'mol':
            v = py3Dmol.view(width=self.w, height=self.h)
            v.addModel(self.mol, "xyz")
        
        elif self.source == 'cif':
            v = py3Dmol.view(width=self.w, height=self.h)
            v.addModel(self.mol, "cif")  # <-- explicitly declare CIF
            v.addUnitCell()

        elif self.source == 'cid':
            v = py3Dmol.view(query=f'cid:{self.mol}', width=self.w, height=self.h)
            self._apply_style(v)
            v.setHoverable({}, True, 
                "function(atom,viewer,event,container) { viewer.addLabel(atom.elem+atom.serial,{position:atom, backgroundColor:'black'}); }",
                "function(atom,viewer) { viewer.removeAllLabels(); }")
            v.zoomTo()
            v.zoom(0.9)
            v.show()
            return
        
        elif self.source == 'ase':
            if not isinstance(self.mol, Atoms):
                raise TypeError("Expected an ASE Atoms object for source='ase'")
        
            v = py3Dmol.view(width=self.w, height=self.h)
            xyz_str = ase2xyz(self.mol)
            v.addModel(xyz_str, "xyz")

        # Apply chosen style
        self._apply_style(v)
        v.setHoverable({}, True, 
            "function(atom,viewer,event,container) { viewer.addLabel(atom.elem+atom.serial,{position:atom, backgroundColor:'black'}); }",
            "function(atom,viewer) { viewer.removeAllLabels(); }")
        v.zoomTo()
        v.zoom(0.9)
        v.show()
        
    def _apply_style(self, v):
        """Apply either ball-and-stick or CPK style."""
        if self.style == 'bs':
            v.setStyle({'sphere': {'scale': 0.25, 'colorscheme': 'element'},
                        'stick': {'radius': 0.15}})
        elif self.style == 'cpk':
            v.setStyle({'sphere': {'scale': self.cpk_scale,
                                   'colorscheme': 'element'}})
        else:
            raise ValueError("style must be 'bs' or 'cpk'")


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


############################################################
#                       Survey
############################################################

import os, json, yaml, pandas as pd
from datetime import datetime
from IPython.display import display
from ipywidgets import VBox, HTML, Button, IntSlider, Text, Textarea, Layout, HBox, Dropdown

class SurveyApp:
    def __init__(self, mode="participant", base_dir="ML-survey"):
        self.mode = mode
        self.base_dir = base_dir
        self.responses_dir = os.path.join(base_dir, "responses")
        self.summary_dir = os.path.join(base_dir, "summary")
        os.makedirs(self.responses_dir, exist_ok=True)
        os.makedirs(self.summary_dir, exist_ok=True)
        self.questions, self.blocks = self.load_questions()

    def load_questions(self):
        yaml_path = os.path.join(self.base_dir, "survey_questions.yaml")
        with open(yaml_path, "r") as f:
            data = yaml.safe_load(f)
        questions, blocks = {}, {}
        for b, v in data["blocks"].items():
            blocks[b] = (v["title"], v["subtitle"])
            for qid, qtext in v["questions"].items():
                questions[qid] = qtext
        return questions, blocks

    # === UI Builder ===
    def run(self):
        if self.mode == "participant":
            self.build_participant_form()
        elif self.mode == "admin":
            self.build_admin_dashboard()

    # === Participant Mode ===
    def build_participant_form(self):
        colors = ["#f7f9fc", "#f0f0f0"]
        base_styles = {
            "title": "font-size:18px;font-weight:bold;margin-top:5px;",
            "subtitle": "color:#444;font-style:italic;font-size:13px;margin-bottom:8px;",
            "warn": "color:#CC0000;font-size:12px;font-style:italic;",
        }

        self.name_box = Text(description="Name (optional):", placeholder="Anonymous")
        self.full_form = [self.name_box]
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
            for q, txt in self.questions.items():
                if q.startswith(block):
                    block_widgets.append(HTML(f"<b>{txt}</b>"))
                    if "(1 =" in txt:
                        w = IntSlider(value=0, min=0, max=5, step=1,
                                      description='', layout=Layout(width="35%"))
                    else:
                        w = Textarea(placeholder="Write your answer here...",
                                     layout=Layout(width="85%", height="60px"))
                    warn = HTML("")
                    self.input_controls.append(w)
                    self.warn_labels.append(warn)
                    block_widgets.extend([w, warn])
            block_widgets.append(HTML(footer_html))
            self.full_form.extend(block_widgets)
            block_index += 1

        # === Buttons ===
        btn_layout = Layout(width="220px", height="40px", margin="3px 6px 3px 0")
        self.save_button = Button(description="💾 Save draft", button_style="info", layout=btn_layout)
        self.load_button = Button(description="📂 Load draft", button_style="warning", layout=btn_layout)
        self.submit_button = Button(description="✅ Submit", button_style="success", layout=btn_layout)
        self.status_label = HTML(value="", layout=Layout(margin="10px 0px"))

        self.save_button.on_click(self.save_draft)
        self.load_button.on_click(self.load_draft)
        self.submit_button.on_click(self.submit_form)

        self.full_form.append(VBox([self.save_button, self.load_button, self.submit_button, self.status_label]))
        display(VBox(self.full_form))

    # === Actions ===
    def save_draft(self, b):
        data = self._collect_data()
        name = data["name"]
        base_name = f"Draft_{name.replace(' ', '_')}"
        existing = [f for f in os.listdir(self.responses_dir) if f.startswith(base_name)]
        filename = os.path.join(self.responses_dir, f"{base_name}_v{len(existing)+1}.json")
        with open(filename, "w") as f: json.dump(data, f, indent=2)
        self.status_label.value = f"<div style='background:#fff4e5;color:#b35900;padding:6px;border:1px solid #b35900;border-radius:6px'>💾 Draft saved as <code>{os.path.basename(filename)}</code></div>"

    def load_draft(self, b):
        files = [f for f in os.listdir(self.responses_dir) if f.endswith(".json")]
        if not files:
            self.status_label.value = "<div style='color:#a00'>⚠ No draft found.</div>"
            return
        filename = os.path.join(self.responses_dir, files[-1])
        with open(filename, "r") as f:
            data = json.load(f)
        for i, (q, _) in enumerate(self.questions.items()):
            if q in data:
                w = self.input_controls[i]
                val = data[q]
                if isinstance(w, IntSlider): w.value = int(val)
                else: w.value = str(val)
        self.status_label.value = f"<div style='background:#fff4e5;color:#b35900;padding:6px;border:1px solid #b35900;border-radius:6px'>📂 Loaded {os.path.basename(filename)}</div>"

    def submit_form(self, b):
        data = self._collect_data()
        filename = os.path.join(self.responses_dir, f"Response_{data['name'].replace(' ', '_')}_{datetime.now().strftime('%Y%m%d_%H%M')}.csv")
        pd.DataFrame([data]).to_csv(filename, index=False)
        self.status_label.value = f"<div style='background:#e6ffe6;color:#060;padding:6px;border:1px solid #060;border-radius:6px'>✅ Response saved to <code>{filename}</code></div>"

    def _collect_data(self):
        data = {q: w.value for q, w in zip(self.questions.keys(), self.input_controls)}
        data["name"] = self.name_box.value or "Anonymous"
        return data

    # === Admin mode ===
    def build_admin_dashboard(self):
        files = [f for f in os.listdir(self.responses_dir) if f.endswith(".csv")]
        if not files:
            print("No responses yet.")
            return
        df = pd.concat([pd.read_csv(os.path.join(self.responses_dir, f)) for f in files], ignore_index=True)
        display(df.describe())

