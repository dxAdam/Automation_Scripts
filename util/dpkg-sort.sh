# print all packages sorted by size
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n
