Couple of scripts I thought I'd share. These were created to help groom my TV/Movies/Music folders and clean up my local mess.

checkforempty.ps1:
The will search the parent folder for subfolders which don't contain anything so you can tidy up!
$filetypes should be relatively self explanatory. This is just file that would be contained within the folders.
$ignoredDirectories is subfolders that you like to have that might just have some mess in there that you're aware of (but it's consistent mess).

checkforduplicates.ps1: 
This will compare a list of folders to check if you have duplicates of the same thing. It has a bit of 'fuzzy logic' that will stop at the first ( and only compare there. That was specifically for me but you could easily alter this to stop at any given control character that you like. If there are matching names prior to the ( then it will return those in a list so you can tidy up.
