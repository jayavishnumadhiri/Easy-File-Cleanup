# Powershell-Automation-Tasks

Author: Jayavishnu Madhiri

Task  : Easy File Cleanup Script for Windows

Language: PowerShell

Tools : Powershell ISE

Description:

This PowerShell script, offers a streamlined solution for deleting the Un-necessary files in a directory or in given path. It begins by identifying files that haven't been accessed in the past year within a specified directory or path. The script then presents these files in a table format, allowing users to choose which files to keep or delete.user have to give the index numbers of the particular files which we have to keep it safe. Upon receiving user input, it deletes and  calculates the total memory that will be freed up by deleting the remining unselected files and provides a preview of the operation without actually executing it.

Features:

•	Efficiently identifies and lists files older than a year in a specified directory.
•	Provides a user-friendly interface to select files for deletion based on their indexes.
•	Calculates and displays the total memory that will be freed up by deleting the unnecessary files.
•	Implements safety measures by previewing the deletion operation without actually executing it (-WhatIf parameter).

How to Use:

1.	Run the script in a PowerShell environment with Admin Priviliges.
2.	Review the listed files and their corresponding indices.
3.	Input the indices of the files you wish to retain, separated by commas.
4.	The script will calculate the memory to be freed up and preview the deletion operation.
5.	Confirm the operation to free up the specified memory.
   
Note: This script is designed for Windows environments and requires PowerShell to run. Be cautious when deleting files, as the operation cannot be undone.

