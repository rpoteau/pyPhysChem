import os
import sys
import subprocess

def setup_environment():
    # 1. Check if pyphyschemtools is already installed
    try:
        import pyphyschemtools
        print("✅ pyphyschemtools is already installed.")
    except ImportError:
        print("📦 pyphyschemtools not found. Installing...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "-q", "pyphyschemtools"])
        print("✅ Installation successful.")
    
    # 2. Specific setup for Google Colab
    if 'google.colab' in str(get_ipython()):
        print("☁️ Colab detected. Fetching repository files...")
        repo_name = "pyPhysChem"
        
        # Avoid cloning multiple times if the cell is re-run
        if not os.path.exists(repo_name) and not os.getcwd().endswith(repo_name):
            subprocess.check_call(["git", "clone", "--depth", "1", f"https://github.com/rpoteau/{repo_name}.git"])
            os.chdir(repo_name)
        
        # Ensure the local folders (solutions, etc.) are in the Python path
        if os.getcwd() not in sys.path:
            sys.path.append(os.getcwd())
            
    print("🚀 Environment is ready.")

setup_environment()