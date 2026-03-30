$GH = "C:\Users\jamlung\Documents\gh_2.87.0_windows_amd64\bin\gh.exe"
$REPO = "OpenConceptLab/ocl_issues"
$SEPARATOR = "---------------------------------------------"

# Fetch all open issues with no project
$raw = & $GH issue list --repo $REPO --state open --limit 500 --json number,title,projectItems 2>&1
$all = $raw | ConvertFrom-Json
$unassigned = $all | Where-Object { $_.projectItems.Count -eq 0 } | Sort-Object number

Write-Host "Fetching details for $($unassigned.Count) unassigned issues..."
Write-Host ""

$results = @()

foreach ($issue in $unassigned) {
    $detail = & $GH issue view $issue.number --repo $REPO --json number,title,state,milestone,labels,assignees,createdAt,updatedAt,body 2>&1 | ConvertFrom-Json

    $milestone = if ($detail.milestone) { $detail.milestone.title } else { "(none)" }
    $labels    = ($detail.labels | ForEach-Object { $_.name }) -join ", "
    $assignees = ($detail.assignees | ForEach-Object { $_.login }) -join ", "
    $created   = $detail.createdAt.Substring(0, 10)
    $updated   = $detail.updatedAt.Substring(0, 10)
    $url       = "https://github.com/$REPO/issues/$($detail.number)"
    $bodyClean = $detail.body -replace "`r`n", " " -replace "`n", " " -replace "`r", " "

    $bodyPreview = if ($bodyClean.Length -gt 300) { $bodyClean.Substring(0, 300) + "..." } else { $bodyClean }

    $results += [PSCustomObject]@{
        Number    = $detail.number
        Title     = $detail.title
        State     = $detail.state
        Milestone = $milestone
        Labels    = $labels
        Assignees = $assignees
        Created   = $created
        Updated   = $updated
        URL       = $url
        Body      = $bodyClean
    }

    Write-Host $SEPARATOR
    Write-Host "#$($detail.number)  $($detail.title)"
    Write-Host "  URL:       $url"
    Write-Host "  Milestone: $milestone"
    Write-Host "  Labels:    $labels"
    Write-Host "  Assignees: $assignees"
    Write-Host "  Created:   $created   Updated: $updated"
    Write-Host "  Body:      $bodyPreview"
    Write-Host ""
}

# Export to CSV
$csvPath = Join-Path $PSScriptRoot "unassigned-issues-detail.csv"
$results | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8
Write-Host "Exported to: $csvPath"
