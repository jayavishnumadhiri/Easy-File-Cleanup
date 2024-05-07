cls
$c=0
# Give Folder path here
$f = Get-ChildItem -Path E:\Downloads | Where-Object{$_.LastAccessTime -le (Get-Date).AddDays(-366)}
$f

$data = @()

$f | ForEach-Object {
      $co = [PSCustomObject]@{
        
    "index" = $c++
    "Filename" = $_.Name
    "fileSize_mb" = [math]::Round(($_.Length/1mb),2)
    "Path" = $_.FullName
    
      
      }

      $data += $co

}

$data | Format-Table




$inputString = Read-Host "Enter indices of the files u dont want to delete seperate by Comma ','"

$filesnotremove = $inputString.Split(',') | ForEach-Object { [int]$_ } | Sort-Object 

$mem = 0

$data | ForEach-Object {

   if ($_.index -notin $filesnotremove){
        
       $mem +=$_.fileSize_mb
       
        Remove-Item -Path $_.path -Force -WhatIf  # Remove -whatIf To delete the files 
   
   } 
  
}

Write-Host "afer deletion free up memory "$mem -BackgroundColor Red

