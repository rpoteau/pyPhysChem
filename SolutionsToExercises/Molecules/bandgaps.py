import os
from pymatgen.io.cif import CifWriter
from mp_api.client import MPRester

# === Create output folder ===
os.makedirs("ML-data/bandgaps", exist_ok=True)
os.makedirs("ML-data/bandgaps/cifs", exist_ok=True)

df.to_csv("ML-data/bandgaps/MaterialsProject-bandgap.csv", index=False)
print(f"✅ MaterialsProject-bandgap.csv saved in ML-data/bandgaps, with {len(df)} crystal structures")
mpr = MPRester()
for i, m in enumerate(df["material_id"]):
    # Fetch structure for the material
    structure = mpr.get_structure_by_material_id(m)
    if structure:
        filepath = f"ML-data/bandgaps/cifs/{m}.cif"
        CifWriter(structure).write_file(filepath)
        print(f"💾 {i:5d}. {filepath} saved")
print(f"✅ {len(df)} cif files saved in ML-data/bandgaps/cif")

