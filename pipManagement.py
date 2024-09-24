#!/usr/bin/env python3
# coding: utf-8
import os
import sys
from datetime import datetime

#today = date.today()
#date = today.strftime("%Y%m%d")
pMversion = "20231102"

#adapt "PythonFolder" to your case
PythonFolder = "Python3"
PHome = "~" + "/" + PythonFolder + "/"
PHomePython = os.path.expanduser('~') + "/" + PythonFolder + "/"

#adapt "venv" to your case. These are virtual environments created with the virtualenv command (https://virtualenv.pypa.io/en/latest/index.html)
# in the present case, 3 virtual environments were created: base, ML and ai4Chem. They will be addressed with the a, b and c characters
venv = {"a":"base","b":"ML","c":"nmr","d":"ai4chem","e":"spektral"}
#venv = {"a":"base","b":"ML"} #VM

string = "\n\033[91m\033[1mWhich command?\033[0m\n\
\033[1m# Output installed packages in requirements format\033[0m\n\
1. pip freeze > requirements.txt\n\
\033[1m# verify installed packages have compatible dependencies\033[0m\n\
2. pip check\n\
\033[0m# List installed packages, including editables; possibility to list only packages that are not dependencies of installed packages\033[0m\n\
\033[32m3. pip list\033[0m\n\
4. pip list --not-required\n\
\033[1m# display the installed python packages in form of a dependency tree\033[0m\n\
5. pipdeptree\n\
\033[1m# pip-review is a convenience wrapper around pip. It can list available updates by deferring to pip list --outdated. It can also automatically or interactively install available updates for you by deferring to pip install\033[0m\n\
6. pip list --outdated\n\
7. pip list --outdated --not-required\n\
8. pip-review\n\
\033[1m# pip-check gives a quick overview of all installed packages and their update status. Under the hood it calls ``pip list --outdated --format=columns``\033[0m\n\
9. pip-check --hide-unchange\n\
\033[32m10. pip-check --hide-unchanged --show-updated\033[0m\n\
\033[32m11. pip-check --hide-unchanged --not-required --show-update\033[0m\n\
\033[1m# install a new package\033[0m\n\
\033[32m15. pip install package-name\033[0m\n\
\033[1m# uninstall a package\033[0m\n\
\033[32m16. pip uninstall package-name\033[0m\n\
\033[1m# upgrade packages\033[0m\n\
\033[32m20. pip install -r requirements.txt --upgrade\033[0m\n\
21. pip install --upgrade package_name(s)\n\
22. pip-review --local --interactive\n\
\033[1m# restore an environment\033[0m\n\
\033[32m23. pip uninstall $(pip freeze); pip install -r requirements.txt\033[0m\n\
\033[1m# list current environments\033[0m\n\
30. ls -d */ " + PHome + "\n\
\033[1m# Clone one virtual environment into a new one, using a previously saved requirements.txt file\033[0m\n\
40. virtualenv New_Env_Name; activate New_Env_Name; pip install -r requirements.txt \n\
\033[1m# Make a new empty virtual environment\033[0m\n\
41. virtualenv New_Env_Name \n\
\n\033[91m\033[1mx. Exit\033[0m"


choice = ""
catenvNN = ""
listenv = ""
for i in venv:
    catenvNN = catenvNN + i + " ,"
    listenv = listenv + i + ": " + venv[i] + ". "

