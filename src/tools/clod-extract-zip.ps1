# This script is primarily intended for use internally within CLOD scripts.
# We use it to extract zip archives, particularly 7-zip itself.

[System.Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem')
[System.IO.Compression.ZipFile]::ExtractToDirectory($args[0], $args[1])
