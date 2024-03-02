Add-Type -AssemblyName System.Speech

[Console]::Beep(800, 300)
[Console]::Beep(800, 300)
[Console]::Beep(800, 300)

$speechSynthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speechSynthesizer.Volume = 100
$speechSynthesizer.Speak('Warning, power mode switched to battery.')