print(f"\033[34;1mpipManagement v.{pMversion}\033[0m")
while choice != "x":
    print(f'{string}')
    print()
    now = datetime.utcnow().strftime("%Y%m%dT%H%M%S")

    envNN = ""
    env = ""
    choice = input("enter a number (or x to terminate): ")
    if choice == "x":
        sys.exit()
    while envNN not in venv and choice not in ["30","40","41"]:
        strinput = "Which virtualenv environment? " + listenv
        envNN = input(strinput)
        if envNN in venv:
            env = venv[envNN]
        else:
            print(f"You must specify an existing environment ({catenvNN[:-2]})")
    pyAct = "source " + PHome + env + "/bin/activate;\n"
    
    pipCom = ""
    if choice == "1":
        pipCom = pyAct + "cd " + PHome + ";\n"
        pipCom = pipCom + "pip freeze > " + str(now) + "requirements_" + env + ".txt"
    if choice == "2":
        pipCom = pyAct + "pip check"
    if choice == "3":
        pipCom = pyAct + "pip list"
    if choice == "4":
        pipCom = pyAct + "pip list --not-required"
    if choice == "5":
        pipCom = pyAct + "pipdeptree"
    if choice == "6":
        pipCom = pyAct + "pip list --outdated"
    if choice == "7":
        pipCom = pyAct + "pip list --outdated --not-required"
    if choice == "8":
        pipCom = pyAct + "pip-review"
    if choice == "9":
        pipCom = pyAct + "pip-check --hide-unchanged"
    if choice == "10":
        pipCom = pyAct + "pip-check --hide-unchanged --show-update"
    if choice == "11":
        pipCom = pyAct + "pip-check --hide-unchanged --not-required --show-update"
    if choice == "15":
        package_names = input("copy/paste the name of the package(s) you want to install (x = cancel operation): ")
        if package_names != "x":
            reqBefore = str(now) + "requirements_" + env + "_BeforeNewInstall.txt"
            pipCom = pyAct + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_BeforeNewInstall.txt;\n"
            pipCom = pipCom + "pip install " + package_names + " ;\n"
            pipCom = pipCom + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_AfterNewInstall.txt"  
        else:
            pipCom = "echo operation cancelled"
    if choice == "16":
        package_names = input("copy/paste the name of the package(s) you want to uninstall (x = cancel operation): ")
        if package_names != "x":
            pipCom = pyAct + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_BeforeUninstall.txt;\n"
            pipCom = pipCom + "pip uninstall " + package_names + " -y ;\n"
            pipCom = pipCom + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_AfterUninstall.txt"  
        else:
            pipCom = "echo operation cancelled"
    if choice == "20":
        systemCom = "cd " + PHome + ";\n ls -lrt *req*.txt |grep " + env
        os.system(systemCom)
        reqtxt = input("copy/paste the reference requirements/txt file: ")
        pipCom = pyAct + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_BeforeUpdate.txt;\n"
        os.chdir(PHomePython)
        print (os.getcwd())
        reqtxtTmp = reqtxt + "_tmp"
        finp = open(reqtxt, "rt")
        fout = open(reqtxtTmp, "wt")
        for line in finp:
        	fout.write(line.replace('==', '>='))
        print(f"{reqtxtTmp} created after {reqtxt} with '==' replaced with '>='")
        finp.close()
        fout.close()
        pipCom = pipCom + "pip install -r " + PHome + reqtxtTmp + " --upgrade;\n"
        pipCom = pipCom + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_AfterUpdate.txt"
    if choice == "21":
        package_names = input("copy/paste the name of the package(s) you want to update (x = cancel operation): ")
        if package_names != "x":
            pipCom = pyAct + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_BeforeUpdate.txt;\n"
            pipCom = pipCom + "pip install --upgrade " + package_names + " ;\n"
            pipCom = pipCom + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_AfterUpdate.txt"  
        else:
            pipCom = "echo operation cancelled"
    if choice == "22":
        pipCom = pyAct + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_BeforeUpdate.txt;\n"
        pipCom = pipCom + "pip-review --local --interactive;\n"
        pipCom = pipCom + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_AfterUpdate.txt"
    if choice == "23":
        systemCom = "cd " + PHome + ";\n ls -lrt *req*.txt |grep " + env
        os.system(systemCom)
        reqtxt = input("copy/paste the reference requirements/txt file you want to restore: ")
        pipCom = pyAct + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_BeforeRestoration.txt;\n"
        pipCom = pipCom + "pip uninstall $(pip freeze) -y;\n"
        pipCom = pipCom + "pip install -r " + PHome + reqtxt + ";\n"
        pipCom = pipCom + "pip freeze > " + PHome + str(now) + "requirements_" + env + "_AfterRestoration.txt"
    if choice == "30":
        pipCom = "cd " + PHome + ";\nls -d */"
        print()
        print(f"virtualenv defined in the present script: {listenv}")
        print()
    if choice == "40":
        NewEnvTxt = input("Name of the new environment: ")
        systemCom = "cd " + PHome + ";\nvirtualenv " + NewEnvTxt + ";\n ls -lrt *req*.txt"
        os.system(systemCom)
        ReqTxt = input(f"\033[33mcopy/paste from the previous list the reference requirements.txt file, i.e. the environment you want to clone: \033[0m")
        pyAct = "source " + PHome + NewEnvTxt + "/bin/activate;\n"
        pipCom = pyAct + " pip install -r " + PHome + ReqTxt + ";\n"
    if choice == "41":
        NewEnvTxt = input("Name of the new environment: ")
        systemCom = "cd " + PHome + ";\nvirtualenv " + NewEnvTxt
        os.system(systemCom)
    print(f"\033[94m\033[1m{pipCom}\033[0m")
    if choice in ["6","7","8","9","10","11"]:
       print(f"\033[31mWait...\033[0m")
    os.system(pipCom)
    if choice in ["20"]:
        print(f"Now deleting {reqtxtTmp}")
        os.remove(reqtxtTmp)
    if choice in ["15"]:
        print(f"\033[31mCheck carefully the previous installation messages. In case of any doubt, run command \033[31;1m#2\033[0m\033[31m (pip check)\033[0m")
    if choice in ["40"]:
        print(f"\033[31mDon't forget to add \033[31;1m{NewEnvTxt}\033[0m\033[31m in the venv variable of the present pipManagement.py script\033[0m")
    if choice in ["15","16","20","21","23"]:
        if choice in ["15","21"]:
            print(f"\033[31mCheck carefully the previous installation messages, as well as the foregoing \033[31;1mpip check command\033[0m")
        print(f"\033[31;1mNow checking if dependencies are still OK\033[0m (expecting 'No broken requirements found)'")
        pipCom = pyAct + "pip check"
        os.system(pipCom)
        if choice in ["15","21"]:
            print(f"\033[31mIf you want to revert to the previous configuration, run command \033[31;1m#23\033[0m\033[31m (pip install -r requirements.txt), with the \033[31;1m{reqBefore}\033[0m\033[31m file")
    choice = input(f"\n\033[32mPress Enter to continue or x to exit...\033[0m")
