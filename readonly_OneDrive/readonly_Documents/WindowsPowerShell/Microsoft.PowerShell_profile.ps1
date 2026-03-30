function prompt {
    $esc = [char]27
    $success = $?

    # colors (Leonardo palette)
    $amber   = "$esc[38;2;212;162;78m"
    $sage    = "$esc[38;2;138;154;107m"
    $slate   = "$esc[38;2;123;143;163m"
    $terra   = "$esc[38;2;194;90;74m"
    $dim     = "$esc[38;2;74;67;57m"
    $fg      = "$esc[38;2;221;213;196m"
    $reset   = "$esc[0m"

    $user = "$slate$env:USERNAME$dim"

    # path
    $path = (Get-Location).Path
    $home_path = $env:USERPROFILE
    if ($path.StartsWith($home_path)) {
        $path = "~" + $path.Substring($home_path.Length)
    }

    # git branch
    $git = ""
    $branch = git branch --show-current 2>$null
    if ($branch) {
        $dirty = git status --porcelain 2>$null
        if ($dirty) {
            $git = " $sage$branch$terra*$reset"
        } else {
            $git = " $sage$branch$reset"
        }
    }

    # prompt symbol
    $symbol = if ($success) { "$dim>$reset " } else { "$terra>$reset " }
    "$amber$path$reset$git $symbol"
}

function task {
  wsl task @args
}

setx XDG_CONFIG_HOME "$HOME\.config" > $null
setx GLAZEWM_CONFIG_PATH "$HOME\.config\glazewm\config.yaml" > $null

$vimcfg = "$XDG_CONFIG_HOME\nvim\init.lua"
$wezcfg = "$XDG_CONFIG_HOME\wezterm\wezterm.lua"
$glzcfg = "$GLAZEWM_CONFIG_PATH"

Set-Alias vim nvim

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })
