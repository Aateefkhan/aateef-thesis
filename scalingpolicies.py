from __future__ import division
import os
import sys

con_cpu = (sys.argv[1])
con_cpuint = [int(con_cpu)]

con_mem = (sys.argv[2])
con_memint = int(con_mem)

con_disk = (sys.argv[3])
con_diskint = int(con_disk)

docker_name = (sys.argv[4])

print "-----------------------------------------DYNAMIC RESOURCE SCALING------------------------------------"
for cpu in cpu_int:
 if cpu > 75:
    os.system("docker run --name figlet2 functions/figlet")
    os.system("docker start figlet2")
    print " "
    print("The CPU percentage was increased more than threshold, scaling-out is performed")
 else:
    os.system("docker stop figlet2")
    os.system("docker rm figlet2")
    print " "
    print("The CPU percentage was less than 75%, scaling-in is performed")
 if con_memint > 75: 
    os.system("docker run --name figlet2 functions/figlet")
    os.system("docker start figlet2")
    print " "
    print("The CPU percentage was increased more than threshold, scaling-out is performed")
 else:
    os.system("docker stop figlet2")
    os.system("docker rm figlet2")
    print " "
    print("The CPU percentage was less than 75%, scaling-in is performed")
 if con_diskint > 3:
    os.system("docker volume create figletvolume")
    os.system("docker commit figlet figletv2")
    os.system("docker run --name figlet2 -v figletvolume figletv2")
    os.system("docker start figletv2")
 else
    os.system("docker rm volume figletvolume")


