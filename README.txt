#####################################################################################################
#                                                                                                   #
#    You have a folder that stores backups of a few projects.                                       #
#    Each project lays in a separate folder and each backup is a tarball file with unique name.     #
#    Write a shell script that removes all backups for the given project except the last 5.         #
#                                                                                                   #
#####################################################################################################




1. "create_exhibit.sh" - run it for create exhibit only. It will make four directories with eight files *.tar.gz each
2. "clean_backups.sh" - run it for cleaning that folders. It will remove all files *.tar.gz except for last five archives.
3. "test.sh" - run it if you want to test this script. It will perform all steps itself:
    - creating test directories wirh files inside;
    - cleaning;
    - check result according to etalon checklist (list_etalon.txt).
