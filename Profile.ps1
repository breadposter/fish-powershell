# Create fish-like prompt (supposedly, I've never used fish) that shrinks
# directories in the prompt other than the current one to a single letter.
function prompt {
    $dirs = ('' + $(Get-Location)).Split("\")
    $prompt = $dirs[0]

    if ($dirs[1] -eq "") { return ($prompt + "> ") }

    if ($dirs.Length -gt 2) {
        $start = $dirs[1..($dirs.Length-2)]
        Foreach ($item in $start) {
            $prompt = $prompt + "\" + $item[0]
        }
    }

    $end = $dirs[-1]


    $prompt = $prompt + "\" + $end + "> "
    $prompt
}
