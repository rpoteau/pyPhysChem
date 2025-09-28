import py3Dmol
import io

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

ico = molView("./ML-data/RDFs/coords_3DNPs/ico_030_000.xyz","file")
dec = molView("./ML-data/RDFs/coords_3DNPs/pbpy_040_000.xyz","file")
Oh = molView("./ML-data/RDFs/coords_3DNPs/regfccOh_050_000.xyz","file")
