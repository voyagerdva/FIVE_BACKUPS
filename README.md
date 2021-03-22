# FIVE_BACKUPS #

1. create_exhibit.sh - run it for create exhibit only. It will make four directories with eight files *.tar.gz each
2. clean_backups.sh - run it for cleaning that folders. It will remove all files *.tar.gz except for last five archives.
3. test.sh - run it if you want to test this script. It will perform all steps itself:
    - creating test directories wirh files inside;
    - cleaning;
    - check result according to etalon checklist (list_etalon.txt).
