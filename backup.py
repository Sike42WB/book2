import os
import shutil
import platform
import datetime

filename = "roku"
format = "zip"



def jenkinsBuild():
    currentDirectory = os.getcwd()

    print(currentDirectory)

    x = currentDirectory.find("../.vs/var/snap/jenkins/")

    print(x)

    pullBuildNumber = "NONE"
    if x != -1:
        print("found jenkins pipeline ")
        pullBuildNumberArray = currentDirectory.split(".vs/var/snap/jenkins/")
        print(pullBuildNumberArray[0])
        print(pullBuildNumber[1])
        pullBuildNumber = pullBuildNumberArray[1].replace(".vs/workspace/test","")

    return pullBuildNumber

def checkOS():
    osPath = "/"
    if platform.system() == "Windows":
        osPath = "\\"
    elif platform.system() == "Linux":
        osPath = "/"
    elif platform.system() == "Darwin":
        osPath = "/"

    return osPath


slash = checkOS()

tempBuild = os.getcwd()


print(tempBuild)

x = tempBuild.find( jenkinsBuild() )
if x != -1:
    print("found jenkins pipeline  "  +  jenkinsBuild() )
    tempBuild = ".vs/var/snap/jenkins/" + jenkinsBuild()  + ".vs/workspace/test"
    print(tempBuild)   



tempBuild = tempBuild + slash + "src" + slash + "code"
print(tempBuild)
print(" path we are changing to  .... ")
os.chdir(tempBuild)

t = str(datetime.datetime.now())
t = t.replace(".","_")
t = t.replace(":","_")
t = t.replace(" ","_")
t = t.replace("-","_")

print(t)


# Source path 
source = "roku.zip"

# Destination path 
dest = "backup-roku" + t + ".zip"

# Print file permission 
# of the source 
# perm = os.stat(source).st_mode 
#  print("File Permission mode:", perm, "\n") 

# Make sure user has permissions for folder
# 
# shutil.copyfile("wbd-roku.zip",  dest)
print( " almost done ")

# C:\Users\sike4\source\repos\screeners-app-fyc-roku\Roku\src\code

shutil.make_archive(filename, format, tempBuild)