import h5py
import os
import numpy as np
from functools import partial

# ---- Helper function for visititems ----
def collect_target_datasets(name, obj, targets, found):
    """
    Check if a dataset name contains one of the target substrings.
    Update the found dictionary in place.
    """
    for key, target in targets.items():
        if found[key] is None and target in name:
            found[key] = name

# ---- Main functions ----
def find_matching_keys(h5_file):
    """
    Traverse the HDF5 file and return the paths corresponding to target datasets.
    """
    targets = {
        "eiger_image": "scan_data/eiger_image",
        "position_x": "i11-c-c08__ex__tab-mt_tx.4/position",
        "position_z": "i11-c-c08__ex__tab-mt_tz.4/position",
        "basler_image": "i11-c-c08__dt__basler_analyzer/image"
    }
    found = {key: None for key in targets}

    # Use functools.partial to pass extra arguments without defining a nested function
    h5_file.visititems(partial(collect_target_datasets, targets=targets, found=found))

    return found["eiger_image"], found["position_x"], found["position_z"], found["basler_image"]


def extract_images_from_nxs(nxs_path):
    """
    Extract Eiger, Basler images and X/Z positions from a .nxs file.
    """
    with h5py.File(nxs_path, 'r') as f:
        k_eiger, k_x, k_z, k_basler = find_matching_keys(f)

        if k_eiger is None:
            raise KeyError(f"Eiger dataset not found in {nxs_path}")

        eiger_image = f[k_eiger][()]
        pos_x = f[k_x][()] if k_x else None
        pos_z = f[k_z][()] if k_z else None
        basler_image = f[k_basler][()] if k_basler else None

    position = np.stack((pos_x, pos_z), axis=-1) if pos_x is not None and pos_z is not None else None

    if eiger_image.ndim == 4:
        eiger_image = np.transpose(eiger_image, (0, 2, 3, 1))

    return eiger_image, position, basler_image


def extract_nxs_folder(folder_path):
    """
    Traverse a folder, read all .nxs files, return concatenated datasets,
    and save the Eiger data in the current working directory.
    """
    nxs_files = sorted(
        os.path.join(folder_path, f) 
        for f in os.listdir(folder_path) 
        if f.lower().endswith(".nxs")
    )

    eiger_data, position_data, basler_data = [], [], []

    for i, nxs_file in enumerate(nxs_files, start=1):
        eiger, pos, basler = extract_images_from_nxs(nxs_file)
        eiger_data.append(eiger)
        position_data.append(pos)
        basler_data.append(basler)
        # Afficher seulement tous les 10 fichiers
        if i % 10 == 0 or i == len(nxs_files):
            print(f"{i}/{len(nxs_files)} files processed")
        #print(f"{i}/{len(nxs_files)} files processed")

    eiger_data = np.array(eiger_data)
    position_data = np.array(position_data)
    basler_data = np.array(basler_data)

    return eiger_data, position_data, basler_data

