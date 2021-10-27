import os
def find_names():
    names=["Ariel","Emily"]

    Box=os.uname().nodename
    if names[0] in Box:
        otherBox=names[1]+"_Box"
        Box=names[0]+"_Box"
    else:
        otherBox=names[0]+"_Box"
        Box=names[1]+"_Box"
    return [Box,otherBox]